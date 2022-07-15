import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  var controller = TextEditingController();
  String? label;
  String? hintText;
  DatePicker(
      {required this.controller, required this.label, required this.hintText});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            labelText: widget.label,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: widget.hintText,
          ),
        ),
        trailing: ElevatedButton(
            onPressed: () async {
              DateTime? datepicked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2050));
              if (datepicked != null) {
                String dateFormat = DateFormat('dd-MM-yyy').format(datepicked);
                setState(() {
                  widget.controller.text = dateFormat;
                });
              } else {}
            },
            child: const Icon(Icons.calendar_today)));
  }
}
