import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('calc Age '),
          backgroundColor: Colors.green,
        ),
        body: const Age(),
      ),
    ),
  );
}

class Age extends StatefulWidget {
  const Age({Key? key}) : super(key: key);

  @override
  State<Age> createState() => _AgeState();
}

class _AgeState extends State<Age> {
  late int d, m, y;
  late String days1 = "", month1 = "", years1 = "";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * 0.07,
            width: size.width * 0.8,
            child: MaterialButton(
              onPressed: () async {
                setState(() {
                  rest();
                });
                await chowDatePicker(context);
              },
              color: Colors.green,
              child: const Text('clalc'),
            ),
          ),
          Text(
            "$years1 $month1 $days1 ",
            style: const TextStyle(fontSize: 25),
          ),
        ],
      ),
    );
  }

  Future chowDatePicker(BuildContext context) async {
    DateTime? dateTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    if (dateTime != null) {
      setState(() {
        d = int.parse(
          DateFormat("dd").format(
            dateTime,
          ),
        );
        m = int.parse(
          DateFormat("MM").format(
            dateTime,
          ),
        );
        y = int.parse(
          DateFormat("yy").format(
            dateTime,
          ),
        );
        int d1 = int.parse(DateFormat("dd").format(DateTime.now()));
        int m1 = int.parse(DateFormat("MM").format(DateTime.now()));
        int y1 = int.parse(DateFormat("yy").format(DateTime.now()));
        int daysInMonth = findDay(m1, y1);
        if (d1 - d >= 0) {
          days1 = "${d1 - d}days";
        } else {
          days1 = '${(d1 + daysInMonth) - d}days';
          m1--;
        }
        if (m1 - m >= 0) {
          month1 = "${m1 - m} months  ";
        } else {
          month1 = "${(m1 + 12) - m} months   ";
          y1--;
        }
        years1 = "${y1 - y} years";
      });
    }
  }

  findDay(int m2, int y2) {
    int day2;
    if (m2 == 1 ||
        m2 == 3 ||
        m2 == 5 ||
        m2 == 7 ||
        m2 == 8 ||
        m2 == 10 ||
        m2 == 12) {
      day2 = 31;
    } else if (m2 == 4 || m2 == 6 || m2 == 9 || m2 == 11) {
      day2 = 30;
    } else {
      if (y2 % 4 == 0) {
        //February month It comes every four years
        day2 = 29;
      } else {
        day2 = 28;
      }
    }
    return day2;
  }

  void rest() {
    years1 = " no shoes date Time  🤷‍ ️";
    month1 = "";
    days1 = "";
  }
}
