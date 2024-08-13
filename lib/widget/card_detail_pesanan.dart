import 'package:flutter/material.dart';
import 'package:fnb_billiard/model/fake_db.dart';

class CardDetail extends StatelessWidget {
  const CardDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: ValueListenableBuilder<Map<String, Map<String, dynamic>>>(
            valueListenable: SelectedItems.items,
            builder: (context, selectedItems, child) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'Pesanan',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Divider(),
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
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                if (item['description'] != null && item['description']!.isNotEmpty)
                                  ConstrainedBox(
                                    constraints: BoxConstraints(maxWidth: 200), // Adjust the width as needed
                                    child: Text(
                                      item['description'],
                                      style: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 10,
                                      ),
                                      overflow: TextOverflow.clip,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                  ],

                ),
              );
            },
          ),
        ),
    );
  }
}
