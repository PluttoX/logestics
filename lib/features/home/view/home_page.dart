import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../Controllers/controllers.dart';
import '../drawer/drawer.dart';
import '../theme/theme.dart';
import 'appbar/app_bar.dart';
import 'dashbord/e_commerece/e_commerce.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MainDrawerController mainDrawerController = Get.put(MainDrawerController());

  late ColorNotifier notifier;

  double _scrollPosition = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo(_scrollPosition);
    });

    scrollController.addListener(() {
      _scrollPosition = scrollController.position.pixels;
    });
  }


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    notifier = Provider.of(context, listen: true);
    return GetBuilder<MainDrawerController>(
      builder: (mainDrawerController) {
        if (width < 950) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(width < 800 ? 120 : 50),
              child: const AppBarView(),
            ),
            backgroundColor: notifier.mainBgColor,
            resizeToAvoidBottomInset: true,
            drawer: SizedBox(
              width: width < 450
                  ? width / 1.4
                  : width < 600
                      ? width / 2
                      : width < 750
                          ? width / 2.7
                          : width / 3.5,
              child: const MyDrawer(),
            ),
            body: SingleChildScrollView(
              controller: scrollController,
              child: Container(
                margin: const EdgeInsets.all(10),
                width: width,
                decoration: const BoxDecoration(),
                child: mainDrawerController
                    .pages[mainDrawerController.selectControllers],
              ),
            ),
          );
        }
        else if (width < 1200) {
          return Scaffold(
            backgroundColor: notifier.mainBgColor,
            resizeToAvoidBottomInset: true,
            drawer: SizedBox(
              width: width < 1050 ? width / 3.5 : width / 4.3,
              child: const MyDrawer(),
            ),
            drawerScrimColor: notifier.text,

            body: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: notifier.getBgColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: AppBarView(),
                          ),
                        ),
                         const SizedBox(height: 20),
                        StatefulBuilder(builder: (context, setState) {
                          return Expanded(
                            child: SingleChildScrollView(
                              controller: scrollController,
                              child: Container(
                                decoration: const BoxDecoration(),
                                child: mainDrawerController.pages[
                                    mainDrawerController.selectControllers],
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: notifier.mainBgColor,
            body: Row(
              children: [
                SizedBox(width: width / 6, child: const MyDrawer()),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: AppBarView(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        StatefulBuilder(builder: (context, setState) {
                          return Expanded(
                            child: SingleChildScrollView(
                              controller: scrollController,
                              child: Container(
                                decoration: const BoxDecoration(),
                                child: mainDrawerController.pages[
                                    mainDrawerController.selectControllers],
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
