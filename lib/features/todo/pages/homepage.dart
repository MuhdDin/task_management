import 'package:flutter/material.dart';
import 'package:task_manager/common/utils/constants.dart';
import 'package:task_manager/common/widget/appstyle.dart';
import 'package:task_manager/common/widget/reusable_text.dart';
import 'package:task_manager/common/widget/widthspacer.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ReusableText(
                text: "Todo",
                style: appstyle(26, AppConst.kGreen, FontWeight.bold)),
            const WidthSpacer(wydth: 20),
            ReusableText(
                text: "Todo",
                style: appstyle(26, AppConst.kGreen, FontWeight.bold)),
            const WidthSpacer(wydth: 20),
            ReusableText(
                text: "Todo",
                style: appstyle(26, AppConst.kGreen, FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
