/// ***
/// This class consists of the DateWidget that is used in the ListView.builder
///
/// Author: Vivek Kaushik <me@vivekkasuhik.com>
/// github: https://github.com/iamvivekkaushik/
/// ***

import 'package:date_picker_timeline/gestures/tap.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum WeekDayPosition { top, bottom }

class DateWidget extends StatelessWidget {
  final double? width;
  final DateTime date;
  final TextStyle? monthTextStyle, dayTextStyle, dateTextStyle;
  final Color selectionColor;
  final WeekDayPosition weekDayPosition;
  final DateSelectionCallback? onDateSelected;
  final String? locale;

  DateWidget({
    required this.date,
    required this.monthTextStyle,
    required this.dayTextStyle,
    required this.dateTextStyle,
    required this.weekDayPosition,
    required this.selectionColor,
    this.width,
    this.onDateSelected,
    this.locale,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 10,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        margin: EdgeInsets.only(left: 3.0, right: 3.0, top: 3.0, bottom: 1),
        child: Container(
          width: width,
          decoration: BoxDecoration(
            color: selectionColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Text(new DateFormat("MMM", locale).format(date).toUpperCase(), // Month
                //     style: monthTextStyle),
                if (weekDayPosition == WeekDayPosition.top) ...[
                  Text(new DateFormat("E", locale).format(date).toUpperCase(),
                      // WeekDay
                      style: dayTextStyle),
                ],
                Text(date.day.toString(), // Date
                    style: dateTextStyle),
                if (weekDayPosition == WeekDayPosition.bottom) ...[
                  Text(new DateFormat("E", locale).format(date).toUpperCase(),
                      // WeekDay
                      style: dayTextStyle),
                ],
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        // Check if onDateSelected is not null
        if (onDateSelected != null) {
          // Call the onDateSelected Function
          onDateSelected!(this.date);
        }
      },
    );
  }
}
