import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gas Prices',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Gas Prices'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Spacer(),
            SizedBox(height: 20),
            Text('Currency'),
            SingleChoice(),
            SizedBox(height: 20),
            // Spacer(),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 400,
              height: 100.0,
              decoration: dieselBoxDecoration(),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Diesel", style: TextStyle(color: Colors.white)),
                  Row(
                    children: [
                      Text("204",
                          style: TextStyle(fontSize: 30, color: Colors.white)),
                      SizedBox(width: 2),
                      Text(
                        "rsd",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  )
                ],
              )),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 400,
              height: 100.0,
              decoration: petrolBoxDecoration(),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Petrol"),
                  Row(
                    children: [
                      Text("180", style: TextStyle(fontSize: 30)),
                      SizedBox(width: 2),
                      Text("rsd", style: TextStyle(fontSize: 14)),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  )
                ],
              )),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 400,
              height: 100.0,
              decoration: lpgBoxDecoration(),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("LPG"),
                  Row(
                    children: [
                      Text("93.4", style: TextStyle(fontSize: 30)),
                      SizedBox(width: 2),
                      Text("rsd", style: TextStyle(fontSize: 14)),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  )
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}

enum Currency { rsd, eur, usd }

class SingleChoice extends StatefulWidget {
  const SingleChoice({super.key});

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  Currency currencyView = Currency.rsd;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Currency>(
      segments: const <ButtonSegment<Currency>>[
        ButtonSegment<Currency>(
            value: Currency.rsd, label: Text('RSD'), icon: Icon(Icons.money)),
        ButtonSegment<Currency>(
            value: Currency.eur, label: Text('EUR'), icon: Icon(Icons.euro)),
        ButtonSegment<Currency>(
            value: Currency.usd,
            label: Text('USD'),
            icon: Icon(Icons.attach_money)),
      ],
      selected: <Currency>{currencyView},
      onSelectionChanged: (Set<Currency> newSelection) {
        setState(() {
          currencyView = newSelection.first;
        });
      },
    );
  }
}

BoxDecoration dieselBoxDecoration() {
  return BoxDecoration(
    border: Border.all(width: 2.0, color: Colors.white),
    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    color: Colors.black,
  );
}

BoxDecoration petrolBoxDecoration() {
  return BoxDecoration(
    border: Border.all(width: 2.0),
    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    color: Colors.green,
  );
}

BoxDecoration lpgBoxDecoration() {
  return BoxDecoration(
    border: Border.all(width: 2.0),
    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    // color: Colors.red,
  );
}
