import 'package:flutter/material.dart';
import 'package:fnb_billiard/model/fake_db.dart';

class CardDetailPembayaran extends StatelessWidget {
  const CardDetailPembayaran({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ValueListenableBuilder<Map<String, Map<String, dynamic>>>(
          valueListenable: SelectedItems.items,
          builder: (context, selectedItems, child) {
            final itemCount = selectedItems.values.fold<int>(
              0,
                  (sum, item) => sum + (item['quantity'] as int),
            );
            final subtotal = selectedItems.values.fold<int>(
              0,
                  (sum, item) => sum + (item['price'] as int) * (item['quantity'] as int),
            );
            final tax = subtotal * 0.10; // 10% tax
            final total = subtotal + tax;

            // Notify total value
            TotalNotifier().value = total;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Detail Order',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Divider(),
                  const Text(
                    'Pesanan',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  ...selectedItems.values.map((item) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${item['item']} x${item['quantity']}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              if (item['description'] != null && item['description']!.isNotEmpty)
                                ConstrainedBox(
                                  constraints: BoxConstraints(maxWidth: 200),
                                  child: Text(
                                    item['description'],
                                    style: const TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 14,
                                    ),
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Rp ${item['price'] * item['quantity']}',
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Jumlah Item',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text('$itemCount'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Subtotal',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text('Rp $subtotal'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'PPn 10%',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text('Rp ${tax.toStringAsFixed(0)}'),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Rp ${total.toStringAsFixed(0)}'),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class TotalNotifier extends ValueNotifier<double> {
  TotalNotifier() : super(0.0);
}
