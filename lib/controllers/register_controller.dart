import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/components/api_constants.dart';
import 'package:tech_blog/components/storage_const.dart';
import 'package:tech_blog/services/dio_service.dart';
import 'package:tech_blog/ui/main_screens/main_screen.dart';

class RegisterController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController activateCodeTextEditingController =
      TextEditingController();
  var email = '';
  var userId = '';

  register() async {
    Map<String, dynamic> map = {
      'email': emailTextEditingController.text,
      'command': 'register',
    };

    var response =
        await DioService().postMethod(map, ApiConstants.postRegister);

    email = emailTextEditingController.text;
    userId = response.data['user_id'];
  }

  verify() async {
    Map<String, dynamic> map = {
      'email': email,
      'user_id': userId,
      'code': activateCodeTextEditingController.text,
      'command': 'verify',
    };

    var response = await DioService().postMethod(map, ApiConstants.postRegister);
    if(response.data['response'] == 'verified'){
      var box = GetStorage();
      box.write(token, response.data['token']);
      box.write(userIdKey, response.data['user_id']);

      debugPrint('read -> ${box.read(token)}');
      debugPrint('read -> ${box.read(userIdKey)}');
      Get.to(MainScreen());
    }else{
      log('error');
    }

  }
}
