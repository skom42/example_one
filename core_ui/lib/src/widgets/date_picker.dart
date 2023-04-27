import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';

class DatePicker extends StatefulWidget {
  final double height;
  final DateTime initialDate;
  final CupertinoDatePickerMode pickerMode;
  final void Function(DateTime? newDate) onDateTimeChanged;

  const DatePicker({
    required this.height,
    required this.pickerMode,
    required this.initialDate,
    required this.onDateTimeChanged,
  });

  @override
  State<DatePicker> createState() => _DatePrickerState();
}

class _DatePrickerState extends State<DatePicker> {
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        height: widget.height,
        color: AppTheme.backgroundPrimaryColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: CupertinoDatePicker(
                mode: widget.pickerMode,
                minimumYear: 1990,
                maximumDate: DateTimeUtils.endOfTodayDate,
                maximumYear: DateTimeUtils.endOfTodayDate.year,
                initialDateTime: DateTimeUtils.currentDate,
                use24hFormat: true,
                dateOrder: DatePickerDateOrder.dmy,
                onDateTimeChanged: (DateTime? dateTime) {
                  widget.onDateTimeChanged(dateTime);
                  setState(() {
                    _selectedDate = dateTime;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 6,
              ),
              child: MainAppButton(
                height: 45,
                onPressed: () {
                  widget.onDateTimeChanged(_selectedDate);
                  Navigator.pop(context);
                },
                text: FlutterI18n.translate(context, 'addActivity.buttonConfirm'),
                backgroundColor: AppTheme.buttonBgColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
