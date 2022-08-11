import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p4h_mobile/controllers/tab_controller.dart' as controller;
import 'package:p4h_mobile/view/discussion.dart';
import 'package:p4h_mobile/view/messages.dart';
import 'package:p4h_mobile/view/profile.dart';
import 'package:p4h_mobile/view/resources.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller.TabController tabController =
        Get.put(controller.TabController());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Column(
        children: [
          Obx(() => Center(
                  child: Text(
                tabController.title.value,
                style: Theme.of(context).textTheme.headline1,
              ))),
          TabBar(
            width: width,
            tabController: tabController,
          ),
          Obx(() => Container(
                color: Colors.black12,
                child: IndexedStack(
                    index: tabController.index.value,
                    children: const [
                      Profile(),
                      Messages(),
                      Resources(),
                      Discussion(),
                      // Returns(),
                      // Profile(),
                    ]),
                //show screen according to index
              )),
        ],
      ),
    );
  }
}

class TabBar extends StatelessWidget {
  const TabBar({
    Key? key,
    required this.width,
    required this.tabController,
  }) : super(key: key);

  final double width;
  final controller.TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 45,
      width: width,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20)),
              child: const Icon(
                (Icons.question_mark_outlined),
                color: Colors.black,
                size: 15,
              ),
            ),
          ),
          BuildTabButton(
            tabController: tabController,
            title: 'Mwen',
            index: 0,
          ),
          BuildTabButton(
            tabController: tabController,
            title: 'Pale',
            index: 1,
          ),
          BuildTabButton(
            tabController: tabController,
            title: 'Resous',
            index: 2,
          ),
          BuildTabButton(
            tabController: tabController,
            title: 'Diskisyon',
            index: 3,
          ),
        ],
      ),
    );
  }
}

class BuildTabButton extends StatelessWidget {
  const BuildTabButton({
    Key? key,
    Icon? icon,
    required this.tabController,
    required this.title,
    required this.index,
  }) : super(key: key);

  final controller.TabController tabController;
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Colors.white,
          ),
          foregroundColor: MaterialStateProperty.all(
            Colors.black,
          ),
        ),
        onPressed: () {
          tabController.changeIndex(index);
        },
        child: Text(title),
      ),
    );
  }
}