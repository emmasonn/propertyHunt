import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:properties/resource/app_colors.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundColor: AppColor.kAppColor100,
            child: Icon(
              FontAwesomeIcons.user,
              color: AppColor.kAppColor500,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            'Kingsley Chibuike',
            style: theme.textTheme.displaySmall,
          ),
          Text(
            'words.cs1@gmail.com',
            style: theme.textTheme.labelSmall,
          ),
          const SizedBox(
            height: 10.0,
          ),
          OutlinedButton(
              onPressed: () {},
              child: Text(
                'Edit Profile',
                style: theme.textTheme.bodySmall,
              ))
        ],
      ),
    );
  }
}
