// ignore_for_file: file_names
// import 'dart:developer';
// import 'package:discountsstore_app/data/model/dio_service.dart';
// import 'package:discountsstore_app/data/model/photos_model.dart';
// import 'package:discountsstore_app/linkapi.dart';
// import 'package:get/get.dart';



// class SimpleUIController extends GetxController {
//   RxList<PhotosModel> photos = RxList();
//   RxBool isLoading = true.obs;
//   RxString orderBy = "latest".obs;
//   RxString apikey = "YourApiKey".obs;
//   var selectedIndex = 0.obs;
//   List orders = [
  
//   ];



//   /// Get Picture 
//   getPictureData() async {
//     isLoading.value = true;
//     var response = await DioService().getMethod(
//      //   "https://api.unsplash.com/photos/?per_page=30&order_by=${orderBy.value}&client_id=$apikey"
//      AppLink.category);
//     photos = RxList();
//     if (response.statusCode == 200) {
//       response.data.forEach((element) {
//         photos.add(PhotosModel.fromJson(element));
//       });
//       isLoading.value = false;
//     }

//     log(response.statusCode);
//   }


//   /// changing order value
//   ordersFunc(String newVal) {
//     orderBy.value = newVal;
//     getPictureData();
//   }

//   @override
//   void onInit() {
//     getPictureData();
//     super.onInit();
//   }
// }