import 'package:flutter/material.dart';
import 'package:flutter_course/ui/values/values.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title = '',
    this.back = false,
  }) : super(key: key);

  final String title;
  final bool back;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height + MediaQuery.of(context).padding.top,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppBarIcon(
              icon: back ? Icons.keyboard_arrow_left : Icons.grid_view_outlined,
              size: back ? 28 : 24,
              onTap: () {
                if (back) {
                  Navigator.of(context).pop();
                } else {}
              },
            ),
            Container(
              height: 45,
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: AppColors.accentColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            AppBarIcon(
              icon: Icons.notifications_outlined,
              badge: true,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}

class AppBarIcon extends StatelessWidget {
  const AppBarIcon({
    Key? key,
    required this.icon,
    this.badge = false,
    required this.onTap,
    this.size = 24.0,
  }) : super(key: key);

  final IconData icon;
  final bool badge;
  final VoidCallback onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  icon,
                  color: AppColors.accentColor,
                  size: size,
                ),
                if (badge)
                  Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      backgroundColor: AppColors.redColor,
                      radius: 3,
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
