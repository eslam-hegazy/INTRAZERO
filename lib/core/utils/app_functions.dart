import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tappyfi/core/theme/app_color.dart';

void showToast({required String title, required Status status}) {
  Fluttertoast.showToast(
    msg: title,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor:
        status == Status.success ? AppColor.blueColor : AppColor.redColor,
    textColor: AppColor.whiteColor,
    fontSize: 16.0,
  );
}

enum Status { success, error }

Future<void> selectDate({
  required BuildContext context,
  required Function(String) date,
}) async {
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime(2019),
    firstDate: DateTime(1900),
    lastDate: DateTime(2019),
  );
  date(pickedDate.toString());
  print(pickedDate);
}

void showDropdownMenu({
  required BuildContext context,
  required List<String> values,
  required Function(String) result,
}) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: values.map((item) {
            return ListTile(
              title: Text(item),
              onTap: () {
                result(item);
                Navigator.of(context).pop();
              },
            );
          }).toList(),
        ),
      );
    },
  );
}
