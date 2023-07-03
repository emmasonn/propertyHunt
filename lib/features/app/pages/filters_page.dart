import 'package:flutter/material.dart';
import 'package:properties/core/utils/core_utils.dart';
import 'package:properties/core/widgets/empty_list_widget.dart';
import 'package:properties/features/app/remote/mock_source.dart';
import 'package:properties/features/app/widgets/properties_loading_widget.dart';
import 'package:properties/features/app/widgets/property_card.dart';
import 'package:properties/injection_container.dart';

class FiltersPage extends StatefulWidget {
  const FiltersPage({
    Key? key,
    this.city,
    this.state,
    required this.filter,
  }) : super(key: key);
  final String? state;
  final String? city;
  final String filter;

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return FutureBuilder(
      future: sl<MockSource>().getProperties(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (!snapshot.hasError) {
            final properties = snapshot.data ?? [];
            return properties.isNotEmpty
                ? Scrollbar(
                    child: ListView.builder(
                      itemCount: properties.length,
                      itemBuilder: (context, index) {
                        final property = properties[index];
                        return PropertyCard(
                          property: property,
                        );
                      },
                    ),
                  )
                : const Center(
                    child: EmptyListWidget(text: 'No properties found'),
                  );
          } else {
            pp(snapshot.error);
            return const EmptyListWidget(
              text: 'An error occurred',
            );
          }
        } else {
          return const PropertiesLoading();
        }
      },
    );
  }
}
