import 'package:flutter/material.dart';
import 'package:properties/resource/app_colors.dart';

class SettingsActionWidget extends StatelessWidget {
  const SettingsActionWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
  });
  final IconData icon;
  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
        onTap: onPressed,
        leading: Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8.0),
            color: AppColor.kAppColor100,
          ),
          child: Icon(
            icon,
            size: 18,
            color: theme.primaryColorLight,
          ),
        ),
        minLeadingWidth: 0,
        horizontalTitleGap: 10,
        title: Text(
          title,
          style: theme.textTheme.displaySmall,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: theme.primaryColorLight,
          size: 20,
        ));
    ;
  }
}
