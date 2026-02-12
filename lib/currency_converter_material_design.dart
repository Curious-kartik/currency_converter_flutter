import 'package:flutter/material.dart';

class CurrencyConverterMaterialDesign extends StatefulWidget {
  const CurrencyConverterMaterialDesign({super.key});

  @override
  State<CurrencyConverterMaterialDesign> createState() =>
      _CurrencyConverterMaterialDesign();
}

class _CurrencyConverterMaterialDesign
    extends State<CurrencyConverterMaterialDesign> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    result = double.parse(textEditingController.text) * 91;
    setState(() {});
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(width: 2, style: BorderStyle.solid),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(190, 255, 246, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(100, 50, 20, 1),
        title: const Text(
          'Currency Converter',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(
                'INR ${result != 0 ? result.toStringAsFixed(3) : result.toStringAsFixed(0)}',

                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 60, 151),
                  fontSize: 60,
                  height: 1.05,
                  fontWeight: FontWeight.bold,
                ),
              ),

              TextField(
                controller: textEditingController,
                style: const TextStyle(color: Colors.black),

                decoration: InputDecoration(
                  hintText: ('Please enter the amount'),
                  hintStyle: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    // fontStyle: FontFeature.alternative(aalt 0),
                  ),
                  prefixIcon: Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Color.fromARGB(255, 0, 60, 151),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: border,
                  focusedBorder: border,
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: convert,

                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),

                child: const Text('Convert'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
