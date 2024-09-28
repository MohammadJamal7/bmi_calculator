import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  static String id = 'result';
  Result({super.key, this.isMale, this.age, this.res, this.height});

  bool? isMale;
  int? age;
  double? res;
  int? height;
  // final TextStyle mystyle = const TextStyle(
  //   fontSize: 24,
  //   letterSpacing: 2,
  //   color: Colors.purple,
  // );

  String get resultStatment {
    String resulttext = '';
    if (res! >= 40) {
      resulttext = 'Extremly Obese!';
    } else if (res! >= 35) {
      resulttext = 'Obese lv2';
    } else if (res! >= 30) {
      resulttext = 'Obese lv1';
    } else if (res! >= 25.0) {
      resulttext = 'OverWeighted';
    } else if (res! >= 18.5) {
      resulttext = 'Normal';
    } else {
      resulttext = 'UnderWeighted';
    }
    return resulttext;
  }

  List<List<String>> advicing = [
    // Underweight  [    "Talk to a doctor/dietitian",    "Eat nutrient-dense foods",    "Do strength training"  ],
    // Normal weight
    [
      "Maintain a balanced diet.     ",
      "Stay active.    ",
      "Limit processed/high-calorie foods.    "
    ],
    // Overweight
    [
      "Gradually reduce calories.   ",
      "Increase physical activity.    ",
      "Eat more fruits/veggies/lean proteins.    "
    ],
    // Obese level 1
    [
      "Make sustainable diet/exercise changes.   ",
      "Limit high-calorie/processed foods.  ",
      "Strength train."
    ],
    // Obese level 2
    [
      "Work with dietitian/healthcare provider.    ",
      "Exercise/make sustainable diet changes.   ",
      "Consider bariatric surgery. "
    ],
    // Extremely obese
    [
      "Seek medical advice/support.   ",
      "Consider bariatric surgery.    ",
      "Exercise/make sustainable diet changes.  "
    ]
  ];

  List get advicingStatment {
    List<String> advice;
    if (res! >= 40) {
      advice = advicing[4];
    } else if (res! >= 35) {
      advice = advicing[4];
    } else if (res! >= 30) {
      advice = advicing[3];
    } else if (res! >= 25.0) {
      advice = advicing[2];
    } else if (res! >= 18.5) {
      advice = advicing[1];
    } else {
      advice = advicing[0];
    }
    return advice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Results'),
        titleSpacing: 2,
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Text(
            resultStatment,
            style: const TextStyle(
              color: Color.fromARGB(255, 9, 35, 10),
              fontSize: 30,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            width: double.maxFinite,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 67, 89, 100),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                const Text(
                  'Here are some tips:                      ',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Text(
                  '${advicingStatment[0]}',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Text(
                  '${advicingStatment[1]}',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Text(
                  '${advicingStatment[2]}',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.12,
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
