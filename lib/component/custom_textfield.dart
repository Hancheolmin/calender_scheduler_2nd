import 'package:calender_scheduler_2nd/const/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final bool isTimeField;
  final FormFieldSetter<String> onSaved;

  const CustomTextField({
    required this.title,
    required this.isTimeField,
    required this.onSaved,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (isTimeField) TextFields(),
          if (!isTimeField) Expanded(child: TextFields()),
        ],
      ),
    );
  }

  Widget TextFields() {
    return TextFormField(
      onSaved: onSaved,
      validator: (String? val) {
        if (val == null || val.isEmpty) {
          return '값을 입력해주세요';
        }

        if (isTimeField) {
          int time = int.parse(val);
          if (time < 0 || time > 24) {
            return '0~24 사이의 숫자를 입력하세요';
          }
        }
        return null;
      },
      expands: !isTimeField,
      maxLines: null,
      cursorColor: Colors.grey,
      keyboardType:
          isTimeField ? TextInputType.number : TextInputType.multiline,
      inputFormatters:
          isTimeField ? [FilteringTextInputFormatter.digitsOnly] : [],
      decoration: InputDecoration(
        border: InputBorder.none,
        fillColor: Colors.grey[300],
        filled: true,
      ),
    );
  }
}
