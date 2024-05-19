import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabDetailWidget extends StatelessWidget {
  const TabDetailWidget({
    super.key,
    required this.title,
    required this.isSelected,
    required this.isDark,
    this.onTap,
  });

  final String title;
  final bool isSelected;
  final bool isDark;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10.w, right: 10.w),
              alignment: Alignment.center,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isSelected
                      ? const Color(0xFF179CFF)
                      : const Color(0xFF7981A3),
                  fontSize: 12.sp,
                  fontFamily: 'PingFang SC',
                  fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                ),
              ),
            ),
            isSelected
                ? Container(
                    width: 30.w,
                    height: 2.h,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF179CFF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    ),
                  )
                : Container(),
          ],
        ));
  }
}
