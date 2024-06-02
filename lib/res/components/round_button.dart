import 'package:flutter/material.dart';
import 'package:mvvm/res/colors.dart';

class RoundButton extends StatelessWidget {
  final String value;
  final bool loading;
  final VoidCallback onPress;
  const RoundButton({
    super.key,
    required this.value,
    this.loading = false,
    required this.onPress,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: const BoxDecoration(
            color: ColorsApp.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Center(
            child: loading
                ? const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 0,vertical: 2),
                  child:  CircularProgressIndicator(
                    strokeCap: StrokeCap.round,
                      color: ColorsApp.blackColor,
                    ),
                )
                : Text(
                    value,
                    style: const TextStyle(color: ColorsApp.blackColor),
                  )),
      ),
    );
  }
}
