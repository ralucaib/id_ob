import 'package:get/get.dart';
import 'package:id_ob/scan_controller.dart';

class GlobalBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ScanController>(() => ScanController());
  }

}