import 'package:flutter/material.dart';

import '../../../../core/constants/app_color.dart';

class RoleButton extends StatelessWidget {
  final String label;
  final String selectedRole;
  final String value;
  final Function(String) onRoleChanged;

  const RoleButton({
    super.key,
    required this.label,
    required this.onRoleChanged,
    required this.value,
    required this.selectedRole,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onRoleChanged(value);
      },
      child: selectedRole == value
          ? Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: AppColor.gradient2,
                border: Border.all(color: AppColor.gradient2, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(label, style: TextStyle(color: Colors.white)),
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColor.borderColor, width: 2),
              ),
              child: Center(child: Text(label)),
            ),
    );
  }
}
