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
                      const HeightSpacer(hieght: 5),
                      Container(
                        width: AppConst.kWidth,
                        padding: const EdgeInsets.only(left: 5),
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
                            const WidthSpacer(wydth: 15),
                            ReusableText(
                              text: "From: start To : end",
                              style: appstyle(
                                  15, AppConst.kBkDark, FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const HeightSpacer(hieght: 10),
                      ReusableText(
                        text: "Title",
                        style: appstyle(30, AppConst.kBkDark, FontWeight.bold),
                      ),
                      const HeightSpacer(hieght: 10),
                      Text(
                        "Title",
                        maxLines: 8,
                        textAlign: TextAlign.justify,
                        style: appstyle(16, AppConst.kLight, FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 12.w,
              top: -10.h,
              child: Image.asset(
                'assets/images/bell.png',
                width: 70.w,
                height: 70.h,
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: -AppConst.kHeight * 0.1,
              child: Image.asset(
                'assets/images/notification.png',
                width: AppConst.kWidth * 0.8,
                height: AppConst.kHeight * 0.45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
