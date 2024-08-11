import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../../../core/utils/location_helper.dart';
import '../../doctors/data/models/doctor_model.dart';
import '../../doctors/data/repo/doctors_repo.dart';
import 'ai_assistant_state.dart';

class AiAssistantCubit extends Cubit<AiAssistantState> {
  final DoctorsRepo _aiAssistantRepo;

  AiAssistantCubit(this._aiAssistantRepo) : super(AiAssistantState());

  TextEditingController descriptionController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  Future<void> fetchDoctors() async {
    emit(state.copyWith(isLoading: true));
    try {
      final doctors = await _aiAssistantRepo.fetchDoctors();
      // trainingModel(doctors);
      emit(state.copyWith(doctors: doctors, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  void trainingModel(List<DoctorModel> doctors) async {
    for (var element in doctors) {
      print(element.reviewsList!.first.name.toString());
    }
    debugPrint(
        "description: ${descriptionController.text} address: ${addressController.text}");
    if (descriptionController.text.isEmpty || addressController.text.isEmpty) {
      emit(state.copyWith(
        error: "Please fill all the fields",
        isLoading: false,
        message: "",
        doctorsBasedOnAi: [],
      ));
      return;
    }

    emit(state.copyWith(
      isLoading: true,
      message: "",
      doctorsBasedOnAi: [],
      error: "",
    ));

    var specialists = doctors
        .map((d) => TextPart(
            '''Dr.: ${d.name} is the specialist of ${d.specialist} in ${d.address} with ${d.reviews} reviews and rating of ${d.rating} id: ${d.id} 
             description: ${d.description} image: ${d.image} experience: ${d.experience} patients: ${d.patients} working times: ${d.workTimes}  
             times: ${d.workTimes != null ? d.workTimes!.map((e) => '''from: ${e.from} to: ${e.to} star_time: ${e.startTime} end_time: ${e.endTime}''') : "null"} reviews list: ${d.reviewsList} reviews_items: ${d.reviewsList != null ? d.reviewsList!.map((e) => '''name: ${e.name} description: ${e.description} rating: ${e.rating} image: ${e.image}''') : "null"}'''))
        .toList();

    final model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: 'AIzaSyBwADsNyuaEoEcBySlvfZj3QGEUGgHR22I',
      generationConfig: GenerationConfig(
        // temperature: 0.8,
        // maxOutputTokens: 256,
        // topK: 40,
        // topP: 0.9,
        responseMimeType: "application/json",

        responseSchema: Schema(
          SchemaType.object,
          properties: {
            "doctors": Schema(
              SchemaType.array,
              items: Schema(
                SchemaType.object,
                properties: {
                  "id": Schema(SchemaType.string),
                  "name": Schema(SchemaType.string),
                  "specialist": Schema(SchemaType.string),
                  "address": Schema(SchemaType.string),
                  "reviews": Schema(SchemaType.number),
                  "rating": Schema(SchemaType.number),
                  "image": Schema(SchemaType.string),
                  "description": Schema(SchemaType.string),
                  "experience": Schema(SchemaType.number),
                  "patients": Schema(SchemaType.number),
                  "reviews_list": Schema(
                    SchemaType.array,
                    items: Schema(
                      SchemaType.object,
                      properties: {
                        "name": Schema(SchemaType.string),
                        "description": Schema(SchemaType.string),
                        "rating": Schema(SchemaType.number),
                        "image": Schema(SchemaType.string),
                      },
                    ),
                  ),
                  "work_times": Schema(
                    SchemaType.array,
                    items: Schema(SchemaType.object, properties: {
                      "from": Schema(SchemaType.string),
                      "to": Schema(SchemaType.string),
                      "start_time": Schema(SchemaType.string),
                      "end_time": Schema(SchemaType.string),
                    }),
                  ),
                },
              ),
            ),
          },
        ),
      ),
      systemInstruction: Content.multi(specialists),
    );

    final content = [
      Content.text(
        '''
           Please follow the below instructions:
           -if $specialists description not contains ${descriptionController.text} and ${addressController.text} then don't return any doctors and just return your recommended instructions for enhance the prompt,
            -if the ${descriptionController.text} don't match any description and ${addressController.text} matches any address in the $specialists list then don't return any doctors and just return your recommended instructions for enhance the prompt,
            -if the ${addressController.text} match any address and ${descriptionController.text} don't match any description in the $specialists list  then don't return any doctors and just return your recommended instructions for enhance the prompt,
             -if the ${descriptionController.text} and ${addressController.text} don't match any description and address in the $specialists list then don't return any doctors and just return your recommended instructions for enhance the prompt,
             -if the ${addressController.text} don't match any address in the $specialists list then don't return any doctors and just return your recommended instructions for enhance the prompt,
              Based on the ${descriptionController.text}, find the best doctors based on the $specialists description, address and specialist.,
              sort the list of doctors based on ${addressController.text},
            ''',
      ),
    ];
    // if the ${descriptionController.text} contains neck then return the Neurologist doctors,
    //           if the ${descriptionController.text} contains heart then return the Cardiologist doctors,
    //           if the ${descriptionController.text} contains eyes then return the Ophthalmologist doctors,
    //           if the ${descriptionController.text} contains liver then return the Hepatologist doctors,
    //           if the ${descriptionController.text} contains brain then return the Neurologist doctors,
    //           if the ${descriptionController.text} contains diabetes then return the Diabetes doctors,
    //           if the ${descriptionController.text} contains colon then return the Oncologist doctors,
    //           if the ${descriptionController.text} contains cancer then return the Oncologist doctors,
    //           after finding the best doctors based on ${descriptionController.text},

    await model.generateContent(content).then((value) {
      String response = value.text!;
      Map<String, dynamic> decoded = jsonDecode(response);
      // debugPrint("decoded: $decoded");

      if (decoded['doctors'] == null || decoded['doctors'].isEmpty) {
        emit(state.copyWith(
          doctorsBasedOnAi: [],
          message:
              "Sorry, no doctors found based on your description and address provided, please try again with different description and address, you can use words like heart, liver, brain, eyes, diabetes, colon, cancer, etc in your description",
          isLoading: false,
          error: "",
        ));
      } else {
        List<DoctorModel> doctorList = [];
        for (var doctor in decoded['doctors']) {
          debugPrint("doctor: $doctor");
          doctorList.add(DoctorModel.fromJson(doctor));
        }
        emit(state.copyWith(
          doctorsBasedOnAi: doctorList,
          message: "",
          isLoading: false,
          error: "",
        ));
      }
    }).catchError((e) {
      emit(state.copyWith(
        error: e.toString(),
        isLoading: false,
        message: "",
        doctorsBasedOnAi: [],
      ));
    });
  }

  void getAddress(Position? position) async {
    String address = await LocationHelper.getAddress(position);
    addressController.text = address;
  }
}
