import 'package:flutter/material.dart';

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
      style:
          ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white)),
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
    border: Border.all(width: 0.5, color: Colors.white),
    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
    color: Colors.black,
  );
}

BoxDecoration petrolBoxDecoration() {
  return BoxDecoration(
      border: Border.all(width: 0.5, color: Colors.white),
      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      gradient: LinearGradient(colors: [Colors.green, Colors.black]));
}

BoxDecoration lpgBoxDecoration() {
  return BoxDecoration(
    border: Border.all(width: 0.5, color: Colors.white),
    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
    color: Colors.black45,
  );
}
