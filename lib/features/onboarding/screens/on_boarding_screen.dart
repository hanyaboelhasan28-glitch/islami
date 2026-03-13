import 'package:flutter/material.dart';
import 'package:islami/core/cache/cache_helper.dart';
import 'package:islami/core/constants/colors.dart';
import 'package:islami/core/constants/strings.dart';
import 'package:islami/features/onboarding/models/onboarding_model.dart';
import 'package:islami/features/onboarding/widgets/on_boarding_item.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = 'on_boarding';

  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemCount: OnBoardingModel.onBoardingList.length,
                  itemBuilder: (context, index) {
                    return OnBoardingItem(
                      model: OnBoardingModel.onBoardingList[index],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: _currentIndex != 0,
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      child: TextButton(
                        onPressed: () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: const Text(
                          Strings.back,
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: List.generate(
                        OnBoardingModel.onBoardingList.length,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: _currentIndex == index ? 18 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _currentIndex == index
                                ? AppColors.primary
                                : AppColors.grey,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (_currentIndex ==
                            OnBoardingModel.onBoardingList.length - 1) {
                          CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
                            if (value) {
                              Navigator.pushReplacementNamed(context, 'home');
                            }
                          });
                        } else {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Text(
                        _currentIndex ==
                                OnBoardingModel.onBoardingList.length - 1
                            ? Strings.finish
                            : Strings.next,
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
