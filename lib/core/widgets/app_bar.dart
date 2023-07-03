import '../utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PopableAppBar extends AppBar {
  final String titleText;
  final Widget? popIcon;
  final List<Widget>? actionIcons;
  final BuildContext context;
  final PreferredSize? bottomChild;
  final void Function()? onPop;

  PopableAppBar(
    this.context, {
    Key? key,
    this.actionIcons,
    required this.titleText,
    this.popIcon,
    this.bottomChild,
    this.onPop,
  }) : super(
          key: key,
          title: Text(
            titleText,
            style: const TextStyle(color: Colors.grey),
          ),
          actionsIconTheme: IconThemeData(color: Palette.s500, size: 24.0),
          toolbarHeight: 70.0,
          titleSpacing: 10.0,
          leading: IconButton(
            onPressed: onPop ?? () => Navigator.pop(context),
            icon: popIcon ??
                Icon(
                  FontAwesomeIcons.arrowLeftLong,
                  size: 20.0,
                  color: Palette.s500,
                ),
          ),
          actions: actionIcons,
          bottom: bottomChild,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: Colors.grey.shade50,
          centerTitle: false,
          elevation: 0.0,
          titleTextStyle: TextStyle(
            color: Palette.s700,
            fontWeight: FontWeight.w700,
            fontSize: 16.0,
          ),
        );
}

class TransparentAppBar extends AppBar {
  final String titleText;
  final Widget? popIcon;
  final SystemUiOverlayStyle? overlay;
  final List<Widget>? actionIcons;
  final BuildContext context;
  final PreferredSize? bottomChild;
  final void Function()? onPop;

  TransparentAppBar(
    this.context, {
    Key? key,
    this.actionIcons,
    required this.titleText,
    this.popIcon,
    this.bottomChild,
    this.overlay,
    this.onPop,
  }) : super(
          key: key,
          title: Text(
            titleText,
            style: const TextStyle(color: Colors.grey),
          ),
          actionsIconTheme: IconThemeData(color: Palette.s500, size: 24.0),
          toolbarHeight: 50.0,
          titleSpacing: 10.0,
          leading: IconButton(
            onPressed: onPop ?? () => Navigator.pop(context),
            icon: popIcon ??
                Icon(
                  FontAwesomeIcons.arrowLeftLong,
                  size: 20.0,
                  color: Colors.grey.shade100,
                ),
          ),
          actions: actionIcons,
          bottom: bottomChild,
          systemOverlayStyle: overlay ?? SystemUiOverlayStyle.light,
          backgroundColor: Colors.transparent,
          centerTitle: false,
          elevation: 0.0,
          titleTextStyle: TextStyle(
            color: Palette.s700,
            fontWeight: FontWeight.w700,
            fontSize: 16.0,
          ),
        );
}

class LandingAppBar extends AppBar {
  final String titleText;
  final Widget? menu;
  final List<Widget>? actionIcons;
  final BuildContext context;

  LandingAppBar(
    this.context, {
    Key? key,
    this.actionIcons,
    required this.titleText,
    this.menu,
  }) : super(
          key: key,
          title: Text(
            titleText,
            style: TextStyle(color: Palette.s50, fontSize: 18),
          ),
          toolbarHeight: 70.0,
          titleSpacing: 10.0,
          leading: menu,
          actions: actionIcons,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: Palette.s100,
          centerTitle: false,
          elevation: 0.0,
          titleTextStyle: TextStyle(
            color: Palette.s700,
            fontWeight: FontWeight.w700,
          ),
        );
}

class SleekAppBarBackground extends StatelessWidget {
  const SleekAppBarBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SleekAppBarPainter(
        size: Size(
          MediaQuery.of(context).size.width,
          160.0,
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(
          vertical: 64.0,
          horizontal: 32.0,
        ),
      ),
    );
  }
}

class SleekAppBarPainter extends CustomPainter {
  final Size size;

  SleekAppBarPainter({
    required this.size,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Palette.s800
      ..strokeWidth = 5
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    var path = Path();
    path.addOval(Rect.fromCircle(
      center: const Offset(150, -340),
      radius: 500,
    ));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
