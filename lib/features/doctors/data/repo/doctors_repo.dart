import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../home/data/models/category_model.dart';
import '../models/doctor_model.dart';

abstract class DoctorsRepo {
  Future<List<DoctorModel>> fetchDoctors();
  Future<List<CategoryModel>> fetchCategories();
}

class DoctorsRepoImpl implements DoctorsRepo {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference doctors = firestore.collection('doctors');
  CollectionReference categories = firestore.collection('categories');

  @override
  Future<List<DoctorModel>> fetchDoctors() async {
    List doctorsData = [];
    QuerySnapshot querySnapshot = await doctors.get();
    doctorsData = querySnapshot.docs.map((doc) => doc.data()).toList();
    final response = doctorsData;
    return response.map((e) => DoctorModel.fromJson(e)).toList();
  }

  @override
  Future<List<CategoryModel>> fetchCategories() async {
    List categoriesData = [];
    QuerySnapshot querySnapshot = await categories.get();
    categoriesData = querySnapshot.docs.map((doc) => doc.data()).toList();
    final response = categoriesData;
    return response.map((e) => CategoryModel.fromJson(e)).toList();
  }
}
