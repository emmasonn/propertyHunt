import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:properties/core/widgets/filled_button.dart';
import 'package:properties/core/widgets/outline_button.dart';
import 'package:properties/features/app/blocs/app_bloc/app_bloc.dart';
import 'package:properties/features/app/widgets/business_widget.dart';
import 'package:properties/features/app/widgets/property_card.dart';
import 'package:properties/features/properties/model/property_model.dart';
import 'package:properties/injection_container.dart';
import 'package:properties/navigation/app_paths.dart';
import 'package:properties/navigation/navigation_transition.dart';
import 'package:properties/resource/app_colors.dart';
import 'package:properties/resource/app_utils.dart';

class PropertyDetailPage extends StatefulWidget {
  const PropertyDetailPage({
    super.key,
    required this.property,
  });
  final PropertyModel property;

  static Page page({
    LocalKey? key,
    required PropertyModel propertyModel,
  }) {
    return CustomPageTransition(
      key: key,
      transitionStyle: PageTransitionStyle.fade,
      child: PropertyDetailPage(
        property: propertyModel,
      ),
    );
  }

  @override
  State<PropertyDetailPage> createState() => _PropertyDetailPageState();
}

class _PropertyDetailPageState extends State<PropertyDetailPage> {
  final appBloc = sl<AppBloc>();
  PropertyModel? property;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => appBloc,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            '${cleanPropertyArea(widget.property)}, ${cleanPropertyState(widget.property)}',
          ),
          titleTextStyle: theme.textTheme.titleSmall,
        ),
        body: BlocListener<AppBloc, AppState>(
          listener: (context, state) {
            pp(state.runtimeType);
          },
          child: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PropertyWidget(
                    property: widget.property,
                    swipable: true,
                  ),
                  //vertical spacer

                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: size.width,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: OutlineButtonEx(
                              onPressed: () {
                                GoRouter.of(context)
                                    .pushNamed(AppPath.requestInspectionPath);
                              },
                              outlineColor: theme.primaryColorLight,
                              text: 'Request an inspection',
                              style: theme.textTheme.displaySmall!,
                            ),
                          ),
                        ),
                        Divider(
                          color: theme.primaryColorLight,
                          thickness: 0.5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 16.0),
                          child: Text(
                            'Description',
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 24.0),
                          child: Text(
                            widget.property.description ?? '',
                            style: theme.textTheme.labelMedium,
                          ),
                        ),
                        Divider(
                          color: theme.primaryColorLight,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 16.0),
                          child: Text(
                            'Property features',
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),
                        Divider(
                          color: theme.primaryColorLight,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 16.0),
                          child: Text(
                            'Inspections',
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),

                        //vertical spacer
                        const SizedBox(
                          height: 10.0,
                        ),
                        Center(
                          child: Container(
                            width: size.width,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: OutlineButtonEx(
                              onPressed: () {
                                GoRouter.of(context)
                                    .pushNamed(AppPath.requestInspectionPath);
                              },
                              outlineColor: theme.primaryColorLight,
                              text: 'Request an inspection',
                              style: theme.textTheme.displaySmall!,
                            ),
                          ),
                        ),
                        //vertical spacer
                        const SizedBox(
                          height: 8.0,
                        ),
                        Center(
                          child: TextButton(
                              onPressed: () {
                                GoRouter.of(context)
                                    .pushNamed(AppPath.viewInspectionsPath);
                              },
                              child: Text(
                                'View my inspection schedules',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: AppColor.kAppColor500,
                                ),
                              )),
                        ),

                        //business widget
                        BusinessWidget(property: widget.property),
                        Divider(
                          color: theme.primaryColorLight,
                          thickness: 1.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Property No. 454343555',
                            softWrap: true,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                        Divider(
                          color: theme.primaryColorLight,
                          thickness: 1.0,
                        ),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16.0, bottom: 50, top: 16.0),
                            width: size.width,
                            child: FilledButtonEx(
                              backgroundColor: Colors.red,
                              onPressed: () {},
                              text: 'MAKE ENQUIRY',
                              style: theme.textTheme.displaySmall!
                                  .copyWith(fontSize: 14, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
