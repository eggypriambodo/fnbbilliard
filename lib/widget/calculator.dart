import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalculatorBayar extends StatefulWidget {
  @override
  _CalculatorBayarState createState() => _CalculatorBayarState();
}

class _CalculatorBayarState extends State<CalculatorBayar> {
  TextEditingController _controller = TextEditingController();
  String _input = '';

  void _appendNumber(String number) {
    setState(() {
      _input += number;
      _updateController();
    });
  }

  void _appendComma() {
    if (!_input.contains(',')) {
      setState(() {
        _input += ',';
        _updateController();
      });
    }
  }

  void _clear() {
    setState(() {
      _input = '';
      _updateController();
    });
  }

  void _updateController() {
    _controller.text = _formatCurrency(_input);
    _controller.selection = TextSelection.fromPosition(
      TextPosition(offset: _controller.text.length),
    );
  }

  String _formatCurrency(String input) {
    if (input.isEmpty) return '';
    final number = double.tryParse(input.replaceAll(',', '')) ?? 0;
    final formatter = NumberFormat.simpleCurrency(locale: 'id_ID', name: 'IDR');
    return formatter.format(number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Masukkan angka',
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(height: 20),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.4),
              ),
              itemCount: 12,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (index == 9) {
                  return ElevatedButton(
                    onPressed: _clear,
                    child: Text('Clear'),
                  );
                } else if (index == 10) {
                  return ElevatedButton(
                    onPressed: _appendComma,
                    child: Text(','),
                  );
                } else {
                  String number = index < 9 ? (index + 1).toString() : '0';
                  return ElevatedButton(
                      onPressed: () => _appendNumber(number),
                child: Text(number));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}