import 'package:flutter/material.dart';
import 'package:properties/navigation/navigation_transition.dart';


class PageSettings extends StatefulWidget {
  const PageSettings({super.key});

  static Page page({LocalKey? key}) {
    return CustomPageTransition(
      key: key,
      transitionStyle: PageTransitionStyle.fade,
      child: const PageSettings(),
    );
  }

  @override
  State<PageSettings> createState() => _PageSettingsState();
}

class _PageSettingsState extends State<PageSettings> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'settingsText',
        ),
        centerTitle: false,
        titleTextStyle: theme.textTheme.titleMedium,
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              children: const [
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
