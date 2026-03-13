import 'package:flutter/material.dart';
import 'package:islami/core/constants/assets.dart';
import 'package:islami/core/constants/colors.dart';
import 'package:islami/features/radio/models/radio_model.dart';

class RadioItemWidget extends StatelessWidget {
  final RadioModel radio;

  const RadioItemWidget({super.key, required this.radio});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 133,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Pattern (Swapped logic)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
              child: Image.asset(
                // العكس: الشغالة نقش مساجد، والمش شغالة موجات صوت
                radio.isPlaying ? AppAssets.radioBg : AppAssets.radioPlayerBg,
                fit: radio.isPlaying ? BoxFit.cover : BoxFit.fill,
                height: radio.isPlaying ? 100 : 60,
                opacity: radio.isPlaying 
                    ? const AlwaysStoppedAnimation(0.6) 
                    : const AlwaysStoppedAnimation(1.0),
              ),
            ),
          ),
          
          // Main Content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                radio.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      radio.isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 44,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 4),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      radio.isMuted ? Icons.volume_off : Icons.volume_up,
                      size: 32,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
