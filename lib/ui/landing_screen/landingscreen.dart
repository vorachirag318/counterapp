import 'package:counterapp/ui/landing_screen/controller/landing_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingScreen extends StatefulWidget {
  static const String routeName = "/landingScreen";

  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final PageController _pageController = PageController();
  final LandingController _landingController = Get.find<LandingController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: centerDisplyPortion(),
      floatingActionButton: fabButton(),
      bottomNavigationBar: bottomBar(),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text("CounterApp"),
      actions: [
        TextButton(
          onPressed: () {
            _landingController.setDefaultCount();
          },
          child: const Text(
            "Reset Count",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }

  GetBuilder<LandingController> centerDisplyPortion() {
    return GetBuilder(
      builder: (LandingController controller) => PageView(
        physics: const BouncingScrollPhysics(),
        onPageChanged: (currentPage) {
          controller.tabCurrentIndex = currentPage;
        },
        children: List.generate(
            controller.allCounter.length,
            (index) => SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Counter ${controller.allCounter["counter${index + 1}"]}",
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            controller.counterIncrease(
                                key: "counter${index + 1}");
                          },
                          child: const Text("Increment me!"))
                    ],
                  ),
                )),
        controller: _pageController,
      ),
    );
  }

  FloatingActionButton fabButton() {
    return FloatingActionButton(
      onPressed: () {
        Get.find<LandingController>().counterIncrease(
            key: "counter${_landingController.tabCurrentIndex + 1}");
      },
      child: const Icon(Icons.add),
    );
  }

  GetBuilder<LandingController> bottomBar() {
    return GetBuilder(
      builder: (LandingController controller) => BottomNavigationBar(
        currentIndex: controller.tabCurrentIndex,
        onTap: (currentPage) {
          controller.tabCurrentIndex = currentPage;
          _pageController.animateToPage(currentPage,
              duration: const Duration(microseconds: 1), curve: Curves.linear);
        },
        items: List.generate(
            _landingController.allCounter.length,
            (index) => BottomNavigationBarItem(
                  icon: const SizedBox(),
                  label: "Counter ${index + 1}",
                )),
      ),
    );
  }
}
