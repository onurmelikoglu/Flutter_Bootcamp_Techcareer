import 'package:flutter/material.dart';
import 'package:groceryshopping/ui/widgets/smallText.dart';
import 'package:groceryshopping/utils/colors.dart';

class customButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  customButton({
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    var screenWidth = screenInfo.size.width;
    return SizedBox(
        width: screenWidth,
        height: 60,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)
                )
            ),
            onPressed: onPressed,
            child: smallText(text: text, fontsize: 18, color: Colors.white, fontweight: FontWeight.w600,)
        )
    );
  }
}
