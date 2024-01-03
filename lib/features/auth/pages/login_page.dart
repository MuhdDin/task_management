import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager/common/utils/constants.dart';
import 'package:task_manager/common/widget/appstyle.dart';
import 'package:task_manager/common/widget/custom_otn_btn.dart';
import 'package:task_manager/common/widget/custom_text.dart';
import 'package:task_manager/common/widget/heighspacer.dart';
import 'package:task_manager/common/widget/reusable_text.dart';
import 'package:task_manager/common/widget/showDialog.dart';
import 'package:task_manager/features/auth/controllers/auth_controller.dart';
import 'package:task_manager/features/auth/controllers/code_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController phone = TextEditingController();
  Country country = Country(
      phoneCode: "86",
      countryCode: "CN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "China",
      example: "China",
      displayName: "China",
      displayNameNoCountryCode: "CN",
      e164Key: "");

  sendCodeToUser() {
    if (phone.text.isEmpty) {
      return showAlertDialog(context: context, message: "Gib PHoNe");
    } else if (phone.text.length < 8) {
      return showAlertDialog(context: context, message: "sHORt pP");
    } else {
      ref.read(authControllerProvider).sendSms(
            context: context,
            phone: '+${country.phoneCode}${phone.text}',
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Image.asset(
                "assets/images/todo.png",
                width: 300,
              ),
            ),
            const HeightSpacer(hieght: 20),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 16.w),
              child: ReusableText(
                text: "Please provide your Phone Number",
                style: appstyle(17, AppConst.kLight, FontWeight.w500),
              ),
            ),
            const HeightSpacer(hieght: 20),
            Center(
              child: CustomTextField(
                controller: phone,
                prefixIcon: Container(
                  padding: const EdgeInsets.all(14),
                  child: GestureDetector(
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        countryListTheme: CountryListThemeData(
                            backgroundColor: AppConst.kGreyLight,
                            bottomSheetHeight: AppConst.kHeight * 0.6,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(AppConst.kRadius),
                                topRight: Radius.circular(AppConst.kRadius))),
                        onSelect: (code) {
                          setState(() {
                            country = code;
                          });
                          ref
                              .read(codeStateProvider.notifier)
                              .setStart(code.phoneCode);
                        },
                      );
                    },
                    child: ReusableText(
                        text: "${country.flagEmoji} + ${country.phoneCode}",
                        style: appstyle(18, AppConst.kBkDark, FontWeight.bold)),
                  ),
                ),
                keyboardType: TextInputType.number,
                hintText: "Enter phone number",
                hintStyle: appstyle(16, AppConst.kBkDark, FontWeight.w600),
              ),
            ),
            const HeightSpacer(hieght: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomOtlnBtn(
                  onTap: () {
                    sendCodeToUser();
                  },
                  width: AppConst.kWidth * 0.9,
                  height: AppConst.kHeight * 0.075,
                  color: AppConst.kBkDark,
                  color2: AppConst.kLight,
                  text: "Send Code"),
            )
          ],
        ),
      )),
    );
  }
}
