import 'package:islami/core/constants/assets.dart';
import 'package:islami/core/constants/strings.dart';

class OnBoardingData {
  String imagePath;
  String title;
  String? description;

  OnBoardingData({
    required this.imagePath,
    required this.title,
    this.description,
  });

  static List<OnBoardingData> onBoardingList = [
    OnBoardingData(
      imagePath: AppAssets.onBoarding1Image,
      title: Strings.onBoarding1Title,
    ),
    OnBoardingData(
      imagePath: AppAssets.onBoarding2Image,
      title: Strings.onBoarding2Title,
      description: Strings.onBoarding2Description,
    ),
    OnBoardingData(
      imagePath: AppAssets.onBoarding3Image,
      title: Strings.onBoarding3Title,
      description: Strings.onBoarding3Description,
    ),
    OnBoardingData(
      imagePath: AppAssets.onBoarding4Image,
      title: Strings.onBoarding4Title,
      description: Strings.onBoarding4Description,
    ),
    OnBoardingData(
      imagePath: AppAssets.onBoarding5Image,
      title: Strings.onBoarding5Title,
      description: Strings.onBoarding5Description,
    ),
  ];
}
