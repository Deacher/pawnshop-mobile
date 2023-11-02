# Pawnshop

Pawnshop is a cutting-edge mobile app designed to streamline and enhance your pawnshop experience. Whether you're looking to pawn items or make a purchase, Pawnshop provides a convenient and secure platform for all your pawnshop needs.

- [Pawnshop](#pawnshop)
    - [Tugas 7](#tugas-7)

## Tugas 7

1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
    
    Stateless widget adalah widget yang tidak memiliki state atau bisa dikatakan statis, artinya widget ini tidak dapat diubah setelah diinisialisasi. Stateless widget hanya memiliki satu method yaitu build(). Stateless widget digunakan untuk membuat widget yang tidak membutuhkan perubahan data.

    Stateful widget adalah widget yang memiliki state atau bisa dikatakan dinamis, artinya widget ini dapat diubah setelah diinisialisasi. Stateful widget memiliki dua method yaitu createState() dan build(). Stateful widget digunakan untuk membuat widget yang membutuhkan perubahan data seperti response dari events yang di-trigger.

2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.

        Widget yang digunakan untuk menyelesaikan tugas ini adalah sebagai berikut:
        - `Scaffold`, digunakan untuk membuat layout dasar aplikasi.
        - `AppBar`, digunakan untuk mengelola navigasi dan tindakan.
        - `Column`, digunakan untuk menempatkan child dalam satu kolom.
        - `Style`, digunakan  untuk mendefinisikan gaya teks seperti warna, ukuran font, dll.
        - `Container`, digunakan untuk menyimpan dan mengelola widget lain.
        - `Text`, digunakan untuk menampilkan teks di aplikasi.
        - `Image`, digunakan untuk menampilkan gambar.
        - `Icon`, digunakan untuk menampilkan ikon dari berbagai ikon yang sudah disediakan oleh Flutter.
        - `Card`, digunakan untuk mengelompokkan informasi terkait bersama dalam bentuk card.

3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)

    - Menjalanakan perintah `flutter create pawnshop` untuk membuat project baru pada direktori yang diinginkan.
    - Pada cmd direktori `pawnshop` menjalankan perintah `flutter config --enable-web` untuk enable web support. dan menjalankan perintah `flutter run -d chrome` jika ingin menjalankan aplikasi pada web chrome.
    - Pada direktori `lib` membuat file `menu.dart` baru dan memindahkan kode dari file `main.dart` ke `menu.dart` yang berisi kedua class ini:
        ```
        class MyHomePage ... {
            ...
        }

        class _MyHomePageState ... {
            ...
        }
        ```
    dan `import 'package:flutter/material.dart';` di atas kode.
    - Lakukan `import 'package:pawnshop/menu.dart';` pada file `main.dart` serta menggantikan `home: const MyHomePage(title: 'Flutter Demo Home Page'),` dengan `home: MyHomePage(),` pada file `main.dart`.
    - Pada `menu.dart`, tambahkan kode dibawah ini untuk mengubah sifat widget menjadi stateless widget.
        ```
        class MyApp extends StatelessWidget {
            MyHomePage({Key? key}) : super(key: key);

            @override
            Widget build(BuildContext context) {
                return Scaffold(
                ...
                );
            }
        }
        ```
    - Pada `menu.dart`, tambahkan kode dibawah ini untuk menambahkan teks dan card.
        ```
        class ShopItem {
            final String name;
            final IconData icon;

            ShopItem(this.name, this.icon);
        }
        ```
        yang kemudian tambahkan kode dibawah ini pada bawah `MyHomePage({Key? key}) : super(key: key);` untuk menambahkan barang-barang.
        ```
        final List<ShopItem> items = [
            ShopItem("Lihat Item", Icons.checklist),
            ShopItem("Tambah Item", Icons.add_shopping_cart),
            ShopItem("Logout", Icons.logout),
        ];
        ```
    - Menambahkan kode dibawah ini untuk widget build:
        ```
        return Scaffold(
            appBar: AppBar(
                title: const Text(
                    'Pawnshop',
                ),
                titleTextStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                ),
            ),
            body: SingleChildScrollView(
                // Widget wrapper yang dapat discroll
                child: Padding(
                padding: const EdgeInsets.all(10.0), // Set padding dari halaman
                child: Column(
                    // Widget untuk menampilkan children secara vertikal
                    children: <Widget>[
                    const Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                        child: Text(
                        'Pawnshop\'s Shop', // Text yang menandakan toko
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                        ),
                        ),
                    ),
                    // Grid layout
                    GridView.count(
                        // Container pada card kita.
                        primary: true,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        children: items.map((ShopItem item) {
                        // Iterasi untuk setiap item
                        return ShopCard(item);
                        }).toList(),
                    ),
                    ],
                ),
                ),
            ),
        );
        ```
    - Menambahkan kode widget statless dibawah ini untuk membuat card:
        ```
        class ShopCard extends StatelessWidget {
            final ShopItem item;

            const ShopCard(this.item, {super.key}); // Constructor

            @override
            Widget build(BuildContext context) {
                return Material(
                    color: Colors.indigo,
                    child: InkWell(
                        // Area responsive terhadap sentuhan
                        onTap: () {
                        // Memunculkan SnackBar ketika diklik
                        ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(SnackBar(
                                content: Text("Kamu telah menekan tombol ${item.name}!")));
                        },
                        child: Container(
                        // Container untuk menyimpan Icon dan Text
                        padding: const EdgeInsets.all(8),
                            child: Center(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        Icon(
                                        item.icon,
                                        color: Colors.white,
                                        size: 30.0,
                                        ),
                                        const Padding(padding: EdgeInsets.all(3)),
                                        Text(
                                        item.name,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(color: Colors.white),
                                        ),
                                    ],
                                ),
                            ),
                        ),
                    ),
                );
            }
        }
        ```
