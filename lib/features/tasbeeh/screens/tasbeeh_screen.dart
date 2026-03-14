import 'package:flutter/material.dart';
import 'package:islami/core/constants/assets.dart';
import 'package:islami/core/constants/strings.dart';

class TasbeehScreen extends StatefulWidget {
  static const String routeName = 'tasbeeh';

  const TasbeehScreen({super.key});

  @override
  State<TasbeehScreen> createState() => _TasbeehScreenState();
}

class _TasbeehScreenState extends State<TasbeehScreen> {
  int _counter = 0;
  double _turns = 0.0;
  final List<String> _azkar = [
    'سُبْحَانَ اللهِ',
    'الْحَمْدُ لِلَّهِ',
    'اللهُ أَكْبَرُ',
    'لا إلَهَ إلاَّ اللَّهُ'
  ];
  int _azkarIndex = 0;

  void _onSebhaClick() {
    setState(() {
      _counter++;
      _turns += 1 / 33;

      if (_counter == 33) {
        _counter = 0;
        _azkarIndex = (_azkarIndex + 1) % _azkar.length;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.background),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.logo, height: 150),
              const Text(
                Strings.zekrHeader,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Center(
                child: GestureDetector(
                  onTap: _onSebhaClick,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Image.asset(
                            AppAssets.sebhaHead,
                            height: 100,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 75),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                AnimatedRotation(
                                  turns: _turns,
                                  duration: const Duration(milliseconds: 300),
                                  child: Image.asset(
                                    AppAssets.sebhaBody,
                                    height: 350,
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      _azkar[_azkarIndex],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      '$_counter',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
