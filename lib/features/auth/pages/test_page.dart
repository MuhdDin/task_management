import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager/common/utils/constants.dart';
import 'package:task_manager/common/widget/appstyle.dart';
import 'package:task_manager/common/widget/reusable_text.dart';
import 'package:task_manager/features/auth/controllers/code_provider.dart';

class TestPage extends ConsumerWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String code = ref.watch(codeStateProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ReusableText(
              text: code,
              style: appstyle(20, AppConst.kLight, FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                ref.read(codeStateProvider.notifier).setStart("hello Din");
              },
              child: Text("Press me"),
            ),
          ],
        ),
      ),
    );
  }
}
