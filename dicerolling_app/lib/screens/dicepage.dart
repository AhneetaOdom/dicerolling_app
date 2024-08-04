import 'package:dicerolling_app/utils/constats/images.dart';
import 'package:flutter/material.dart';
import 'package:dicerolling_app/utils/constats/sizes.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

class DicePage extends StatelessWidget {
  const DicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dice App',
          style: TextStyle(fontSize: AppSizes.fontSizeBg),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Image.asset(
                AppImages.diceone,
                height: 150,
                width: 150,
              ),
              const SizedBox(
                height: 100,
              ),
              GestureDetector(
                onTap: () {
                
                    },
                  
               
                child: Container(
                  height: 48,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8)),
                  alignment: Alignment.center,
                  child: const Text(
                    'Roll Dice',
                    style: TextStyle(
                        fontSize: AppSizes.fontSizeMd,
                        fontWeight: AppSizes.fontWeightBold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
