import 'package:flutter/material.dart';
import 'package:properties/resource/app_colors.dart';
import 'package:properties/resource/app_dimen.dart';

class AuthDialogWidget extends StatelessWidget {
  const AuthDialogWidget({
    Key? key,
    required this.message,
    this.actionTitle,
    this.close,
    this.otherAction,
  }) : super(key: key);
  final String message;
  final String? actionTitle;
  final Function()? close;
  final Function()? otherAction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.center,
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: 120,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimen.dialogCornerRadius),
        ),
        child: Material(
          color: theme.dialogBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                child: Text(
                  message,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (close != null) ...[
                    TextButton(
                      onPressed: close,
                      child: Text(
                        'Close',
                        style: theme.textTheme.titleSmall
                            ?.copyWith(color: AppColor.kAppColor500),
                      ),
                    ),
                   const SizedBox(width: 20,)
                  ],
                  if (actionTitle != null) ...[
                    TextButton(
                      onPressed: () {
                        otherAction?.call();
                      },
                      child: Text(
                        actionTitle!,
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                    //horizontal spacer
                    const SizedBox(
                      width: 50.0,
                    )
                  ]
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

void showAppDialog(
  BuildContext context, {
  required Widget child,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return child;
    },
  );
}
