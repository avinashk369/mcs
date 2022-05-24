import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mcs/utils/utils.dart';

class DateFormatter {
  DateFormatter();
  String getVerboseDateTimeRepresentation(String dateString) {
    DateFormat format = DateFormat("yyyy-MM-dd");
    DateTime dateTime = format.parse(dateString);
    DateTime now = DateTime.now();
    DateTime justNow = now.subtract(const Duration(minutes: 1));
    DateTime localDateTime = dateTime.toLocal();
    // if (!localDateTime.difference(justNow).isNegative) {
    //   return "Just Now";
    // }
    String roughTimeString = DateFormat('jm').format(dateTime);
    if (localDateTime.day == now.day &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      return "Today";
    }
    DateTime yesterDay = now.subtract(const Duration(days: 1));
    if (localDateTime.day == yesterDay.day &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      return "Yesterday";
    }
    // if (now.difference(localDateTime).inDays < 4) {
    //   String weekday = DateFormat('EEEE', 'EN').format(localDateTime);
    //   return '$weekday';
    // }
    return '$dateString';
  }

  static String timeAgoSinceDate(String dateString,
      {bool numericDates = true}) {
    DateTime notificationDate =
        DateFormat("dd-MM-yyyy h:mma").parse(dateString);
    final date2 = DateTime.now();
    final difference = date2.difference(notificationDate);

    if (difference.inDays > 8) {
      return dateString.substring(0, 10);
    } else if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates) ? '1 week ago' : 'Last week';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }

  static String dmy(String date) {
    DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);

    return DateFormat('d LLL y').format(parseDate);
  }

  static String dateTimeConverter(String date) {
    DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('MM-dd-yyyy h:mma');
    var outputDate = outputFormat.format(inputDate);
    print(outputDate);
    return outputDate;
  }

  // time token to date time
  String getMessageTimeStamp(int timetoken) => DateFormat.jm().format(
      DateTime.fromMicrosecondsSinceEpoch(timetoken ~/ 10, isUtc: true)
          .toLocal());

  static String dateToString(DateTime rawDate) {
    //DateTime rawDate = DateFormat("yyyy-MM-dd kk:mm").parse(date);
    return DateFormat('d').format(rawDate) +
        " " +
        DateFormat('LLL').format(rawDate) +
        " " +
        DateFormat('jm').format(rawDate);
  }

  static String dateToDateMonthDay(DateTime rawDate) {
    return DateFormat('EEE MMM d').format(rawDate);
  }

  static String dateToStringTime(DateTime rawDate) {
    return DateFormat('jm').format(rawDate);
  }

  static DateTime stringToDateTime(String dateTime) =>
      DateFormat("yyyy-MM-dd").parse(dateTime);

  static String dateTimeToString(DateTime dateTime) =>
      DateFormat("yyyy-MM-dd").format(dateTime);

  static String dayMonth(String date) {
    return DateFormat('d').format(stringToDateTime(date)) +
        " " +
        DateFormat('LLL').format(stringToDateTime(date));
  }

  static DateTime stringToDate(String dateTime) =>
      DateFormat("yyyy-MM-dd hh:mm:ss").parse(dateTime);
}
