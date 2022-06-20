import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';


class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key, required this.appbarTitle}) : super(key: key);
  final String appbarTitle;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      
      centerTitle: true,
      title: Text(
        appbarTitle,
        style: appBarTextStyle,
      ),
      backgroundColor: kBackgroundColor,
      elevation: 0,
    );
  }
}
