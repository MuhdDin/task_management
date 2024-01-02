import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager/common/utils/constants.dart';
import 'package:task_manager/common/widget/appstyle.dart';
import 'package:task_manager/common/widget/custom_otn_btn.dart';
import 'package:task_manager/common/widget/custom_text.dart';
import 'package:task_manager/common/widget/heighspacer.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import 'package:task_manager/features/todo/controllers/dates/dates_provider.dart';
import 'package:task_manager/features/todo/controllers/todo/todo_provider.dart';

class UpdateTask extends ConsumerStatefulWidget {
  const UpdateTask({super.key, required this.id});

  final int id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTaskState();
}

class _AddTaskState extends ConsumerState<UpdateTask> {
  final TextEditingController title = TextEditingController(text: titles);
  final TextEditingController desc = TextEditingController(text: descs);
  @override
  Widget build(BuildContext context) {
    var scheduleDate = ref.watch(dateStateProvider);
    var scheduleStartTime = ref.watch(startTimeStateProvider);
    var scheduleFinishTime = ref.watch(finishTimeStateProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            const HeightSpacer(hieght: 20),
            CustomTextField(
              hintText: "Add Title",
              controller: title,
              hintStyle: appstyle(
                16,
                AppConst.kGreyLight,
                FontWeight.w600,
              ),
            ),
            const HeightSpacer(hieght: 20),
            CustomTextField(
              hintText: "Add Description",
              controller: desc,
              hintStyle: appstyle(
                16,
                AppConst.kGreyLight,
                FontWeight.w600,
              ),
            ),
            const HeightSpacer(hieght: 20),
            CustomOtlnBtn(
              onTap: () {
                picker.DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(2024, 1, 1),
                    maxTime: DateTime(2025, 1, 1),
                    theme: const picker.DatePickerTheme(
                        doneStyle:
                            TextStyle(color: AppConst.kGreen, fontSize: 16)),
                    onConfirm: (date) {
                  ref.read(dateStateProvider.notifier).setDate(date.toString());
                }, currentTime: DateTime.now(), locale: picker.LocaleType.en);
              },
              width: AppConst.kWidth,
              height: 52.h,
              color: AppConst.kLight,
              color2: AppConst.kBlueLight,
              text: scheduleDate == ""
                  ? "Set Date"
                  : scheduleDate.substring(0, 10),
            ),
            const HeightSpacer(hieght: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomOtlnBtn(
                    onTap: () {
                      picker.DatePicker.showDateTimePicker(context,
                          showTitleActions: true, onConfirm: (date) {
                        ref
                            .read(startTimeStateProvider.notifier)
                            .setStart(date.toString());
                      }, locale: picker.LocaleType.en);
                    },
                    width: AppConst.kWidth * 0.4,
                    height: 52.h,
                    color: AppConst.kLight,
                    color2: AppConst.kBlueLight,
                    text: scheduleStartTime == ""
                        ? "Start Time"
                        : scheduleStartTime.substring(10, 16)),
                CustomOtlnBtn(
                    onTap: () {
                      picker.DatePicker.showDateTimePicker(context,
                          showTitleActions: true, onConfirm: (date) {
                        ref
                            .read(finishTimeStateProvider.notifier)
                            .setStart(date.toString());
                      }, locale: picker.LocaleType.en);
                    },
                    width: AppConst.kWidth * 0.4,
                    height: 52.h,
                    color: AppConst.kLight,
                    color2: AppConst.kBlueLight,
                    text: scheduleFinishTime == ""
                        ? "End Time"
                        : scheduleFinishTime.substring(10, 16)),
              ],
            ),
            const HeightSpacer(hieght: 20),
            CustomOtlnBtn(
                onTap: () {
                  if (title.text.isNotEmpty &&
                      desc.text.isNotEmpty &&
                      scheduleDate.isNotEmpty &&
                      scheduleStartTime.isNotEmpty &&
                      scheduleFinishTime.isNotEmpty) {
                    ref.read(todoStateProvider.notifier).updateItem(
                          widget.id,
                          title.text,
                          desc.text,
                          0,
                          scheduleDate,
                          scheduleStartTime.substring(10, 16),
                          scheduleFinishTime.substring(10, 16),
                        );
                    ref.read(dateStateProvider.notifier).setDate('');
                    ref.read(startTimeStateProvider.notifier).setStart('');
                    ref.read(finishTimeStateProvider.notifier).setStart('');
                    Navigator.pop(context);
                  } else {
                    print("failed to submit");
                  }
                },
                width: AppConst.kWidth,
                height: 52.h,
                color: AppConst.kLight,
                color2: AppConst.kGreen,
                text: "Submit"),
          ],
        ),
      ),
    );
  }
}
