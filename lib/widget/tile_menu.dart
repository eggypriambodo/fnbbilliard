import 'package:flutter/material.dart';
import 'package:fnb_billiard/model/fake_db.dart';
import 'package:fnb_billiard/widget/styles.dart';

class MenuCard extends StatelessWidget {
  final Map<String, dynamic> item; // Item data

  const MenuCard({Key? key, required this.item}) : super(key: key);

  void _showQuantityDialog(BuildContext context) {
    int quantity = 1; // Default quantity
    TextEditingController descriptionController = TextEditingController(); // Controller for description

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              backgroundColor: Colors.teal,
              title: Text('Select Quantity and Description for ${item['item']}',
                style: const TextStyle(color: Colors.white),),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Price per item: Rp ${item['price']}',
                      style: const TextStyle(color: Colors.white)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove,color: Colors.white,),
                        onPressed: () {
                          if (quantity > 1) {
                            setState(() {
                              quantity--;
                            });
                          }
                        },
                      ),
                      Text('$quantity',
                          style: const TextStyle(color: Colors.white)),
                      IconButton(
                        icon: const Icon(Icons.add,color: Colors.white,),
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                  TextField(
                    controller: descriptionController,
                    
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintStyle: const TextStyle(color: Colors.white),
                      labelStyle: const TextStyle(color: Colors.white),
                      labelText: 'Keterangan',
                      hintText: 'Keterangan Opsional',
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel',
                      style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () {
                    for (int i = 0; i < quantity; i++) {
                      SelectedItems.addItem({
                        ...item,
                        'description': descriptionController.text,
                        'quantity': quantity,
                      });
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${item['item']} x$quantity added to order')),
                    );
                    Navigator.of(context).pop();
                  },
                  child: const Text('Add to Order',
                      style: TextStyle(color: Colors.teal)),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
        )
      ),
        onPressed: () => _showQuantityDialog(context),
      child: Container(
        padding: const EdgeInsets.only(top:5),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(item['image'],
                    fit: BoxFit.fill,),
                )),
            Container(
              alignment: Alignment.center,
              child: Text(item['item'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12,color: Colors.black),),
            ),

          ],
        ),
      ),
    );
  }
}
