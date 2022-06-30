import 'package:get_it/get_it.dart';
import 'package:project/services/api/product.service.dart';
//import 'services/firebase/auth.service.dart';
import 'services/api/api.service.dart';
import 'services/local/local.service.dart';
import 'viewmodels/login.viewmodel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Here you register all your services
  //locator.registerLazySingleton(() => AuthService());
  //locator.registerLazySingleton(() => ApiService());
  //locator.registerLazySingleton(() => LocalService());
   locator.registerLazySingleton(() => ProductService());

  // Here you register all your viewmodels
  //locator.registerFactory(() => LoginViewModel());
}
