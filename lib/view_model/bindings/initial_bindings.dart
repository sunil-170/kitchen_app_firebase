import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:kitchen_app/view_model/controllers/Theme/theme_controllers.dart';
import 'package:kitchen_app/view_model/controllers/auth_controllers.dart';
import 'package:kitchen_app/view_model/controllers/chat/chat_contollers.dart';
import 'package:kitchen_app/view_model/controllers/language/language_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthControllers());
    Get.put(LanguageController());
    Get.put(ChatController());
    Get.put(ThemeController());
  }
}
