import 'package:flutter/material.dart';
import 'package:fnb_billiard/model/fake_db.dart';
import 'package:fnb_billiard/views/core_menus/tab_order/pembayaran.dart';
import 'package:fnb_billiard/widget/card_detail_pembayaran.dart';
import 'package:fnb_billiard/widget/card_detail_pesanan.dart';
import 'package:fnb_billiard/widget/styles.dart';
import 'package:fnb_billiard/widget/tile_menu.dart';

class OrderMain extends StatefulWidget {
  const OrderMain({Key? key}) : super(key: key);

  @override
  State<OrderMain> createState() => _OrderMainState();
}


class _OrderMainState extends State<OrderMain> {
  String _searchMenu = '';
  String _selectedCategories = 'semua';

  @override
  Widget build(BuildContext context) {
    final menuItems = FakeDatabase.getMenuItems();

    final filteredItems = menuItems.where((item) {
      final itemName = item['item'] as String;
      final itemCategory = item['category'] as String;

      final matchesItem =
      itemName.toLowerCase().contains(_searchMenu.toLowerCase());
      final matchesCategory =
          _selectedCategories == 'semua' || itemCategory == _selectedCategories;

      return matchesItem && matchesCategory;
    }).toList();

    buttonStyle(String category) => ElevatedButton.styleFrom(
      minimumSize: const Size(70, 40),
      foregroundColor: Colors.white,
      backgroundColor: _selectedCategories == category
          ? Colors.teal
          : Colors.teal[300],
    );

    void handleOrder() {
      final selectedItems = SelectedItems.getItems();

      if (selectedItems.isEmpty) {
        // Show an error dialog if no items are selected
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Pesanan masih kosong. Tambahkan item ke pesanan terlebih dahulu.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        // Navigate to CardDetailPembayaran if there are items in the order
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Pembayaran()),
        );
      }
    }

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedCategories = 'semua';
                    });
                  },
                  style: buttonStyle('semua'),
                  child: const Text(
                    'ALL',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedCategories = 'makanan';
                    });
                  },
                  style: buttonStyle('makanan'),
                  child: const Text('FOODS',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                const SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedCategories = 'minuman';
                    });
                  },
                  style: buttonStyle('minuman'),
                  child: const Text('DRINKS',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                const Spacer(),
                Expanded(
                  flex: 3,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Menu ...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.teal),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      suffixIcon: Icon(Icons.search, color: Colors.teal[300]),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _searchMenu = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: GridView.builder(
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                      itemCount: filteredItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        final menuItem = filteredItems[index];
                        return GridTile(
                          child: Container(
                            margin: const EdgeInsets.all(12.0),
                            decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                color: Colors.teal[100]),
                            child: MenuCard(
                              item: menuItem,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: const EdgeInsets.only(right: 15, top: 10),
                    alignment: Alignment.topCenter,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 15),
                          const CardDetail(),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              onPressed: handleOrder,
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
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
