import 'package:flutter/material.dart';
import 'package:pawnshop/screens/list_item.dart';
import 'package:pawnshop/screens/menu.dart';
import 'package:pawnshop/screens/pawnshop_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            // TODO: Bagian drawer header
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
              child: Column(
                children: [
                  Text(
                    'Pawnshop',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Text(
                    "Tambah barang secondhand disini!",
                    textAlign: TextAlign.center, // Center alignment
                    style: TextStyle(
                      fontSize: 15,      // Font size 15
                      color: Colors.white, // Text color white
                      fontWeight: FontWeight.normal, // Normal font weight
                    ),
                  ),
                ],
              ),
          ),
          // TODO: Bagian routing
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Item'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              /*
              TODO: Buatlah routing ke ShopFormPage di sini,
              setelah halaman ShopFormPage sudah dibuat.
              */
              Navigator.pushReplacement(
                context, 
                MaterialPageRoute(
                  builder: (context) => ShopFormPage(),
                ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.checklist),
            title: const Text('Lihat Item'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              /*
              TODO: Buatlah routing ke ShopFormPage di sini,
              setelah halaman ShopFormPage sudah dibuat.
              */
              Navigator.pushReplacement(
                context, 
                MaterialPageRoute(
                  builder: (context) => ListItemPage(),
                ));
            },
          ),
        ],
      ),
    );
  }
}