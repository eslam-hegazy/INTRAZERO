 import 'package:flutter/material.dart';
import 'package:tappyfi/core/theme/app_fonts.dart';

Widget customItem({required String title, required String value}) => Row(
        children: [
          Text(
            "$title : ",
            style: AppFonts.normalStyle(fontWeight: FontWeight.w600),
          ),
          Text(value, style: AppFonts.normalStyle()),
        ],
      );