import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:properties/features/properties/model/property_model.dart';

class BusinessWidget extends StatelessWidget {
  const BusinessWidget({
    super.key,
    required this.property,
  });
  final PropertyModel property;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: size.width,
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16.0,
          ),
          color: const Color(0xFFFFFFFF),
          child: Text(
            'Abuja Properties',
            style: theme.textTheme.bodyLarge?.copyWith(color: Colors.black),
          ),
        ),
        //vertical spacer
        const SizedBox(
          height: 10.0,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'SPG ASSET Managmenent - Trigal',
              softWrap: true,
              style: theme.textTheme.titleSmall,
            ),
            //vertical spacer
            const SizedBox(
              height: 5.0,
            ),
            Text(
              'No44, 4th avenue gwarinpa',
              style: theme.textTheme.labelSmall,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'VIEW AGENCY PROFILE',
                style: theme.textTheme.labelSmall,
              ),
            ),
          ]),
        ),
        Divider(
          color: theme.primaryColorLight,
          thickness: 1.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    child: CircleAvatar(
                      radius: 29,
                      backgroundColor: Colors.black,
                      child: Icon(FontAwesomeIcons.user),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'King Ansalem',
                    softWrap: true,
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.call,
                      size: 24,
                    ),
                    color: theme.primaryColor,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.chat,
                      size: 24,
                    ),
                    color: theme.primaryColor,
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
