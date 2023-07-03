import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'floating_menu_widget.dart';

class CustomSpeedDial extends StatefulWidget {
  final void Function() onResult;
  final void Function() onTrending;

  const CustomSpeedDial({
    Key? key,
    required this.onResult,
    required this.onTrending,
  }) : super(key: key);

  @override
  State<CustomSpeedDial> createState() => _CustomSpeedDialState();
}

class _CustomSpeedDialState extends State<CustomSpeedDial> {
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      childrenButtonSize: const Size(100, 45),
      elevation: 12.0,
      overlayOpacity: 0.8,
      openCloseDial: isDialOpen,
      animationCurve: Curves.ease,
      closeDialOnPop: true,
      animationDuration: const Duration(milliseconds: 300),
      curve: Curves.ease,
      useRotationAnimation: true,
      onClose: () {
        setState(() {});
      },
      onOpen: () {
        setState(() {});
      },
      children: [
        SpeedDialChild(
          labelWidget: FloatingMenuWidget(
            title: 'Post Result',
            icon: Icons.post_add,
            onPressed: () async {
              isDialOpen.value = false;

              widget.onResult();
            },
          ),
        ),
        SpeedDialChild(
          labelWidget: FloatingMenuWidget(
            title: 'Capture Event',
            icon: Icons.bolt_rounded,
            onPressed: () async {
              isDialOpen.value = false;

              widget.onTrending();
            },
          ),
        ),
      ],
      child: Transform.rotate(
        angle: isDialOpen.value ? pi / 4 : 0,
        child: const Icon(Icons.add),
      ),
    );
  }
}
