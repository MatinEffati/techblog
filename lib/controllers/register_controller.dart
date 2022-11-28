import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/components/api_constants.dart';
import 'package:tech_blog/components/routes.dart';
import 'package:tech_blog/components/storage_const.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/services/dio_service.dart';
import 'package:tech_blog/ui/main_screens/main_screen.dart';
import 'package:tech_blog/ui/register/register_intro_screen.dart';

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

    var response =
        await DioService().postMethod(map, ApiConstants.postRegister);
    var status = response.data['response'];

    switch (status) {
      case 'verified':
        var box = GetStorage();
        box.write(StorageKey.token, response.data['token']);
        box.write(StorageKey.userIdKey, response.data['user_id']);
        debugPrint('read -> ${box.read(StorageKey.token)}');
        debugPrint('read -> ${box.read(StorageKey.userIdKey)}');
        Get.offAll(MainScreen());
        break;
      case 'incorrect_code':
        Get.snackbar('خطا', 'کد فعالسازی غلط هست');
        break;
      case 'expired':
        Get.snackbar('خطا', 'کد فعالسازی منقضی شده هست');
        break;
    }
  }

  toggleLogin() {
    if (GetStorage().read(StorageKey.token) == null) {
      Get.to(RegisterIntroScreen());
    } else {
      routeToWriteBottomSheet();
    }
  }

  routeToWriteBottomSheet() {
    Get.bottomSheet(
      Container(
        height: Get.height / 3,
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Assets.images.tcbot.path,
                  height: 40,
                ),
                const SizedBox(
                  width: 16,
                ),
                const Text('دونسته هات رو با بقیه به اشتراک بزار')
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
                'فکر کن!! اینجا بودنت به این معناست که یک گیک تکنولوژی هستی دونسته هات رو با  جامعه‌ی گیک های فارسی زبان به اشتراک بذار...'),
            const Expanded(child: SizedBox.shrink()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    debugPrint('write');
                    Get.toNamed(Routes.routeArticleManager);
                  },
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(
                          CupertinoIcons.doc_text,
                          size: 32,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text('مدیریت مقاله ها')
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    debugPrint('podcast');
                  },
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(
                          CupertinoIcons.mic,
                          size: 32,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text('مدیریت پادکست ها')
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
