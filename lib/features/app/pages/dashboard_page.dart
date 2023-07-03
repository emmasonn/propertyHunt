import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:properties/core/utils/core_utils.dart';
import 'package:properties/features/app/blocs/app_bloc/app_bloc.dart';
import 'package:properties/features/app/pages/filters_page.dart';
import 'package:properties/injection_container.dart';
import 'package:properties/navigation/app_paths.dart';
import 'package:properties/navigation/navigation_transition.dart';
import 'package:properties/resource/app_colors.dart';
import 'package:properties/resource/app_dimen.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  static Page page({LocalKey? key}) {
    return CustomPageTransition(
      key: key,
      transitionStyle: PageTransitionStyle.fade,
      child: const DashboardPage(),
    );
  }

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final appBloc = sl<AppBloc>();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => appBloc..add(CacheAddressEvent()),
      child: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          pp(state.runtimeType);
        },
        child: SafeArea(
          bottom: false,
          top: false,
          child: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                shadowColor: null,
                leadingWidth: 0,
                toolbarHeight: 90,
                leading: const SizedBox(),
                title: Card(
                  elevation: 0.5,
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(AppDimen.searchCornerRadius),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(
                            AppDimen.searchCornerRadius,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_pin,
                                size: 20,
                                color: theme.primaryColorLight,
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                'Wuye, FCT',
                                style: theme.textTheme.displaySmall,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 2),
                                child: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  size: 24,
                                  color: AppColor.kAppColor500,
                                ),
                              ),
                            ],
                          ),
                        ),

                        //horizontal Spacer
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            GoRouter.of(context)
                                .push(AppPath.viewInspectionsPath);
                          },
                          icon: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  AppDimen.searchCornerRadius,
                                ),
                                border:
                                    Border.all(color: theme.primaryColorLight)),
                            padding: const EdgeInsets.all(4.0),
                            child: const Icon(
                              Icons.book_online_outlined,
                              color: AppColor.kAppColor500,
                              size: 24,
                            ),
                          ),
                        ),
                        
                        IconButton(
                          onPressed: () {},
                          icon: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  AppDimen.searchCornerRadius,
                                ),
                                border:
                                    Border.all(color: theme.primaryColorLight)),
                            padding: const EdgeInsets.all(4.0),
                            child: const Icon(
                              Icons.menu_rounded,
                              color: AppColor.kAppColor500,
                              size: 24,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                scrolledUnderElevation: 2.0,
                bottom: TabBar(
                  indicatorColor: AppColor.kAppColor500,
                  labelColor: AppColor.kAppColor500,
                  labelPadding: const EdgeInsets.symmetric(vertical: 5),
                  indicatorPadding: EdgeInsets.zero,
                  indicatorSize: TabBarIndicatorSize.label,
                  unselectedLabelColor: theme.primaryColorLight,
                  labelStyle: theme.textTheme.displaySmall,
                  unselectedLabelStyle: theme.textTheme.displaySmall,
                  tabs: const [
                    Text('Apartments\n for sale'),
                    Text('Apartments\n for rent'),
                    Text('Lands'),
                  ],
                ),
              ),
              body: const TabBarView(children: [
                FiltersPage(filter: 'sale'),
                FiltersPage(filter: 'Rent'),
                FiltersPage(filter: 'Land')
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
