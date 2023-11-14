# Pawnshop

Pawnshop is a cutting-edge mobile app designed to streamline and enhance your pawnshop experience. Whether you're looking to pawn items or make a purchase, Pawnshop provides a convenient and secure platform for all your pawnshop needs.

- [Pawnshop](#pawnshop)
    - [Tugas 7](#tugas-7)
    - [Tugas 8](#tugas-8)

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
#### BONUS TUGAS 7
Kamu akan mendapatkan nilai bonus pada penilaian tugas ini apabila kamu mengimplementasikan warna-warna yang berbeda untuk setiap tombol (Lihat Item, Tambah Item, dan Logout).

- Menambahkan attribut baru pada class `ShopItem`:
    ```
    final Color color;
    ```

- Menambahkan kode berikut pada `menu.dart`, untuk memberikan warna yang berbeda pada masing-masing tombol:
    ```
    final List<ShopItem> items = [
        ShopItem("Lihat Item", Icons.checklist, Colors.green),
        ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.blue),
        ShopItem("Logout", Icons.logout, Colors.red),
    ];
    ```

- Menambahkan kode berikut pada class `ShopCard`, untuk menggunakan warna dari atribut `color` pada class `ShopItem`: 
    ```
    @override
    Widget build(BuildContext context) {
    return Material(
      color: item.color,
      ...
    )};
    ```

## Tugas 8

1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

    Secara umum, `Navigator.push()` digunakan untuk menambahkan halaman baru ke dalam stack halaman. Contoh penggunaan dari `Navigator.push()` adalah navigasi dari layar beranda ke layar detail ketika pengguna menekan tombol "Lihat Detail".

    Sedangkan `Navigator.pushReplacement()` digunakan untuk mengganti halaman teratas pada stack halaman dengan halaman baru. Contoh penggunaan dar `Navigator.pushReplacement()` adalah setelah pengguna berhasil login, halaman login digantikan oleh halaman beranda untuk mencegah pengguna kembali ke layar login melalui tombol kembali.

2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!

    Flutter menyediakan berbagai widget layout yang memungkinkan Anda mengatur tata letak dan struktur antarmuka pengguna Anda dengan cara yang berbeda. Berikut adalah beberapa layout widget utama dalam Flutter beserta konteks penggunaannya:

    - Container: 
    Widget paling dasar yang menyediakan kotak rektangular.
    Penggunaan: Digunakan untuk mengelilingi widget lain dan memberikan padding, margin, dan dekorasi.

    - Row dan Column: Mengatur widget secara horizontal (Row) atau vertikal (Column).
    Penggunaan: Ideal untuk menyusun widget secara berurutan di satu arah (baris atau kolom).

    - ListView: Menyusun widget secara vertikal atau horizontal dan memungkinkan pengguna untuk scroll. Penggunaan: Digunakan saat Anda memiliki sejumlah besar item dan ingin memungkinkan pengguna untuk menggulir melalui daftar tersebut.

    - GridView: Deskripsi: Menyusun widget dalam bentuk grid (baris dan kolom). Penggunaan: Berguna ketika Anda memiliki kumpulan item yang dapat ditampilkan dalam bentuk grid atau matriks.
    
    - Stack: Menempatkan widget di atas widget lainnya, menumpuknya. Penggunaan: Cocok untuk membuat antarmuka pengguna yang kompleks di mana beberapa widget mungkin tumpang tindih atau berada di atas yang lain.

    - Expanded dan Flexible: Mengelola ruang yang tersedia dalam widget parent. Penggunaan: Digunakan dalam Row, Column, atau Flex untuk memberikan widget sejumlah ruang yang dapat diperluas sesuai kebutuhan atau untuk membagi ruang sesuai proporsi tertentu.

    - SizedBox: Memberikan batas atau ruang kosong dengan lebar, tinggi, atau keduanya. Penggunaan: Digunakan untuk memberikan spasi antara widget atau untuk memberikan batas di sekitar widget tertentu.

    - Wrap: Mengelompokkan widget ke dalam baris atau kolom, bergantung pada ruang yang tersedia.
    Penggunaan: Cocok untuk menyusun widget yang dapat membentuk lebih dari satu baris atau kolom tergantung pada lebar atau tinggi yang tersedia.

    - Card: Menyediakan desain kartu sederhana yang umum digunakan untuk menampilkan informasi terkait. Penggunaan: Digunakan untuk membuat daftar atau elemen yang dapat diklik dengan desain kartu.

    - Align: Mengatur widget ke dalam container berdasarkan lokasi yang diinginkan (atas, tengah, bawah, kiri, kanan, dll.). Penggunaan: Berguna untuk mengatur posisi widget di dalam parentnya.

3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!

    Elemen input yang digunakan adalah `name` untuk nama barang, `amount` untuk jumlah barang, `description` untuk deskripsi barang. Ketiga elemen input tersebut dimasukkan ke database. Elemen input tersebut digunakan karena sesuai dengan kebutuhan yang diminta pada tugas kali ini.

4. Bagaimana penerapan clean architecture pada aplikasi Flutter?

    Penggunaan clean architecture pada aplikasi Flutter dapat dilakukan dengan memisahkan kode menjadi tiga layer, yaitu presentation layer, domain layer, dan data layer. Presentation layer berisi kode yang berhubungan dengan UI, domain layer berisi kode yang berhubungan dengan bisnis logic, dan data layer berisi kode yang berhubungan dengan data. 
    1. Domain Layer:
        Lapisan inti dari bisnis atau logika aplikasi. Tidak tergantung pada kerangka atau library tertentu.
        Isi:
        Entities: Mendefinisikan objek bisnis dan logika bisnis terkait.
        Use Cases (Interactors): Menyediakan aturan bisnis dan interaksi dengan data.
        Repositories Interface: Interface yang mendefinisikan kontrak untuk mendapatkan dan menyimpan data.
    2. Data Layer:
        Bertanggung jawab atas sumber data (API, database lokal, penyimpanan lokal, dll.). Tidak tergantung pada framework atau library tertentu.
        Isi:
        Repositories Implementation: Implementasi dari interface repository yang didefinisikan di lapisan domain.
        Data Sources: Abstraksi untuk mendapatkan data dari berbagai sumber (misalnya, API, database lokal).
    3. Presentation Layer:
        Bertanggung jawab untuk tampilan dan interaksi pengguna.
        Isi:
        UI Components (Widgets): Menangani tampilan dan interaksi pengguna.
        View Models atau Presenters: Memproses data dari lapisan domain untuk ditampilkan di UI.
        Dependency Injection: Menyediakan dependency untuk widget atau layanan.
    Setiap layer memiliki tugas dan tanggung jawab yang berbeda-beda. Layer-layer tersebut dapat saling berinteraksi dengan menggunakan dependency injection.

    Penerapan Clean Architecture pada Flutter dapat membantu meningkatkan pemeliharaan, memudahkan pengujian, dan memisahkan tanggung jawab antara lapisan-lapisan yang berbeda dalam aplikasi.

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)

    - Membuat folder baru bernama `screens` di direktori lib, kemudian pindahkan `menu.dart` ke folder `screens`. Setelah itu, buat file baru bernama `pawnshop_form.dart` di dalam folder `screens`. Kemudian, buat class `ShopFormPage` yang merupakan stateful widget. Membuat form dengan global key `final _formKey = GlobalKey<FormState>();` dan elemen input `name`, `amount`, dan `description`. Kemudian, modifikasi scaffold dengan kode ini:
        ```
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    decoration: InputDecoration(
                    hintText: "Nama Item",
                    labelText: "Nama Item",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                    ),
                    ),
                    onChanged: (String? value) {
                    setState(() {
                        _name = value!;
                    });
                    },
                    validator: (String? value) {
                    if (value == null || value.isEmpty) {
                        return "Nama tidak boleh kosong!";
                    }
                    return null;
                    },
                ),
                ),
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    decoration: InputDecoration(
                    hintText: "Amount",
                    labelText: "Amount",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                    ),
                    ),
                    // TODO: Tambahkan variabel yang sesuai
                    onChanged: (String? value) {
                    setState(() {
                        _amount = int.parse(value!);
                    });
                    },
                    validator: (String? value) {
                    if (value == null || value.isEmpty) {
                        return "Amount tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                        return "Amount harus berupa angka!";
                    }
                    return null;
                    },
                ),
                ),
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    decoration: InputDecoration(
                    hintText: "Deskripsi",
                    labelText: "Deskripsi",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                    ),
                    ),
                    onChanged: (String? value) {
                    setState(() {
                        // TODO: Tambahkan variabel yang sesuai
                        _description = value!;
                    });
                    },
                    validator: (String? value) {
                    if (value == null || value.isEmpty) {
                        return "Deskripsi tidak boleh kosong!";
                    }
                    return null;
                    },
                ),
                ),
                Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () {
                        if (_formKey.currentState!.validate()) {
                        showDialog(
                            context: context,
                            builder: (context) {
                            return AlertDialog(
                                title: const Text('Item berhasil tersimpan'),
                                content: SingleChildScrollView(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                    Text('Nama: $_name'),
                                    // TODO: Munculkan value-value lainnya
                                    Text('Amount: $_amount'),
                                    Text('Description: $_description')
                                    ],
                                ),
                                ),
                                actions: [
                                TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                    Navigator.pop(context);
                                    },
                                ),
                                ],
                            );
                            },
                        );
                        }
                        _formKey.currentState!.reset();
                    },
                    child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                    ),
                    ),
                ),
                ),
            ],
            ),
            ),
        ),
        ```
        
    - Dengan menggunakan `Navigator.push()` untuk berpindah halaman, tambahkan kode berikut di bagian `onTap` pada `ShopCard`:
        ```
        if (item.name == "Tambah Item") {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ShopFormPage()));
        }
        ```
    
    - Pada direktori `widgets`, buat file baru `left_drawer.dart`. Membuat drawer header dan yang diperlukan, lalu membuat widget `ListTile` untuk menyimpan menu yang ingin ditampilkan.
        ```
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
        ```

#### BONUS TUGAS 8
Membuat class `Items` pada `pawnshop_form.dart` untuk menginisiasi objek buku saat menekan tombol save (apabila valid). lalu buat `global.dart` untuk menyimpan semua variabel global, ini untuk menyimpan list buku yang telah dibuat. Kemudian buat tampilan baru yaitu `list_item.dart` untuk menampilkan list buku yang telah dibuat. Tambahkan ListTile baru di dalam drawer dan lakukan routing untuk menuju page `list_item.dart`, dan juga di `menu.dart` untuk menuju page `list_item.dart`. 
