import 'package:calender_scheduler_2nd/database/drift_database.dart';
import 'package:flutter/material.dart';

typedef ColorIdSetter = void Function(int id);

class ColorPicker extends StatelessWidget {
  final List<CategoryColor> colors;
  final int? selectedColorId;
  final ColorIdSetter colorIdSetter;

  const ColorPicker({
    required this.colors,
    required this.selectedColorId,
    required this.colorIdSetter,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Wrap(
        spacing: 8,
        runSpacing: 10,
        children: colors
            .map(
              (e) => GestureDetector(
                onTap: () {
                  colorIdSetter(e.id);
                },
                child: renderColor(e, selectedColorId == e.id),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget renderColor(CategoryColor color, bool isSelected) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        border: isSelected ? Border.all(color: Colors.black, width: 2.0) : null,
        color: Color(
          int.parse('0xff${color.hexCode}'),
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}
