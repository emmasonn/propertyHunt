import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:properties/core/helpers/phone_number_formatter.dart';
import 'package:properties/core/route/custom_route.dart';
import 'package:properties/core/utils/country.dart';
import 'package:properties/core/widgets/app_pick_country.dart';

class AppPhoneTextField extends StatefulWidget {
  const AppPhoneTextField({
    Key? key,
    required this.hintText,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.textCapitalization = TextCapitalization.none,
    this.validator,
    this.readOnly,
    this.helperText,
    this.initialValue,
    this.maxLine,
    required this.onCodeSelected,
    required this.onChanged,
  }) : super(key: key);
  final TextEditingController? controller;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextCapitalization? textCapitalization;
  final String? Function(String?)? validator;
  final bool? readOnly;
  final String? helperText;
  final String? initialValue;
  final Function(String?) onChanged;
  final Function(String?) onCodeSelected;
  final int? maxLine;

  @override
  State<AppPhoneTextField> createState() => _AppPhoneTextFieldState();
}

class _AppPhoneTextFieldState extends State<AppPhoneTextField> {
  String? currentValue;
  Country country = const Country(
    asset: "assets/flags/ng.png",
    dialingCode: "234",
    isoCode: "NG",
    name: "Nigeria",
  );

  @override
  void initState() {
    super.initState();
    currentValue = widget.initialValue;
    widget.onCodeSelected(country.dialingCode);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: TextFormField(
        style: const TextStyle(fontSize: 16, height: 1.4),
        enabled: true,
        keyboardType: TextInputType.number,
        autocorrect: false,
        initialValue: currentValue,
        maxLines: widget.maxLine,
        inputFormatters: [
          FilteringTextInputFormatter.deny(RegExp(r'^0')),
          FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          PhoneNumberFormatter(),
          LengthLimitingTextInputFormatter(15)
        ],
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          prefixIcon: GestureDetector(
            onTap: () {
              //Navigate to login
              Navigator.push(
                  context,
                  CustomRoute(
                    child: AppPickCountry(
                      onSelected: (value) {
                        setState(() {
                          country = value;
                        });
                        widget.onCodeSelected(country.dialingCode);
                      },
                    ),
                    animationStyle: PageAnimationStyle.fade,
                  ));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    country.asset,
                    height: 40,
                    width: 35,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    '+${country.dialingCode}',
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  const SizedBox(
                      height: 30,
                      width: 0,
                      child: VerticalDivider(
                        color: Colors.black26,
                      ))
                ],
              ),
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: theme.primaryColorLight,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: theme.primaryColorLight,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: theme.primaryColorLight,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          helperText: widget.helperText,
          hintText: widget.hintText,
          hintStyle: theme.textTheme.labelLarge,
          // prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
