import 'package:get/get.dart';

class AppController extends GetxController {
  var weight = 65.obs;
  var age = 18.obs;
  var gender = "male".obs;
  RxDouble height = RxDouble(0);
  RxDouble bmi = RxDouble(0);

  void incrementWeight() {
    weight.value++;
  }

  void incrementAge() {
    age.value++;
  }

  void decrementWeight() {
    weight.value--;
  }

  void decrementAge() {
    age.value--;
  }

  String describeBMI(double bmi) {
    switch (bmi) {
      case > 0 && < 16:
        return "Severe Thinness";
      case >= 16 && < 17:
        return "Moderate Thinness";
      case >= 17 && < 18.5:
        return "Mild Thinness";
      case >= 18.5 && < 25:
        return "Normal";
      case >= 25 && < 30:
        return "Overweight";
      case > 30:
        return "Obese";
      default:
        return "";
    }
  }

  void calculateBMI(int weight, double height) {
    bmi.value = weight / (height * height);
  }
}
