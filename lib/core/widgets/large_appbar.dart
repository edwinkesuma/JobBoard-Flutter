import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_board/core/constants/app_color.dart';

import '../constants/app_dimensions.dart';

class LargeAppbar extends StatelessWidget {
  const LargeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.only(bottom: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColor.borderColor.withAlpha(30)),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppDimensions.desktopWidth,
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/job_board.svg",
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Job Board",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: const CircleAvatar(
                    child: Icon(Icons.person, size: 40),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
