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
        const Color.fromARGB(255, 27, 67, 73),
        const Color.fromARGB(255, 36, 36, 36),
        const Color.fromARGB(255, 32, 82, 62),
        const Color.fromARGB(255, 35, 40, 70),
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
          title: const Text("Gas Prices"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: AnimatedContainer(
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
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
                  const SizedBox(height: 20),
                  const Text('Currency', style: TextStyle(color: Colors.white)),
                  const SingleChoice(),
                  const SizedBox(height: 20),
                  const Text('Serbia',
                      style: TextStyle(color: Colors.white, fontSize: 32)),
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
                            style:
                                TextStyle(fontSize: 30, color: Colors.white)),
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
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
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
                            style:
                                TextStyle(fontSize: 30, color: Colors.white)),
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
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
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
                            style:
                                TextStyle(color: Colors.white, fontSize: 30)),
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
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
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
                  const SizedBox(height: 40),
                  const Text('Other Countries',
                      style: TextStyle(color: Colors.white, fontSize: 32)),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 800,
                    width: 400,
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      children: [
                        Container(
                          color: Colors.white,
                          child: Text("Germany"),
                        ),
                        Container(
                          color: Colors.white,
                          child: Text("Germany"),
                        ),
                        Container(
                          child: Text("Germany"),
                        ),
                        Container(
                          child: Text("Germany"),
                        ),
                        Container(
                          child: Text("Germany"),
                        ),
                        Container(
                          child: Text("Germany"),
                        ),
                        Container(
                          child: Text("Germany"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
