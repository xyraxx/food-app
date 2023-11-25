import 'package:food_app/Data/api/api_client.dart';
import 'package:food_app/Data/repisotory/cart_repo.dart';
import 'package:food_app/Data/repisotory/popular_product_repo.dart';
import 'package:food_app/controllers/cart_controller.dart';
import 'package:food_app/controllers/popular_product_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Data/repisotory/recommended_product_repo.dart';
import '../controllers/recommended_product_controller.dart';
import '../utlis/app_constants.dart';

Future<void> init()async {
  final sharedPreferences = await SharedPreferences.getInstance();
  //api client
  Get.lazyPut(()=>sharedPreferences);
  Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences:Get.find()));

  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}