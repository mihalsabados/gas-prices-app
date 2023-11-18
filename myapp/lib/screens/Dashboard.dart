import 'dart:async';

import 'package:flutter/material.dart';

import 'CurrencyChoice.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var counter = 0;

  List<Color> get getColorsList => [
        Color.fromARGB(255, 27, 67, 73),
        Color.fromARGB(255, 36, 36, 36),
        Color.fromARGB(255, 32, 82, 62),
        Color.fromARGB(255, 35, 40, 70),
      ]..shuffle();

  List<Alignment> get getAlignments => [
        Alignment.bottomLeft,
        Alignment.bottomRight,
        Alignment.topRight,
        Alignment.topLeft,
      ];

  _startBgColorAnimationTimer() {
    ///Animating for the first time.
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      counter++;
      setState(() {});
    });

    const interval = Duration(seconds: 5);
    Timer.periodic(
      interval,
      (Timer timer) {
        counter++;
        setState(() {});
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _startBgColorAnimationTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Gas Prices"),
      ),
      body: Center(
        child: AnimatedContainer(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: getAlignments[counter % getAlignments.length],
              end: getAlignments[(counter + 2) % getAlignments.length],
              colors: getColorsList,
              tileMode: TileMode.clamp,
            ),
          ),
          duration: const Duration(seconds: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              Text('Currency', style: TextStyle(color: Colors.white)),
              SingleChoice(),
              SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 400,
                height: 100.0,
                decoration: dieselBoxDecoration(),
                child: const Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(width: 30),
                    Text("Diesel",
                        style: TextStyle(fontSize: 30, color: Colors.white)),
                    SizedBox(width: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("204",
                            style: TextStyle(
                                fontSize: 42,
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                        SizedBox(width: 5),
                        Text(
                          "rsd",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(width: 40),
                    Icon(
                      Icons.arrow_downward,
                      color: Colors.green,
                      size: 30,
                    ),
                    Text("-2",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.green))
                  ],
                )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 400,
                height: 100.0,
                decoration: petrolBoxDecoration(),
                child: const Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(width: 30),
                    Text("Petrol",
                        style: TextStyle(fontSize: 30, color: Colors.white)),
                    SizedBox(width: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("180",
                            style: TextStyle(
                                fontSize: 42,
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                        SizedBox(width: 5),
                        Text("rsd",
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                      ],
                    ),
                    SizedBox(width: 40),
                    Icon(
                      Icons.arrow_back,
                      color: Colors.grey,
                      size: 30,
                    )
                  ],
                )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 400,
                height: 100.0,
                decoration: lpgBoxDecoration(),
                child: const Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(width: 30),
                    Text("LPG",
                        style: TextStyle(color: Colors.white, fontSize: 30)),
                    SizedBox(width: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("93.4",
                            style: TextStyle(
                                fontSize: 42,
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                        SizedBox(width: 5),
                        Text("rsd",
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                      ],
                    ),
                    SizedBox(width: 40),
                    Icon(
                      Icons.arrow_back,
                      color: Colors.grey,
                      size: 30,
                    )
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
