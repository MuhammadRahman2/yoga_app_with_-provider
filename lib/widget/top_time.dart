import 'package:flutter/material.dart';

class TopTime extends StatelessWidget {
  const TopTime({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(50, 120, 50, 40),
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(15),
              bottomLeft: Radius.circular(15))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: const [
              Text(
                "1",
                style: TextStyle(color: Colors.white, fontSize: 23),
              ),
              Text("Streak",
                  style: TextStyle(color: Colors.white, fontSize: 13))
            ],
          ),
          Column(
            children: const [
              Text(
                "120",
                style: TextStyle(color: Colors.white, fontSize: 23),
              ),
              Text("kCal", style: TextStyle(color: Colors.white, fontSize: 13))
            ],
          ),
          Column(
            children: const [
              Text(
                "26",
                style: TextStyle(color: Colors.white, fontSize: 23),
              ),
              Text("Minutes",
                  style: TextStyle(color: Colors.white, fontSize: 13))
            ],
          )
        ],
      ),
    );
  }
}
