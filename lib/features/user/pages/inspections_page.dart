import 'package:flutter/material.dart';
import 'package:properties/core/widgets/app_text_field.dart';
import 'package:properties/features/auth/widgets/content_animation.dart';
import 'package:properties/navigation/navigation_transition.dart';
import 'package:properties/resource/app_strings.dart';

class InspectionsPage extends StatefulWidget {
  const InspectionsPage({super.key});

  static Page page({LocalKey? key}) {
    return CustomPageTransition<void>(
      key: key,
      transitionStyle: PageTransitionStyle.fade,
      duration: const Duration(milliseconds: 500),
      child: const InspectionsPage(),
    );
  }

  @override
  State<InspectionsPage> createState() => _InspectionsPageState();
}

class _InspectionsPageState extends State<InspectionsPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          createAccount,
        ),
        titleTextStyle: theme.textTheme.titleMedium,
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          padding:
          EdgeInsets.symmetric(horizontal: size.width * 0.08, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ContentAnimation(
                position: 0,
                itemCount: 4,
                child: AppTextField(
                  text: '',
                  icon: Icons.person,
                  hint: firstNameTxt,
                  onChange: (value) {},
                  action: TextInputAction.send,
                  capitalization: TextCapitalization.words,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              FilledButton(
                onPressed: () {},
                child: const Text(
                  'Continue',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
