import 'package:ecommerce/data/repositories/user/user_repository.dart';
import 'package:ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce/features/personalization/screens/profile/profile.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/http/network_manager.dart';
import 'package:ecommerce/utils/popups/full_screen_loader.dart';
import 'package:ecommerce/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog('We are updating your information', TImages.onBoardingImage1);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {TFullScreenLoader.stopLoading(); return;}

      // Form validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Update user's first and last name in Firebase Firestore
      Map<String, dynamic> name = {'FirstName': firstName.text.trim(), 'LastName': lastName.text.trim()};
      await userRepository.updateSingleField(name);

      // Update the Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove loader
      TFullScreenLoader.stopLoading();

      // Show Success Screen
      TLoaders.successSnackBar(title: 'Done!', message: 'Your information updated successfully!.'.tr);

      // Move to previous screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}