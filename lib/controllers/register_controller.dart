import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tech_blog/components/api_constants.dart';
import 'package:tech_blog/services/dio_service.dart';

class RegisterController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController activateCodeTextEditingController = TextEditingController();
  var email = '';
  var userId = '';

  register() async {
    Map<String, dynamic> map = {
      'email': emailTextEditingController.text,
      'command': 'register',
    };

    var response = await DioService().postMethod(map, ApiConstants.postRegister);

    email = emailTextEditingController.text;
    userId = response.data['user_id'];
  }

  verify()async{
    Map<String, dynamic> map = {
      'email': email,
      'user_id':userId,
      'code':activateCodeTextEditingController.text,
      'command': 'verify',
    };

    var response = await DioService().postMethod(map, ApiConstants.postRegister);
  }
}
