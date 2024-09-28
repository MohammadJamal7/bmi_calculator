import 'package:flutter/material.dart';

class MyExpanded extends StatelessWidget {
  const MyExpanded({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Color.fromARGB(255, 172, 235, 228)),
      child: Column(
        children: [
          const Icon(
            Icons.male,
            size: 100,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'MALE',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    ));
  }
}
