import 'package:flutter/material.dart';
import 'package:properties/core/animations/slide_animation.dart';
import 'package:properties/core/utils/country.dart';
import 'package:properties/core/widgets/custom_search_field.dart';


class AppPickCountry extends StatefulWidget {
  const AppPickCountry({
    super.key,
    required this.onSelected,
  });
  final Function(Country) onSelected;

  @override
  State<AppPickCountry> createState() => _AppPickCountryState();
}

class _AppPickCountryState extends State<AppPickCountry>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  List<Country> searchResult = [];

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: false,
          title: const Text('Select Country Code'),
          titleTextStyle: theme.textTheme.titleMedium,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomSearchField(
                  themeColor: theme.primaryColor,
                  hint: 'Search country',
                  onSearch: (value) {},
                  onchange: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        searchResult = Country.ALL
                            .where((country) => country.name
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      });
                    } else {
                      setState(() {
                        searchResult = [];
                      });
                    }
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: searchResult.isEmpty
                      ? Country.ALL.length
                      : searchResult.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final Country item = searchResult.isEmpty
                        ? Country.ALL[index]
                        : searchResult[index];
                    return SlideAnimation(
                      itemCount: Country.ALL.length,
                      position: index,
                      slideDirection: SlideDirection.fromTop,
                      animationController: animationController,
                      child: InkWell(
                        onTap: () {
                          //Pop screen out
                          Navigator.pop(context);
                          //select country
                          widget.onSelected.call(item);
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            right: 32,
                          ),
                          child: ListTile(
                            leading: Text(
                              '+${item.dialingCode}',
                              style: theme.textTheme.bodyMedium
                            ),
                            title: Row(
                              children: [
                                SizedBox(
                                  height: 20,
                                  width: 30,
                                  child: Image.asset(
                                    item.asset,
                                    package: null,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Expanded(
                                  child: Text(
                                    item.name,
                                    style:theme.textTheme.bodyMedium
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
