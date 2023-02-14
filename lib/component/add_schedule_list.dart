import 'package:calender_scheduler_2nd/database/drift_database.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../const/color.dart';
import 'color_picker.dart';
import 'custom_textfield.dart';

class AddScheduleList extends StatefulWidget {
  const AddScheduleList({
    Key? key,
  }) : super(key: key);

  @override
  State<AddScheduleList> createState() => _AddScheduleListState();
}

class _AddScheduleListState extends State<AddScheduleList> {
  final GlobalKey<FormState> formKey = GlobalKey();
  int? startTime;
  int? endTime;
  String? content;
  int? selectedColorId;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: primaryColor,
      child: Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (_) {
            final bottomInset = MediaQuery.of(context).viewInsets.bottom;

            return GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: SafeArea(
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height / 2 + bottomInset,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: bottomInset),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  onSaved: onStartSaved,
                                  title: '시작시간',
                                  isTimeField: true,
                                ),
                              ),
                              Expanded(
                                child: CustomTextField(
                                  onSaved: onEndSaved,
                                  title: '끝나는시간',
                                  isTimeField: true,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Expanded(
                            child: CustomTextField(
                              onSaved: onTextSaved,
                              title: '일정내용',
                              isTimeField: false,
                            ),
                          ),
                          FutureBuilder<List<CategoryColor>>(
                              future:
                                  GetIt.I<LocalDatabase>().getCategoryColors(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData &&
                                    selectedColorId == null &&
                                    snapshot.data!.isNotEmpty) {
                                  selectedColorId = snapshot.data![0].id;
                                }
                                return ColorPicker(
                                  selectedColorId: selectedColorId,
                                  colors:
                                      snapshot.hasData ? snapshot.data! : [],
                                  colorIdSetter: (int id) {
                                    setState(() {
                                      selectedColorId = id;
                                      print(selectedColorId);
                                    });
                                  },
                                );
                              }),
                          _SaveButton(
                            onPressed: onSavePressed,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void onStartSaved(String? val) {
    startTime = int.parse(val!);
  }

  void onEndSaved(String? val) {
    endTime = int.parse(val!);
  }

  void onTextSaved(String? val) {
    content = val;
  }

  void onSavePressed() {
    if (formKey.currentState == null) {
      return;
    }
    if (formKey.currentState!.validate()) {
      print('에러가 없습니다.');
      formKey.currentState!.save();
    } else {
      print('에러가 있습니다.');
    }
  }
}

class _SaveButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _SaveButton({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
              ),
              onPressed: onPressed,
              child: Text('저장하기'),
            ),
          ),
        ],
      ),
    );
  }
}
