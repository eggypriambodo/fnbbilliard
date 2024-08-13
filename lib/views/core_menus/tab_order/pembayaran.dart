import 'package:flutter/material.dart';
import 'package:fnb_billiard/model/fake_db.dart';
import 'package:fnb_billiard/widget/calculator.dart';
import 'package:fnb_billiard/widget/card_detail_pembayaran.dart';
import 'package:fnb_billiard/widget/styles.dart';

class Pembayaran extends StatefulWidget {
  const Pembayaran({Key? key}) : super(key: key);

  @override
  State<Pembayaran> createState() => _PembayaranState();
}

enum MetodeBayar { cash, qris, transfer, debit }

class _PembayaranState extends State<Pembayaran> {
  MetodeBayar? _method = MetodeBayar.cash;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: Row(
        children: [
          // Bagian 7/10 layar: Kalkulator
          Expanded(
            flex: 6,
            child: CalculatorBayar()
          ),
          // Bagian 3/10 layar: Detail Pembayaran
          Expanded(
            flex: 4,
            child: Container(
              margin: const EdgeInsets.only(right: 12,),
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    const CardDetailPembayaran(),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: [
                                  Radio<MetodeBayar>(
                                    fillColor: WidgetStateProperty.resolveWith<Color>(
                                            (Set<WidgetState> states) {
                                          if (states.contains(WidgetState.disabled)) {
                                            return Colors.teal.withOpacity(.32);
                                          }
                                          return Colors.teal;
                                        }),
                                    value: MetodeBayar.cash,
                                    groupValue: _method,
                                    onChanged: (MetodeBayar? value) {
                                      setState(() {
                                        _method = value;
                                      });
                                    },
                                  ),
                                  const Text('Cash')
                                ],
                              ),
                              Row(
                                children: [
                                  Radio<MetodeBayar>(
                                    fillColor: WidgetStateProperty.resolveWith<Color>(
                                            (Set<WidgetState> states) {
                                          if (states.contains(WidgetState.disabled)) {
                                            return Colors.teal.withOpacity(.32);
                                          }
                                          return Colors.teal;
                                        }),
                                    value: MetodeBayar.transfer,
                                    groupValue: _method,
                                    onChanged: (MetodeBayar? value) {
                                      setState(() {
                                        _method = value;
                                      });
                                    },
                                  ),
                                  const Text('Transfer')
                                ],
                              ),
                              Row(
                                children: [
                                  Radio<MetodeBayar>(
                                    fillColor: WidgetStateProperty.resolveWith<Color>(
                                            (Set<WidgetState> states) {
                                          if (states.contains(WidgetState.disabled)) {
                                            return Colors.teal.withOpacity(.32);
                                          }
                                          return Colors.teal;
                                        }),
                                    value: MetodeBayar.debit,
                                    groupValue: _method,
                                    onChanged: (MetodeBayar? value) {
                                      setState(() {
                                        _method = value;
                                      });
                                    },
                                  ),
                                  const Text('Debit')
                                ],
                              ),
                              Row(
                                children: [
                                  Radio<MetodeBayar>(
                                    fillColor: WidgetStateProperty.resolveWith<Color>(
                                            (Set<WidgetState> states) {
                                          if (states.contains(WidgetState.disabled)) {
                                            return Colors.teal.withOpacity(.32);
                                          }
                                          return Colors.teal;
                                        }),
                                    value: MetodeBayar.qris,
                                    groupValue: _method,
                                    onChanged: (MetodeBayar? value) {
                                      setState(() {
                                        _method = value;
                                      });
                                    },
                                  ),
                                  const Text('QRIS')
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Nama Tamu',
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 6,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Input Nama Tamu ...',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.teal),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Bayar',
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 6,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Input Nominal',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.teal),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              onPressed: () {
                                // Add functionality here
                              },
                              style: elevatedButtonStyles,
                              child: Text(
                                'PESAN SEKARANG',
                                style: textButtonStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
