import 'package:flutter/material.dart';
import '../../../../common/widgets/goodfood_button.dart';
import '../../../../models/model_onboarding.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    Key? key,
    required this.model,
  }) : super(key: key);

  final OnboardingModel model;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(20),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image(
            image: AssetImage(model.image),
            height: height * 0.6,
          ),
          Text(
            model.content,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: const [
              Expanded(
                child: OutlinedButton1(),
              ),
              SizedBox(
                width: 20,
              ),
              // Expanded(
              //   child: PrimaryButton(),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
