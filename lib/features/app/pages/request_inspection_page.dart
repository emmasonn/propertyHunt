import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:properties/features/app/blocs/app_bloc/app_bloc.dart';
import 'package:properties/features/properties/model/property_model.dart';
import 'package:properties/injection_container.dart';
import 'package:properties/navigation/navigation_transition.dart';
import 'package:properties/resource/app_colors.dart';
import 'package:properties/resource/app_strings.dart';
import 'package:properties/resource/app_utils.dart';

class RequestInspectionPage extends StatefulWidget {
  const RequestInspectionPage({
    super.key,
  });

  static Page page({
    LocalKey? key,
  }) {
    return CustomPageTransition(
      key: key,
      transitionStyle: PageTransitionStyle.fade,
      child: const RequestInspectionPage(),
    );
  }

  @override
  State<RequestInspectionPage> createState() => _RequestInspectionPageState();
}

class _RequestInspectionPageState extends State<RequestInspectionPage> {
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
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close_rounded,
              size: 24,
              color: AppColor.kAppColor500,
            ),
          ),
          title: const Text(
            requestInspection,
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
                children: [],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
