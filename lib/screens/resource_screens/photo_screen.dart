import 'package:flutter/material.dart';
import 'package:p4h_mobile/widgets/custom_build_sub_resource_screens.dart';

class PhotoScreen extends StatelessWidget {
  static const routeName = 'Photo Screen';
  const PhotoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SubResourceScreens(
      text1: 'Videyo.mp3',
      text2: 'Videyo2.mp3',
      text3: 'Videyo3.mp3',
    );
  }
}
