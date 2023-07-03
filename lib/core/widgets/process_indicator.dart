import 'package:flutter/material.dart';
import '../utils/enums.dart';

import 'loading_icon.dart';

class ProcessIndicator extends StatelessWidget {
  final ProcessState processState;
  final Color? color;
  final Widget idleWidget;

  const ProcessIndicator({
    Key? key,
    required this.processState,
    this.color,
    required this.idleWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (processState) {
      case ProcessState.done:
        return const SizedBox(
          width: 25.0,
          height: 25.0,
          child: Icon(
            Icons.check,
            color: Colors.white,
          ),
        );

      case ProcessState.failed:
        return const SizedBox(
          // height: 25.0,
          child: Text(
            'Try agian',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        );

      case ProcessState.idle:
        return idleWidget;

      case ProcessState.loading:
        return const SizedBox(
          width: 20.0,
          height: 20.0,
          child: LoadingIcon(),
        );
    }
  }
}
