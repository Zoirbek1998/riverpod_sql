import "package:bloc_clean_arxitectura/common/models/task.dart";
import "package:bloc_clean_arxitectura/common/utils/widgets/app_style.dart";
import "package:bloc_clean_arxitectura/common/utils/widgets/constants.dart";
import "package:bloc_clean_arxitectura/common/utils/widgets/custom_otn_btn.dart";
import "package:bloc_clean_arxitectura/common/utils/widgets/custom_text_field.dart";
import "package:bloc_clean_arxitectura/features/todo/controller/dates/dates_provider.dart";
import "package:bloc_clean_arxitectura/features/todo/controller/todo/todo_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;

class AddTask extends ConsumerStatefulWidget {
  const AddTask({super.key});

  @override
  ConsumerState createState() => _AddTaskState();
}

class _AddTaskState extends ConsumerState<AddTask> {
  var titleController = TextEditingController();
  var descController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var scheduleDate = ref.watch(datesStateProvider);
    var start = ref.watch(startTimeStateProvider);
    var finish = ref.watch(finishTimeStateProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              hintText: "Add title",
              controller: titleController,
              hintStyle: appStyle(16, AppConst.kGreyLight, FontWeight.w600),
              marginHori: 0,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              hintText: "Add description",
              controller: descController,
              hintStyle: appStyle(16, AppConst.kGreyLight, FontWeight.w600),
              marginHori: 0,
            ),
            const SizedBox(height: 20),
            CustomOtnBtn(
              onTap: () {
                picker.DatePicker.showDatePicker(
                  context,
                  showTitleActions: true,
                  minTime: DateTime(2020, 1, 1),
                  maxTime: DateTime(2024, 6, 7),
                  theme: const picker.DatePickerTheme(
                      doneStyle:
                          TextStyle(color: AppConst.kGreen, fontSize: 16)),
                  onChanged: (date) {},
                  onConfirm: (date) {
                    ref
                        .read(datesStateProvider.notifier)
                        .setDate(date.toString());
                  },
                  currentTime: DateTime.now(),
                  locale: picker.LocaleType.en,
                );
              },
              color: AppConst.kLight,
              color2: AppConst.kBlueLight,
              text: scheduleDate == ""
                  ? "Set Date"
                  : scheduleDate.substring(0, 10),
              width: size.width,
              height: 52,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomOtnBtn(
                  onTap: () {
                    picker.DatePicker.showDateTimePicker(context,
                        showTitleActions: true,
                        onChanged: (date) {}, onConfirm: (date) {
                      ref
                          .read(startTimeStateProvider.notifier)
                          .setStart(date.toString());
                    }, locale: picker.LocaleType.en);
                  },
                  color: AppConst.kLight,
                  color2: AppConst.kBlueLight,
                  text: start == "" ? "Start Time" : start.substring(10, 16),
                  width: size.width * 0.4,
                  height: 52,
                ),
                CustomOtnBtn(
                  onTap: () {
                    picker.DatePicker.showDateTimePicker(context,
                        showTitleActions: true,
                        onChanged: (date) {}, onConfirm: (date) {
                      ref
                          .read(finishTimeStateProvider.notifier)
                          .setStart(date.toString());
                    }, locale: picker.LocaleType.en);
                  },
                  color: AppConst.kLight,
                  color2: AppConst.kBlueLight,
                  text: finish == "" ? "Finish Time" : finish.substring(10, 16),
                  width: size.width * 0.4,
                  height: 52,
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomOtnBtn(
              onTap: () {
                if (titleController.text.isNotEmpty &&
                    descController.text.isNotEmpty &&
                    scheduleDate.isNotEmpty &&
                    start.isNotEmpty &&
                    finish.isNotEmpty) {
                  Task task = Task(
                    title: titleController.text,
                    desc: descController.text,
                      isCompleted:0,
                    startTime: start.substring(10,16),
                    endTime: finish.substring(10,16),
                    remind: 0,
                    repeat: "yes",
                    
                  );
                  ref.read(todoStateProvider.notifier).addItem(task);
                  ref.read(finishTimeStateProvider.notifier).setStart("");
                  ref.read(startTimeStateProvider.notifier).setStart("");
                  ref.read(datesStateProvider.notifier).setDate("");
                  Navigator.pop(context);
                }else{
                  
                }
              },
              color: AppConst.kLight,
              color2: AppConst.kGreen,
              text: "Submit",
              width: size.width,
              height: 52,
            ),
          ],
        ),
      ),
    );
  }
}
