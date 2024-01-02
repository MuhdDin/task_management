import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_manager/common/utils/constants.dart';
import 'package:task_manager/common/widget/expansion_tile.dart';
import 'package:task_manager/features/todo/controllers/todo/todo_provider.dart';
import 'package:task_manager/features/todo/controllers/xpansion_provider.dart';
import 'package:task_manager/features/todo/pages/update_task.dart';
import 'package:task_manager/features/todo/widget/todo_tile.dart';

class TomorrowList extends ConsumerWidget {
  const TomorrowList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoStateProvider);
    var color = ref.read(todoStateProvider.notifier).getRandomColor();
    String tomorrow = ref.read(todoStateProvider.notifier).getTomorrow();

    var tomorrowTasks =
        todos.where((element) => element.date!.contains(tomorrow));
    return XpansionTile(
      text: "Tomorrow's Task",
      text2: "Day after tommorows task",
      onExpansionChanged: (bool expanded) {
        ref.read(xpansionStateProvider.notifier).setStart(expanded);
      },
      trailing: Padding(
        padding: EdgeInsets.only(right: 12.0.w),
        child: !ref.watch(xpansionStateProvider)
            ? const Icon(
                AntDesign.circledown,
                color: AppConst.kBlueLight,
              )
            : const Icon(
                AntDesign.closecircleo,
                color: AppConst.kLight,
              ),
      ),
      children: [
        for (final todo in tomorrowTasks)
          TodoTile(
            start: todo.startTime,
            title: todo.title,
            end: todo.endTime,
            description: todo.description,
            color: color,
            delete: () {
              ref.read(todoStateProvider.notifier).deleteTodo(todo.id ?? 0);
            },
            editWidget: GestureDetector(
              onTap: () {
                titles = todo.title.toString();
                descs = todo.description.toString();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateTask(
                      id: todo.id ?? 0,
                    ),
                  ),
                );
              },
              child: const Icon(MaterialCommunityIcons.circle_edit_outline),
            ),
            switcher: const SizedBox.shrink(),
          )
      ],
    );
  }
}
