import 'package:get/get.dart';
import 'package:locker/features/lockers/presentation/getX/locker_controller.dart';

final LockerController lockerController = LockerController.instance;

void initialiseControllers(){
  Get.put(LockerController());
}
