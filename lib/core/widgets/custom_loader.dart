import 'package:flutter/material.dart';
import 'loading_icon.dart';

class CustomLoader extends StatelessWidget {
  final double? width;
  final double? height;
  final String message;
  final Axis? orientation;
  final Color? color;
  final Color? background;

  const CustomLoader({
    Key? key,
    this.width,
    this.height,
    required this.message,
    this.orientation,
    this.color,
    this.background,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          alignment: Alignment.center,
          width: width ?? 200.0,
          height: height ?? 60.0,
          margin: const EdgeInsets.all(25.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: background ?? Colors.white,
          ),
          child: orientation == null || orientation == Axis.horizontal
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 25.0,
                        height: 25.0,
                        child: LoadingIcon(
                          color: color ?? Theme.of(context).primaryColor,
                        )),
                    const SizedBox(width: 10.0),
                    Text(
                      message,
                      style: TextStyle(
                        color: Colors.grey.shade800,
                      ),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 25.0,
                        height: 25.0,
                        child: LoadingIcon(
                          color: color ?? Theme.of(context).primaryColor,
                        )),
                    const SizedBox(height: 10.0),
                    Text(
                      message,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
