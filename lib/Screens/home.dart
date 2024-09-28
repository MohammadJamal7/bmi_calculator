import 'package:bmi_app/Screens/result.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMale = true;
  int weight = 75;
  int age = 18;
  int height = 160;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
        titleSpacing: 2,
        elevation: 0.0,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              exp(context, 'male', 1),
              exp(context, 'female', 1),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blueGrey),
                      height: MediaQuery.of(context).size.height * 0.22,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              'Height',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 18, 18, 18),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${height.toInt()}',
                                style: const TextStyle(
                                    fontSize: 55,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'CM',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color.fromARGB(255, 17, 16, 16),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Slider(
                            inactiveColor:
                                const Color.fromARGB(137, 102, 90, 90),
                            min: 100,
                            max: 200,
                            value: height.toDouble(),
                            onChanged: (valu) {
                              setState(() {
                                height = valu.toInt();
                              });
                            },
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
          Row(
            children: [
              exp2(context, 'Weight', 1),
              exp2(context, 'Age', 1),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: (() {
                    double? result;

                    result = weight / (height / 100 * height / 100);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Result(
                              isMale: isMale,
                              age: age,
                              height: height,
                              res: result)),
                    );
                  }),
                  child: const Text('CLACULATE',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black))),
            ),
          ),
        ],
      )),
    );
  }

  Expanded exp(BuildContext context, String type, int flx) {
    return Expanded(
        flex: flx,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: InkWell(
            onTap: () {
              setState(() {
                isMale = type == 'male' ? true : false;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: (isMale && type == 'male') ||
                          (!isMale && type == 'female')
                      ? Colors.teal
                      : Colors.blueGrey),
              child: Column(
                children: [
                  Icon(
                    type == 'male' ? Icons.boy : Icons.girl,
                    size: 120,
                    shadows: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(5, 5),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Text(
                      type == 'male' ? 'MALE' : 'FEMALE',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Expanded exp2(BuildContext context, String type, int flx) {
    return Expanded(
        flex: flx,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.blueGrey),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  type,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 18, 18, 18),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  type == 'Weight' ? '$weight' : '$age',
                  style: const TextStyle(
                      fontSize: 60,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: FloatingActionButton(
                      heroTag: type == 'Weight' ? 'Weight++' : 'Weight--',
                      onPressed: () {
                        setState(() {
                          type == 'Weight' ? weight++ : age++;
                        });
                      },
                      child: const Icon(
                        Icons.add,
                        size: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: FloatingActionButton(
                      heroTag: type == 'Weight' ? 'Age++' : 'Age--',
                      onPressed: () {
                        setState(() {
                          type == 'Weight' ? weight-- : age--;
                        });
                      },
                      child: const Icon(
                        Icons.remove,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ));
  }
}
