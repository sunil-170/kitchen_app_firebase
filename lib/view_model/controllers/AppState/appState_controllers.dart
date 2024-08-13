import 'package:get/state_manager.dart';

/// Loading Controller
class App_state_controllers extends GetxController {
  bool _loading = false;
  bool get get_loader => _loading;
  set_loader(bool status) {
    _loading = status;
    update();
  }
}
