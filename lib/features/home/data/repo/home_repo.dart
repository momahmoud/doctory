import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/category_model.dart';
import '../models/medical_center_model.dart';

abstract class HomeRepo {
  Future<List<CategoryModel>> fetchCategories();
  Future<List<MedicalCenterModel>> fetchMedicalCenters();
  Future<dynamic> fetchBanners();
}

class HomeRepoImpl implements HomeRepo {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference medicalCenters = firestore.collection('medical_centers');
  CollectionReference categories = firestore.collection('categories');
  CollectionReference doctors = firestore.collection('doctors');

  @override
  Future<List<CategoryModel>> fetchCategories() async {
    List categoriesData = [];
    QuerySnapshot querySnapshot = await categories.get();
    categoriesData = querySnapshot.docs.map((doc) => doc.data()).toList();
    final response = categoriesData;
    return response.map((e) => CategoryModel.fromJson(e)).toList();
  }

  @override
  Future<List<MedicalCenterModel>> fetchMedicalCenters() async {
    List medicalCentersData = [];
    QuerySnapshot querySnapshot = await medicalCenters.get();
    medicalCentersData = querySnapshot.docs.map((doc) => doc.data()).toList();
    final response = medicalCentersData;
    return response.map((e) => MedicalCenterModel.fromJson(e)).toList();
  }

  @override
  Future fetchBanners() {
    // TODO: implement fetchBanners
    throw UnimplementedError();
  }
}
