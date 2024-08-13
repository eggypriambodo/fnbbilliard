import 'package:flutter/material.dart';
import 'package:fnb_billiard/views/core_menus/tab_admin/admin_main.dart';
import 'package:fnb_billiard/views/core_menus/tab_history/history_main.dart';
import 'package:fnb_billiard/views/core_menus/tab_laporan/laporan_main.dart';
import 'package:fnb_billiard/views/core_menus/tab_order/order_main.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedItems = 0;
  bool isPressed = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedItems = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    OrderMain(),
    HistoryMain(),
    LaporanMain(),
    AdminMain(),
  ];

  Widget _drawer(){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[

          const DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.teal,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(''))),
            child: Text('',
              style: TextStyle(),),
          ),

          //LIST TILE ITEMS
          ListTile(
            selectedColor: Colors.teal,
            leading: const Icon(Icons.food_bank),
            title: const Text('Order Baru'),
            selected: _selectedItems == 0,
            onTap: ()=> {
              _onItemTapped(0),
              Navigator.of(context).pop()},
          ),
          ListTile(
            selectedColor: Colors.teal,
            leading: const Icon(Icons.history),
            title: const Text('Riwayat Order'),
            selected: _selectedItems == 1,
            onTap: ()=> {
              _onItemTapped(1),
              Navigator.of(context).pop()},
          ),
          ListTile(
            selectedColor: Colors.teal,
            leading: const Icon(Icons.border_color),
            title: const Text('Laporan'),
            selected: _selectedItems == 2,
            onTap: ()=> {
              _onItemTapped(2),
              Navigator.of(context).pop()},
          ),
          ListTile(
            selectedColor: Colors.teal,
            leading: const Icon(Icons.admin_panel_settings),
            selected: _selectedItems == 3,
            title: const Text('Admin'),
            onTap: ()=> {
              _onItemTapped(3),
              Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _drawer(),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        toolbarHeight:60,
          leading: Builder(
              builder: (context){
                return IconButton(onPressed: (){Scaffold.of(context).openDrawer();}, icon: const Icon(Icons.menu, color: Colors.white,));
              }),
          title: const Center(child: Text('XYZ CAFE', textAlign: TextAlign.center, style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25
          ),)),
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.logout, color: Colors.white,)),
      ],),
      body: Center(
        child: _widgetOptions[_selectedItems],
      ),
    );
  }

}
