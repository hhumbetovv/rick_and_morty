import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppDropdown<T> extends StatefulWidget {
  const AppDropdown({
    Key? key,
    required this.value,
    required this.values,
    required this.onChanged,
  }) : super(key: key);

  final T value;
  final List<(T value, String text)> values;
  final void Function(T status) onChanged;

  @override
  State<AppDropdown<T>> createState() => _AppDropdownState<T>();
}

class _AppDropdownState<T> extends State<AppDropdown<T>> {
  late T currentValue;

  @override
  void initState() {
    super.initState();
    currentValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: DropdownButton<T>(
          value: currentValue,
          isExpanded: true,
          underline: const SizedBox(),
          padding: const EdgeInsets.symmetric(horizontal: 14),
          items: widget.values.map((element) {
            return DropdownMenuItem(
              value: element.$1,
              child: Text(element.$2.tr()),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              currentValue = value ?? widget.value;
            });
            widget.onChanged(value ?? widget.value);
          },
        ),
      ),
    );
  }
}
