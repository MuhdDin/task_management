import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/common/utils/constants.dart';
import 'package:task_manager/common/widget/appstyle.dart';
import 'package:task_manager/common/widget/heighspacer.dart';
import 'package:task_manager/common/widget/reusable_text.dart';
import 'package:task_manager/common/widget/widthspacer.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key, this.payLoad});

  final String? payLoad;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Container(
                width: AppConst.kWidth,
                height: AppConst.kHeight * 0.7,
                decoration: BoxDecoration(
                  color: AppConst.kBkLight,
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppConst.kRadius),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                        text: "Reminder",
                        style: appstyle(40, AppConst.kLight, FontWeight.bold),
                      ),
                      HeightSpacer(hieght: 5),
                      Container(
                          width: AppConst.kWidth,
                          padding: EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            color: AppConst.kYellow,
                            borderRadius: BorderRadius.all(
                              Radius.circular(9.h),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ReusableText(
                                text: "Today",
                                style: appstyle(
                                    14, AppConst.kBkDark, FontWeight.bold),
                              ),
                              WidthSpacer(wydth: 15),
                              ReusableText(
                                text: "From: start To : end",
                                style: appstyle(
                                    15, AppConst.kBkDark, FontWeight.w600),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
