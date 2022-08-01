import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class IncrementerController extends GetxController {
  RxInt dataIntReactive = 0.obs;
  int dataIntSimple = 0;

  addData() {
    dataIntReactive++;
    dataIntSimple++;
  }

  refresher() {
    update();
  }
}