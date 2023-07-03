import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:properties/core/widgets/empty_list_widget.dart';
import 'package:properties/features/app/blocs/app_bloc/app_bloc.dart';
import 'package:properties/features/properties/model/property_model.dart';
import 'package:properties/injection_container.dart';
import 'package:properties/navigation/navigation_transition.dart';
import 'package:properties/resource/app_strings.dart';
import 'package:properties/resource/app_utils.dart';

class InspectionsPage extends StatefulWidget {
  const InspectionsPage({
    super.key,
  });

  static Page page({
    LocalKey? key,
  }) {
    return CustomPageTransition(
      key: key,
      transitionStyle: PageTransitionStyle.fade,
      child: const InspectionsPage(),
    );
  }

  @override
  State<InspectionsPage> createState() => _InspectionsPageState();
}

class _InspectionsPageState extends State<InspectionsPage> {
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
          title: const Text(
            bookedInspection,
          ),
          titleTextStyle: theme.textTheme.titleSmall,
        ),
        body: BlocListener<AppBloc, AppState>(
          listener: (context, state) {
            pp(state.runtimeType);
          }, 
          child: const SafeArea(
            bottom: false,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EmptyListWidget(
                    icon: Icons.book_online,
                    text: 'No Inspection',
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
