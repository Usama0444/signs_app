import 'package:get/get.dart';

class MakeImagesPath extends GetxController {
  List<String> emergencySign = [];
  List<String> assemblySign = [];
  List<String> fireAid = [];
  List<String> visitor = [];
  List<String> fireSafty = [];
  List<String> smoking = [];
  List<String> noAccess = [];
  List<String> warning = [];
  List<String> foodPre = [];
  List<String> cctv = [];

  Future<void> fillListWithImagesPath() async {
    for (int i = 1; i < 25; i++) {
      if (i < 10) {
        emergencySign.add('assets/001-Emergency Signs/emerg_signs_00$i.png');
      } else {
        emergencySign.add('assets/001-Emergency Signs/emerg_signs_0$i.png');
      }
    }

    for (int i = 1; i < 16; i++) {
      if (i < 10) {
        assemblySign.add('assets/002-Assembly Signs/assem_signs_00$i.png');
      } else {
        assemblySign.add('assets/002-Assembly Signs/assem_signs_0$i.png');
      }
    }

    for (int i = 1; i < 17; i++) {
      if (i < 10) {
        fireAid.add('assets/003-Firstaid Signs/firstad_signs_00$i.png');
      } else {
        fireAid.add('assets/003-Firstaid Signs/firstad_signs_0$i.png');
      }
    }

    for (int i = 1; i < 13; i++) {
      if (i < 10) {
        visitor.add('assets/004-Visitors Signs/visit_signs_00$i.png');
      } else {
        visitor.add('assets/004-Visitors Signs/visit_signs_0$i.png');
      }
    }

    for (int i = 1; i < 31; i++) {
      if (i < 10) {
        fireSafty.add('assets/005-Fire Safety Signs/fire_signs_00$i.png');
      } else {
        fireSafty.add('assets/005-Fire Safety Signs/fire_signs_0$i.png');
      }
    }

    for (int i = 1; i < 16; i++) {
      if (i < 10) {
        smoking.add('assets/006-Smoking Signs/smok_signs_00$i.png');
      } else {
        smoking.add('assets/006-Smoking Signs/smok_signs_0$i.png');
      }
    }

    for (int i = 1; i < 14; i++) {
      if (i < 10) {
        noAccess.add('assets/007-No Access Signs/noacc_signs_00$i.png');
      } else {
        noAccess.add('assets/007-No Access Signs/noacc_signs_0$i.png');
      }
    }

    for (int i = 1; i < 113; i++) {
      if (i < 10) {
        warning.add('assets/008-Warning Signs/warn_signs_00$i.png');
      } else if (i < 100) {
        warning.add('assets/008-Warning Signs/warn_signs_0$i.png');
      } else {
        warning.add('assets/008-Warning Signs/warn_signs_$i.png');
      }
    }

    for (int i = 1; i < 16; i++) {
      if (i < 10) {
        foodPre.add('assets/009-FoodPre Signs/food_signs_00$i.png');
      } else {
        foodPre.add('assets/009-FoodPre Signs/food_signs_0$i.png');
      }
    }

    for (int i = 1; i < 15; i++) {
      if (i < 10) {
        cctv.add('assets/010-CCTV Signs/cctv_signs_00$i.png');
      } else {
        cctv.add('assets/010-CCTV Signs/cctv_signs_0$i.png');
      }
    }
    update();
  }
}
