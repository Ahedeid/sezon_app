import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:sezon_app/services/sharedPref/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';


var sl = GetIt.instance;

Future init() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  // ---------------------------------------------------------------------------
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton<SharedPrefController>(
      () => SharedPrefController(preferences: sl()));

  // --------------------- Firebase --------------------------------------------
  sl.registerLazySingleton<FirebaseAuth>(() => firebaseAuth);
  sl.registerLazySingleton<FirebaseFirestore>(() => firebaseFireStore);
  sl.registerLazySingleton<FirebaseStorage>(() => firebaseStorage);

}
