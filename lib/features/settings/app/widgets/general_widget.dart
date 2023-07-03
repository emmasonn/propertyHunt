import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:properties/resource/app_colors.dart';
import 'package:provider/provider.dart';
import '../manager/theme_manager.dart';

class GeneralWidget extends StatelessWidget {
  const GeneralWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            color: AppColor.kAppColor50,
          ),
          child: Row(
            children: [
              Text(
                'General',
                style: theme.textTheme.displaySmall?.copyWith(
                  color: AppColor.kAppColor900,
                ),
              ),
            ],
          ),
        ),
        //spaceer
        const SizedBox(
          height: 10,
        ),
        Consumer<ThemeManager>(
          builder: (context, themeManager, child) {
            return ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8.0),
                  color: AppColor.kAppColor100,
                ),
                child: Icon(
                  Icons.dark_mode,
                  color: theme.primaryColorLight,
                ),
              ),
              minLeadingWidth: 0,
              horizontalTitleGap: 10,
              title: Text(
                'Dark Mode',
                style: theme.textTheme.displaySmall,
              ),
              trailing: CupertinoSwitch(
                value: themeManager.isDark,
                onChanged: (value) {
                  Provider.of<ThemeManager>(context, listen: false)
                      .switchDarkTheme(value);
                },
              ),
            );
          },
        ),
      
      ],
    );
  }
}
