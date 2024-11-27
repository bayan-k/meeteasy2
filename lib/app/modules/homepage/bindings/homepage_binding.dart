import 'package:get/get.dart';
import 'package:meetingreminder/app/modules/homepage/controllers/bottom_nav_controller.dart';
import 'package:meetingreminder/app/modules/homepage/controllers/container_controller.dart';
import 'package:meetingreminder/app/modules/homepage/controllers/timepicker_controller.dart';
import 'package:meetingreminder/app/services/notification_services.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    // Initialize ContainerController first as others might depend on it
    Get.put<ContainerController>(ContainerController(), permanent: true);
    
    // Then initialize other controllers
    Get.put<TimePickerController>(TimePickerController(), permanent: true);
    Get.put<NotificationService>(NotificationService(), permanent: true);
    Get.put<BottomNavController>(BottomNavController(), permanent: true);
  }
}
