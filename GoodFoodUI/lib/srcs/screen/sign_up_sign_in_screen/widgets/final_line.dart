import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import '../../../core/color_scheme.dart';

class FinalLine extends StatelessWidget {
  final String firstText;
  final String secondText;
  final Widget linkedScreen;

  const FinalLine(this.firstText, this.secondText, this.linkedScreen,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12),
      child: RichText(
        text: TextSpan(
          text: firstText,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'OpenSans',
          ),
          children: <TextSpan>[
            TextSpan(
              text: secondText,
              style: const TextStyle(
                color: user1,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => linkedScreen),
                  );
                },
            )
          ],
        ),
      ),
    );
  }
}
