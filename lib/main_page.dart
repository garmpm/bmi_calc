import 'package:bmi_calc/state/app_state.dart';
import 'package:bmi_calc/widgets/container_button.dart';
import 'package:bmi_calc/widgets/value_incrementer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AppController controller = Get.put(AppController());
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<AppController>();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 187, 196, 215),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Welcome",
                ),
                Text(
                  "BMI Calculator",
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(
        () => Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ContainerButton(
                      width: 175,
                      height: 50,
                      icon: Icons.male,
                      text: 'Male',
                      onTap: () {
                        controller.gender.value = 'male';
                      },
                      isSelected:
                          controller.gender.value == 'male' ? true : false,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ContainerButton(
                      width: 175,
                      height: 50,
                      icon: Icons.female,
                      text: 'Female',
                      onTap: () {
                        controller.gender.value = 'female';
                      },
                      isSelected:
                          controller.gender.value == 'female' ? true : false,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ValueIncrementer(
                      title: 'Weight',
                      value: controller.weight.value,
                      onTapMinus: () {
                        controller.decrementWeight();
                      },
                      onTapPlus: () {
                        controller.incrementWeight();
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ValueIncrementer(
                      title: 'Age',
                      value: controller.age.value,
                      onTapMinus: () {
                        controller.decrementAge();
                      },
                      onTapPlus: () {
                        controller.incrementAge();
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Height',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  decoration: const InputDecoration(
                      hintText: 'Height',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      constraints: BoxConstraints(maxWidth: 200)),
                  controller: textController,
                  keyboardType: TextInputType.phone,
                  onChanged: (value) {
                    if (value != '') {
                      controller.height.value = double.parse(value);
                    } else {
                      controller.height.value = 0;
                    }
                  },
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    controller.bmi.value.toStringAsFixed(3),
                    style: const TextStyle(
                      fontSize: 68,
                      height: 0.8,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    controller.describeBMI(controller.bmi.value),
                    style: const TextStyle(
                      fontSize: 36,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: FilledButton(
                      onPressed: () {
                        controller.calculateBMI(
                            controller.weight.value, controller.height.value);
                      },
                      child: const Text('Calculate')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
