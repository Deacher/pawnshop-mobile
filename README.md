# Pawnshop

Pawnshop is a cutting-edge mobile app designed to streamline and enhance your pawnshop experience. Whether you're looking to pawn items or make a purchase, Pawnshop provides a convenient and secure platform for all your pawnshop needs.

- [Pawnshop](#pawnshop)
    - [Tugas 7](#tugas-7)
    - [Tugas 8](#tugas-8)
    - [Tugas 9](#tugas-9)

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

## Tugas 9

1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

    Bisa, namun hal tersebut tidak disarankan. Karena dengan membuat model terlebih dahulu, kita dapat mengetahui struktur data yang akan kita ambil. Selain itu, dengan membuat model terlebih dahulu, kita dapat melakukan validasi data yang akan kita ambil. Sehingga, kita dapat memastikan bahwa data yang kita ambil sesuai dengan yang kita inginkan.

2. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

    CookieRequest adalah kelas yang digunakan untuk mengirim permintaan HTTP dengan cookie. Ketika permintaan HTTP dikirim, cookie dapat disertakan dalam permintaan tersebut. Ini memungkinkan server untuk mengidentifikasi pengguna yang terautentikasi dan menyimpan informasi tentang sesi pengguna.

    Instance CookieRequest perlu dibagikan ke semua komponen di aplikasi Flutter karena ini memungkinkan setiap komponen untuk mengakses cookie yang sama. Dengan cara ini, setiap komponen dapat mengakses informasi yang sama tentang pengguna yang terautentikasi dan sesi pengguna. Ini sangat penting dalam aplikasi yang memerlukan otentikasi pengguna, seperti aplikasi perbankan atau aplikasi media sosial.

3. Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.

    Mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter melibatkan beberapa langkah. Berikut adalah dua pendekatan yang umum digunakan:

    1) Menggunakan Backendless SDK (Server-Side):
        Backendless adalah platform backend as a service yang menyediakan layanan untuk mengelola data dan otentikasi pengguna. Dalam hal ini, menggunakan Backendless SDK for Flutter. Untuk mengambil data, kita menggunakan API pengambilan data Backendless.

    2) Menggunakan HTTP Package (Client-Side):
        HTTP Package adalah package yang menyediakan API untuk mengirim permintaan HTTP. Dalam hal ini, menggunakan package http. Untuk mengambil data, kita menggunakan API pengambilan data package http. Setelah data diterima, kita dapat mengubahnya menjadi objek Dart menggunakan package convert.

4. Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

    Mekanisme autentikasi dari input data akun pada Flutter hingga selesainya proses autentikasi oleh Django melibatkan beberapa langkah. Berikut adalah penjelasan mengenai bagaimana proses ini dapat dilakukan:

    1) Pengiriman Data Akun dari Flutter ke Django:
        Pengguna memasukkan data akun seperti email dan kata sandi melalui antarmuka Flutter.
        Data ini dikirim ke backend Django melalui permintaan HTTP (biasanya menggunakan metode POST).
        Di sisi Django, kita akan mengimplementasikan API view yang menangani permintaan ini. API view ini akan memvalidasi data masukan dan memprosesnya.

    2) Autentikasi oleh Django:
        Setelah menerima data akun, Django akan memeriksa apakah kombinasi email dan kata sandi valid.
        Jika valid, Django akan menghasilkan token akses. Token ini akan dikirim kembali ke Flutter sebagai respons dari permintaan autentikasi.
        
    3) Penyimpanan Token di Flutter:
        Di Flutter, kita akan menyimpan token akses ini secara lokal (misalnya menggunakan shared preferences atau secure storage). Token ini akan digunakan untuk mengidentifikasi pengguna yang terautentikasi pada permintaan selanjutnya.

    4) Tampilan Menu pada Flutter:
        Setelah autentikasi berhasil, Flutter dapat menampilkan menu atau halaman berdasarkan status autentikasi.
        Misalnya, jika pengguna berhasil masuk, kita dapat menampilkan menu navigasi ke berbagai fitur aplikasi seperti profil, pengaturan, atau konten eksklusif.

5.  Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.

    - Container: Digunakan untuk mengelilingi widget lain dan memberikan padding, margin, dan dekorasi.

    - Row dan Column: Ideal untuk menyusun widget secara berurutan di satu arah (baris atau kolom).

    - ListView: Digunakan untuk item dan ingin memungkinkan pengguna untuk menggulir melalui daftar tersebut.

    - SizedBox: Digunakan untuk memberikan spasi antara widget atau untuk memberikan batas di sekitar widget tertentu.

    - Text: Digunakan untuk menampilkan teks di aplikasi.

    - Align: Berguna untuk mengatur posisi widget di dalam parentnya.

    - Drawer: Digunakan untuk menampilkan menu navigasi.

    - ElevatedButton: Digunakan untuk membuat tombol dengan tampilan yang lebih menarik.

6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

    - Pada folder `screens`, buatlah file baru bernama `login.dart` untuk halaman login. Tambahkan widget dibawah ini:
    ```
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
            appBar: AppBar(
                title: const Text('Login'),
            ),
            body: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        TextField(
                            controller: _usernameController,
                            decoration: const InputDecoration(
                                labelText: 'Username',
                            ),
                        ),
                        const SizedBox(height: 12.0),
                        TextField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                                labelText: 'Password',
                            ),
                            obscureText: true,
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                            onPressed: () async {
                                String username = _usernameController.text;
                                String password = _passwordController.text;

                                // Cek kredensial
                                // Untuk menyambungkan Android emulator dengan Django pada localhost,
                                // gunakan URL http://10.0.2.2/
                                final response = await request.login("http://localhost:8000/auth/login/", {
                                'username': username,
                                'password': password,
                                });
                    
                                if (request.loggedIn) {
                                    String message = response['message'];
                                    String uname = response['username'];
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => MyHomePage()),
                                    );
                                    ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(
                                            SnackBar(content: Text("$message Selamat datang, $uname.")));
                                    } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                            title: const Text('Login Gagal'),
                                            content:
                                                Text(response['message']),
                                            actions: [
                                                TextButton(
                                                    child: const Text('OK'),
                                                    onPressed: () {
                                                        Navigator.pop(context);
                                                    },
                                                ),
                                            ],
                                        ),
                                    );
                                }
                            },
                            child: const Text('Login'),
                        ),
                    ],
                ),
            ),
        );
    }
    ```
    - Untuk autentikasi django dengan flutter, setup autentikasi dulu pada django dengan membuat app baru bernama `authentication` untuk menambahkan logika login dan logout serta routing ke django dari flutter. 

    - Pada project flutter `main.dart`, tambahkan kode berikut untuk menginisiasi `CookieRequest`:
    ```
    create: (_) {
                CookieRequest request = CookieRequest();
                return request;
    },
    ```

    - Untuk menyesuaikan model yang ada pada django, gunakan quicktype untuk menghasilkan model yang sesuai dengan model yang ada pada django. Kemudian, buat file baru bernama `products.dart` pada folder `models` untuk menyimpan model yang telah dibuat.

    - Buat file baru `list_product.dart` pada `screens` untuk halaman list product. Pertama-tama, tambahkan class ini terlebih dahulu:
    ```
    class _ProductPageState extends State<ProductPage> {
    Future<List<Product>> fetchProduct() async {
        // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
        var url = Uri.parse(
            'http://localhost:8000/json/');
        var response = await http.get(
            url,
            headers: {"Content-Type": "application/json"},
        );

        // melakukan decode response menjadi bentuk json
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        // melakukan konversi data json menjadi object Product
        List<Product> list_product = [];
        for (var d in data) {
            if (d != null) {
                list_product.add(Product.fromJson(d));
            }
        }
        return list_product;
    }
    ```

    - Setelah itu, tambahkan widget dengan kode dibawah ini:
    ```
    Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text(
          'Products Page',
        ),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchProduct(),
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                    return const Column(
                        children: [
                        Text(
                            "Tidak ada data produk.",
                            style:
                                TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        ],
                    );
                } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(
                                    "${snapshot.data![index].fields.name}",
                                    style: const TextStyle(
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text("${snapshot.data![index].fields.description}"),
                                    const SizedBox(height: 5),
                                    Text("Amount: ${snapshot.data![index].fields.amount}"),
                                    const SizedBox(height: 10),
                                    ElevatedButton(onPressed: (){
                                      Navigator.push(
                                        context, 
                                        MaterialPageRoute(
                                          builder: (context) => DetailsPage(item: snapshot.data![index],),
                                        ));
                                    }, 
                                    child: Text("See Details"))
                                ],
                                ),
                            ));
                    }
                }
            }));
    }
    ```

    - Untuk menampilkan detail product, buat file baru bernama `per_item.dart` pada folder `screens`. Tambah widget dengan kode dibawah ini:
    ```
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: const Text(
            'Details Page',
            ),
            titleTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            ),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
        ),
        body: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Text(
                "${item.fields.name}",
                style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                ),
                ),
                const SizedBox(height: 10),
                Text(item.fields.description),
                const SizedBox(height: 5),
                Text("Amount: ${item.fields.amount}"),
                const SizedBox(height: 5),
                Text("Power: ${item.fields.power}"),
                const SizedBox(height: 5),
                Text("Mana: ${item.fields.mana}"),
                const SizedBox(height: 5),
                Text("Categories: ${item.fields.categories}"),
                ElevatedButton(
                onPressed: () {
                    Navigator.pop(context);
                },
                child: const Text('Go back'),
                ),
            ],
            ),
        ),
        );
    }
    ```