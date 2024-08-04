import 'package:dicerolling_app/utils/constats/sizes.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int diceNumber = 1;
  List selectedNum = [];
  String message = "";
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
                'assets/images/$diceNumber.png',
                height: 150,
                width: 150,
              ),
              const SizedBox(
                height: 100,
              ),
              GestureDetector(
                onTap: () {
                  diceNumber = Random().nextInt(6) + 1;

                  if (diceNumber == 6) {
                    message = 'A six is thrown.';
                  } else if (diceNumber % 2 == 0) {
                    message = 'An even number is thrown.';
                  } else {
                    message = 'An odd number is thrown.';
                  }

                  selectedNum.add(diceNumber);
//  print(selectedNum);
                  showToast(message);
                  if (selectedNum.length == 6) {
                    String result = '';
                    // showToast("You have played");
                    for (final num in selectedNum) {
                      result = "$result$num, ";
                    }
                    // showToast(result);
                    Future.delayed(const Duration(milliseconds: 200), () {});
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                      'You have rolled the \n $result',
                      textAlign: TextAlign.center,
                    )));

                    selectedNum = [];
                  }
                  setState(() {});
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

void rollDice() {}

void showToast(message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.black,
    textColor: Colors.white,
  );
}
