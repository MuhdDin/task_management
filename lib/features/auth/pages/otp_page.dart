import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:task_manager/common/utils/constants.dart';
import 'package:task_manager/common/widget/appstyle.dart';
import 'package:task_manager/common/widget/heighspacer.dart';
import 'package:task_manager/common/widget/reusable_text.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key, required this.smsCodeId, required this.phone});

  final String smsCodeId;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
            child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeightSpacer(hieght: AppConst.kHeight * 0.12),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.w,
                ),
                child: Image.asset(
                  "assets/images/todo.png",
                  width: AppConst.kWidth * 0.5,
                ),
              ),
              const HeightSpacer(hieght: 26),
              ReusableText(
                text: "Enter you OTP code",
                style: appstyle(18, AppConst.kLight, FontWeight.bold),
              ),
              const HeightSpacer(hieght: 26),
              Pinput(
                length: 6,
                showCursor: true,
                onCompleted: (value) {
                  if (value.length == 6) {}
                },
                onSubmitted: (value) {
                  if (value.length == 6) {}
                },
              )
            ],
          ),
        )));
  }
}
