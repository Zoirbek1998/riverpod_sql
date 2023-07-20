import 'package:bloc_clean_arxitectura/common/utils/widgets/constants.dart';
import 'package:bloc_clean_arxitectura/features/todo/controller/todo/todo_provider.dart';
import 'package:bloc_clean_arxitectura/features/todo/widgets/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodayTask extends ConsumerWidget {
  const TodayTask({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var listData = ref.read(todoStateProvider);
    String today = ref.read(todoStateProvider.notifier).getToday();
    var todayList = listData
        .where((element) =>
            element.isCompleted == 0 && element.date!.contains(today))
        .toList();


    return ListView.builder(
        itemCount: todayList.length,
        itemBuilder: (context, index) {
          final data = todayList[index];
          bool isCompleted =
              ref.read(todoStateProvider.notifier).getStatus(data);
          dynamic color = ref.read(todoStateProvider.notifier).getRandomColor();
          return TodoTile(
            title: data.title,
            description: data.desc,
            start: data.startTime,
            end: data.endTime,
            color: color,
            switcher: Switch(
              value: isCompleted,
              onChanged: (value) {},
            ),
          );
        });
  }
}
