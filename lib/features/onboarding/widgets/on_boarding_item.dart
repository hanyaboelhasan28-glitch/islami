import 'package:flutter/material.dart';
import 'package:islami/core/constants/colors.dart';
import 'package:islami/features/onboarding/models/onboarding_model.dart';

class OnBoardingItem extends StatelessWidget {
  final OnBoardingModel model;

  const OnBoardingItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Image.asset(
            model.imagePath,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          model.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.primary,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (model.description != null) ...[
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              model.description!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
