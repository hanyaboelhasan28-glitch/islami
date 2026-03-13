import 'package:islami/core/constants/assets.dart';
import 'package:islami/core/constants/strings.dart';

class OnBoardingModel {
  final String imagePath;
  final String title;
  final String? description;

  OnBoardingModel({
    required this.imagePath,
    required this.title,
    this.description,
  });

  static List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
      imagePath: AppAssets.onBoarding1Image,
      title: Strings.onBoarding1Title,
    ),
    OnBoardingModel(
      imagePath: AppAssets.onBoarding2Image,
      title: Strings.onBoarding2Title,
      description: Strings.onBoarding2Description,
    ),
    OnBoardingModel(
      imagePath: AppAssets.onBoarding3Image,
      title: Strings.onBoarding3Title,
      description: Strings.onBoarding3Description,
    ),
    OnBoardingModel(
      imagePath: AppAssets.onBoarding4Image,
      title: Strings.onBoarding4Title,
      description: Strings.onBoarding4Description,
    ),
    OnBoardingModel(
      imagePath: AppAssets.onBoarding5Image,
      title: Strings.onBoarding5Title,
      description: Strings.onBoarding5Description,
    ),
  ];
}
