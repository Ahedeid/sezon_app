import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sezon_app/controllers/local_controller.dart';
import 'package:sezon_app/controllers/profile_controller/profile_controller.dart';
import 'package:sezon_app/router/route_name.dart';
import 'package:sezon_app/service_locator.dart';
import 'package:sezon_app/services/profileService/profile_service.dart';
import 'package:sezon_app/services/sharedPref/shared_pref.dart';
import 'package:sezon_app/utils/style_manager.dart';
import 'package:sezon_app/views/screens/profile/widgets/profile_bottom_sheet_widget.dart';
import 'package:sezon_app/views/screens/profile/widgets/profile_widget.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ProfileService());
    LocalController localController = Get.find();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          title: Text(
            'profile'.tr,
            style: StyleManager.headline1(fontSize: 18),
          ),
          centerTitle: true,
        ),
        body: Obx(
          () => controller.loading.value
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Obx(
                            () => (controller.user.value!.imageLink.isNotEmpty)
                                ? CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage(
                                      controller.user.value!.imageLink,
                                    ),
                                  )
                                : const CircleAvatar(
                                    radius: 50,
                                    child: Icon(
                                      Icons.person,
                                      size: 40,
                                    ),
                                  ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.selectImage();
                            },
                            child: const CircleAvatar(
                              backgroundColor: Colors.amber,
                              radius: 17,
                              child: Icon(
                                Icons.edit,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      controller.user.value!.fullName,
                      style: StyleManager.headline1(),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      controller.user.value!.phoneNumber,
                      style: StyleManager.headline2,
                      textAlign: TextAlign.center,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          barrierColor: Colors.grey,
                          isScrollControlled: true,
                          builder: (context) => const ProfileBottomSheet(),
                        );
                      },
                      child: Text(
                        'edit_profile'.tr,
                        style: StyleManager.smallText(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ProfileWidget(
                      icon: Icons.language,
                      text: 'language'.tr,
                      onTap: () {
                        Get.bottomSheet(Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              )),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                onTap: () {
                                  localController.changeLang('en');
                                },
                                title: const Text('English'),
                              ),
                              const Divider(),
                              ListTile(
                                onTap: () {
                                  localController.changeLang('ar');
                                },
                                title: const Text('Arabic'),
                              ),
                              const SizedBox(height: 20,)
                            ],
                          ),
                        ));
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ProfileWidget(
                      icon: Icons.logout,
                      text: 'logout'.tr,
                      onTap: () {
                        sl<SharedPrefController>().logout();
                        Get.offAllNamed(RouteName.loginRoute);
                      },
                    ),
                  ],
                ),
        ));
  }
}
