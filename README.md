# **Tugas 7 - Elemen Dasar Flutter**

## **Apa Perbedaan Utama Antara *Stateless* dan *Stateful Widget* Dalam Konteks Pengembangan Aplikasi Flutter?**

*Stateless* dan stateful adalah dua jenis *widget* yang digunakan dalam pengembangan aplikasi Flutter. Perbedaan utama antara keduanya terdapat pada bagaimana cara mengelola dan merespons perubahan data atau keadaan (*state*) dalam aplikasi.

1. *Stateless Widget*:
* *Stateless widget* adalah *widget* yang tidak memiliki keadaan atau *state internal* yang dapat berubah atau disebut dengan statis.
* *Stateless widget* hanya merender tampilan berdasarkan properti yang diberikan pada saat pembuatan widget dan tidak dapat berubah sepanjang siklus hidupnya.
* *Stateless widget* biasanya digunakan untuk membuat elemen statis dalam aplikasi, seperti ikon, teks, atau tampilan yang tidak perlu berubah.

2. *Stateful Widget*:
* *Stateful widget* adalah *widget* yang dapat memiliki keadaan atau *state internal* yang dapat berubah secara dinamis selama *widget* hidup.
* *Stateful widget* digunakan ketika Anda perlu mengubah tampilan widget berdasarkan interaksi pengguna, perubahan data, atau kejadian lainnya.
* *Stateful widget* memiliki metode setState yang memungkinkan Anda untuk memperbarui tampilan *widget* saat keadaan internalnya berubah.
* *Stateful widget* terdiri dari dua bagian: *widget* itu sendiri dan objek yang disebut "state" yang mengelola data yang dapat berubah. Ketika state berubah, *widget* akan dirender ulang.

## **Sebutkan Seluruh *Widget* yang Kamu Gunakan untuk Menyelesaikan Tugas Ini dan Jelaskan Fungsinya Masing-Masing.**

* `MyHomePage` (StatelessWidget): Widget utama yang mewakili halaman utama aplikasi. Disini ditampilkan daftar item dari ShopItem.
* `ShopItem`: Kelas yang digunakan untuk merepresentasikan item dalam bentuk grid. Masing-masing item memiliki nama, ikon, dan warna.
* `ShopCard`: Widget yang digunakan untuk menampilkan setiap item dalam bentuk kartu yang berisi ikon dan nama item, serta merespons untuk menampilkan snack bar ketika ditekan.
* `Scaffold`: Widget yang menyediakan struktur dasar halaman dengan appBar dan body.
* `AppBar`: Widget yang digunakan untuk menampilkan baris judul di bagian atas halaman dengan isi teks "Goodang".
* `SingleChildScrollView`: Widget ini digunakan sebagai wrapper seluruh konten halaman sehingga dapat discroll jika diperlukan.
* `Padding`: Digunakan untuk memberikan padding di sekitar konten.
* `Column`: Digunakan untuk mengatur child-widgets secara vertikal dalam kolom.
* `GridView.count`: Widget yang digunakan untuk memuat daftar item dalam tampilan grid dengan jumlah kolom yang ditentukan.
* `Material`: Widget yang digunakan untuk mengatur latar belakang warna kartu ShopItem.
* `InkWell`: Widget yang membungkus kartu dan memberikan respons ketika di-tap, seperti menampilkan pesan SnackBar.
* `Icon`: Digunakan untuk menampilkan ikon.
* `Text`: Digunakan untuk menampilkan teks, contohnya disini untuk nama item.
* `Container`: Widget yang digunakan untuk menggabungkan ikon dan teks ke dalam satu kartu.
* `ScaffoldMessenger`: Untuk menampilkan pesan snackbar saat item ditekan.
* `SnackBar`: Untuk memunculkan pesan pop-up ketika item ditekan.

## ***Step-by-Step***

1. Buat proyek flutter baru bernama **Goodang** dengan cara berikut.
    ```
    flutter create goodang
    cd goodang
    ```
2. Buat file baru di direktori `goodang/lib` dengan nama `menu.dart`, lalu masukkan import berikut pada bagian atas kode.
    ```
    import 'package:flutter/material.dart';
    ```
3. Pindahkan kode baris 39 sampai akhir pada file `main.dart` ke file `menu.dart`. Kode tersebut berisi hal berikut.
    ```
    class MyHomePage ... {
        ...
    }

    class _MyHomePageState ... {
        ...
    }
    ```
4. Tambahkan impor berikut di bagian awal `main.dart`.
    ```
    import 'package:goodang/menu.dart';
    ```
5. Ubah kode di `main.dart` dibagian `colorScheme` jadi seperti berikut.
    ```
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
    ```
6. Pada `main.dart` ubah bagian `MyHomePage(title: 'Flutter Demo Home Page')` jadi `MyHomePage()`
7. Buka `menu.dart` dan ubah sifat widget dari `StatefulWidget` jadi `StatelessWidget`. Lalu ubah bagian `({super.key, required this.title})` jadi `({Key? key}) : super(key: key);` dan hapus `final String title;` kebawah, dan ganti dengan widget build menjadi seperti berikut.
    ```
    class MyHomePage extends StatelessWidget {
        MyHomePage({Key? key}) : super(key: key);

        @override
        Widget build(BuildContext context) {
            return Scaffold(
                ...
            );
        }
    }
    ```
8. Pada `menu.dart` hapus bagian `class _MyHomePageState` sampai selesai.
9. Define tipe pada list yang akan dibuat pada `menu.dart` untuk menambahkan teks dan kartu.
    ```
    class ShopItem {
        final String name;
        final IconData icon;

        ShopItem(this.name, this.icon);
    }
    ```
10. Didalam `menu.dart` tambahkan kode berikut persis dibawah `MyHomePage({Key? key}) : super(key: key);` untuk menginisiasi konten dari tiga tombol sederhana.
    ```
    final List<ShopItem> items = [
        ShopItem("Lihat Item", Icons.checklist),
        ShopItem("Tambah Item", Icons.add_shopping_cart),
        ShopItem("Logout", Icons.logout),
    ];
    ```
11. Pada bagian widget di `menu.dart` tambahkan kode berikut.
    ```
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Goodang',
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
                  'Inventory App', // Text yang menandakan toko
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
12. Tambahkan `class ShopCard` seperti berikut untuk membuat widget stateless baru dan di dalam kode ini terdapat Snackbar yang merespons saat tombol yang ada ditekan.
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

## **Bonus: Mengimplementasikan Warna-Warna yang Berbeda untuk Setiap Tombol (`Lihat Item`, `Tambah Item`, dan `Logout`).**

1. Pada `menu.dart` ubah bagian persis dibawah `MyHomePage({Key? key}) : super(key: key);` untuk menginisiasi warna dari tiga tombol sederhana seperti berikut.
    ```
    final List<ShopItem> items = [
        ShopItem("Lihat Item", Icons.checklist, Colors.amber[300]!),
        ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.amber[600]!),
        ShopItem("Logout", Icons.logout, Colors.lightBlue[200]!),
    ];
    ```
2. Masih di file yang sama, tambahkan kode bagian `classShopItem` jadi seperti berikut.
    ```
    class ShopItem {
        final String name;
        final IconData icon;
        final Color color;

        ShopItem(this.name, this.icon, this.color);
        }
    ```
3. Lalu di bagian `Widget build` jadi seperti berikut.
    ```
    Widget build(BuildContext context) {
        return Material(
        color: item.color,
        ...
    ```

# **Tugas 8 - Flutter Navigation, Layouts, Forms, and Input Elements**

## **Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()`, disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!**

1. `Navigator.push()`:

    * Metode ini digunakan untuk menambahkan layar baru di atas layar saat ini dalam tumpukan navigasi.
    * Layar sebelumnya akan tetap ada dalam tumpukan navigasi.
    * Berguna ketika ingin bisa kembali ke layar sebelumnya.
    contoh:
    ```
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AnotherScreen()),
    );
    ```

2. `Navigator.pushReplacement()`:

    * Metode ini digunakan untuk menambahkan layar baru ke tumpukan navigasi dan menggantikan layar saat ini dengan layar baru.
    * Layar sebelumnya akan dihapus dari tumpukan navigasi.
    * Berguna ketika Anda tidak ingin pengguna dapat kembali ke layar sebelumnya dan ingin menggantinya dengan layar baru.
    contoh:
    ```
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AnotherScreen()),
    );
    ```

## **Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!**

1. `Container`: Digunakan untuk mengelompokkan dan mendekorasi widget lain, seperti menentukan warna latar belakang, batas, dan padding.
2. `Row`: Menyusun widget dalam baris horizontal. Berguna saat ingin menampilkan beberapa widget secara berdampingan.
3. `Column`: Menyusun widget dalam kolom vertikal. Cocok untuk menata widget secara vertikal.
4. `ListView`: Menyusun widget dalam daftar yang dapat di-scroll. Cocok untuk menampilkan daftar item yang panjang atau dinamis.
5. `GridView`: Menyusun widget dalam bentuk grid (baris dan kolom). Berguna untuk menampilkan daftar item dalam tata letak grid.
6. `Stack`: Menumpuk widget satu di atas yang lain. Cocok ketika Anda ingin menempatkan widget di atas widget lain.
7. `Expanded`: Digunakan untuk memperluas child widget dalam widget parent, terutama berguna dalam Row dan Column untuk memberikan proporsi.
8. `Card`: Mengelompokkan informasi ke dalam kotak. Cocok untuk menampilkan informasi tertentu.
9. `Wrap`: Menyusun widget dalam baris dan kolom yang dapat melibatkan baris atau kolom baru jika tidak cukup ruang. Berguna saat ingin menampilkan banyak item dalam ruang yang terbatas.
10. `SizedBox`: Memberikan kotak kosong dengan lebar, tinggi, atau keduanya tertentu. Berguna untuk mengatur ruang antara atau sekitar widget.

## **Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!**

1. `TextFormField`
  * Widgetnya menyediakan kolom untuk melakukan input, yang saya gunakan pada data item seperti `owner`, `name`, `category`, `amount`, `price`, dan `description`.
  * `onChanged` digunakan untuk menyimpan nilai yang diinput dalam variabel seperti salah satunya yaitu `_owner`.
  * `validator` digunakan untuk memastikan input yang tidak kosong.
  * Dapat didefinisikan kontrol (controllers) untuk mengelola status input dan menggunakan callback untuk menangani perubahan atau pengiriman formulir.

2. `ElevatedButton`
  * Tombol yang memiliki bayangan atau elevated.
  * `child` dapat berisi widget lagi, dapat berupa text atau yang lainnya.
  * `onPressed` dapat diisi dengan fungsi ketika tombol ditekan, seperti menyimpan data.

## **Bagaimana penerapan clean architecture pada aplikasi Flutter?**

Clean architecture pada Flutter merupakan suatu konsep pembagian tugas atau kode dalam suatu aplikasi menjadi beberapa lapisan yang beda atau "Separation of Concern" yang diterapkan kepada development aplikasi Flutter, sehingga pengembangan, pemeliharaan,dan pengujian lebih mudah dilakukan. Adapun pembagiannya yakni,

1. Domain : Berisi logika bisnis dan aturan aplikasi, dapat digunakan agar lebih mudah melakukan migrasi antar platform.
  * Entities
  * Usecases
  * Repositories

2. App : Sebagai perantara yang berfungsi untuk menyambungkan layer lain dengan Domain.
  * View
  * Controller
  * Presenter
  * Extra

3. Data : Data retrival yang diambil dari database.
  * Repositories
  * Models
  * Mappers
  * Extra

4. Device : Berfungsi untuk berkomunikasi langsung dengan platform seperti Android dan IOS, serta bertanggung jawab atas fungsional native seperti contohnya GPS.
  * Devices
  * Extra

## ***Step-by-Step***

1. Buat direktori baru bernama `widgets` dan di dalamnya buat file baru bernama `left_drawer.dart`, lalu tambahkan kode berikut.
    ```
    import 'package:flutter/material.dart';
    import 'package:goodang/screens/menu.dart';
    import 'package:goodang/screens/itemlist_form.dart'; 

    class LeftDrawer extends StatelessWidget {
    const LeftDrawer({super.key});

    @override
    Widget build(BuildContext context) {
        return Drawer(
        child: ListView(
            children: [
            const DrawerHeader(
                // Bagian drawer header
            ),
            // Bagian routing
            ],
        ),
        );
    }
    }
    ```

2.  Selanjutnya isi bagian drawer headernya dengan kode berikut agar terlihat rapi.
    ```
    const DrawerHeader(
        decoration: BoxDecoration(
            color: Colors.lightBlue,
        ),
        child: Column(
            children: [
                Text(
                    'Goodang',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                    ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Catat seluruh keperluan inventory mu di sini!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                    ),
                ),
            ],
        ),
    ),
    ```

3. Lalu isi bagian routing menjadi seperti berikut untuk halaman-halaman yang sudah diimpor sebelumnya.
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ShopFormPage(),
                ));
        },
    ),
    ```

4. Buka `menu.dart`, lalu tambahkan kode berikut untuk menambahkan drawer yang sudah dibuat.
    ```
    @override
        Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
            title: const Text(
                'Goodang',
                style: TextStyle(
                fontSize: 30,
                color: Colors.white
                )
            ),
            backgroundColor: Colors.lightBlue[900],
            foregroundColor: Colors.white,
            ),
            drawer: const LeftDrawer(),
            ...
    ```

5. Untuk membuat form, perlu buat file baru bernama `itemlist_form.dart` di direktori `lib`, lalu tambahkan kode berikut. Disini terdapat import yang dibutuhkan, terdapat `_formKey`, dan terdapat variabel untuk menyimpan input.
    ```
    import 'package:flutter/material.dart';
    import 'package:goodang/widgets/left_drawer.dart';

    class ShopFormPage extends StatefulWidget {
        const ShopFormPage({super.key});

        @override
        State<ShopFormPage> createState() => _ShopFormPageState();
    }

    class _ShopFormPageState extends State<ShopFormPage> {
        final _formKey = GlobalKey<FormState>();
        String _owner = "";
        String _name = "";
        String _category = "";
        int _amount = 0;
        int _price = 0;
        String _description = "";
        
        @override
        Widget build(BuildContext context) {
        return Scaffold();
        }
    }
    ```

6. Isi bagian `Scaffold` dengan kode berikut. Disini `_formKey` ditambahkan di atribut `key` di `Form` sebagai handler form state, validasi form, dan penyimpanan form. Di sini juga terdapat widget `Column` sebagai child `SingleChildScrollView`. Lalu ada `TextFormField` yang dibungkus `Padding` sebagai child `Column` dan ada `crossAxisAlignment` untuk mengatur allignmentnya. Terdapat `onChanged` untuk menangkap perubahan dan `validator` untuk melakukan validasi `TextFormField`.
    ```
    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: const Center(
            child: Text(
                'Form Tambah Item',
            ),
            ),
            backgroundColor: Colors.lightBlue[900],
            foregroundColor: Colors.white,
        ),
        // TODO: Tambahkan drawer yang sudah dibuat di sini
        drawer: const LeftDrawer(),
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
                        hintText: "Owner",
                        labelText: "Owner",
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        ),
                    ),
                    onChanged: (String? value) {
                        setState(() {
                        _owner = value!;
                        });
                    },
                    validator: (String? value) {
                        if (value == null || value.isEmpty) {
                        return "Owner tidak boleh kosong!";
                        }
                        return null;
                    },
                    ),
                ),
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
                        return "Nama Item tidak boleh kosong!";
                        }
                        return null;
                    },
                    ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Kategori",
                        labelText: "Kategori",
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        ),
                    ),
                    onChanged: (String? value) {
                        setState(() {
                        _category = value!;
                        });
                    },
                    validator: (String? value) {
                        if (value == null || value.isEmpty) {
                        return "Kategori tidak boleh kosong!";
                        }
                        return null;
                    },
                    ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Jumlah",
                        labelText: "Jumlah",
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
                        return "Jumlah tidak boleh kosong!";
                        }
                        if (int.tryParse(value) == null) {
                        return "Jumlah harus berupa angka!";
                        }
                        return null;
                    },
                    ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Harga",
                        labelText: "Harga",
                        border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        ),
                    ),
                    // TODO: Tambahkan variabel yang sesuai
                    onChanged: (String? value) {
                        setState(() {
                        _price = int.parse(value!);
                        });
                    },
                    validator: (String? value) {
                        if (value == null || value.isEmpty) {
                        return "Harga tidak boleh kosong!";
                        }
                        if (int.tryParse(value) == null) {
                        return "Harga harus berupa angka!";
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
                // Tombol untuk pop up
                ]
            ),
            ),
        ),
        );
    }
    ```

7. Buatlah tombol di bagian Tombol untuk pop up sebagai child dari `Column` lalu bungkus dengan widget `Padding` dan `Allign` untuk memunculkan data pada pop up saat tombol ditekan. Di sini terdapat fungsi `showDialog()` pada bagian `onPressed()` dan ada widget `AlertDialog`, kemudian ada fungsi untuk reset form.
    ```
    Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.lightBlue[900]),
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
                                Text('Owner: $_owner'),
                                Text('Nama Item: $_name'),
                                Text('Kategori: $_category'),
                                Text('Jumlah: $_amount'),
                                Text('Harga: $_price'),
                                Text('Deskripsi: $_description'),
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
                    _formKey.currentState!.reset();
                }
                },
                child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                ),
            ),
        ),
    ),
    ```

8. Buka file `menu.dart`, lalu tambahkan kode berikut agar dapat menavigasi halaman lain.
    ```
    ...
    @override
    Widget build(BuildContext context) {
    return Material(
        color: item.color,
        child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
            // Memunculkan SnackBar ketika diklik
            ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
            // Navigate ke route yang sesuai (tergantung jenis tombol)
            if (item.name == "Tambah Item") {
            // Gunakan Navigator.push untuk melakukan navigasi ke MaterialPageRoute yang mencakup ShopFormPage.
            Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => const ShopFormPage(),
                    ));
            }
        },
        ...
    ```

9. Buat file baru di direktori `widgets` dengan nama `item_card.dart`.Lalu pindahkan bagian `class ShopItem` dan `class ShopCard` di `menu.dart` ke `item_card.dart`. Impor juga `material.dart` bawaan dan `itemlist_form.dart` di `item_card.dart`, lalu impor `item_card.dart` di `menu.dart`.

10. Buat folder baru dengan nama `screens` di direktori `lib`, lalu pindahkan `menu.dart` dan `itemlist_form.dart` kesana. Gunakan IDE yang ada ekstensi Flutter dan Dart agar refactoring dilakukan secara otomatis.

## **Bonus: Membuat sebuah halaman baru, yaitu halaman daftar item dengan isi item yang dibuat dan Mengarahkan pengguna ke halaman tersebut jika menekan tombol Lihat Item pada halaman utama atau drawer.**

1. Buka `item_card.dart` lalu tambahkan list dan class item untuk menyimpan item yang ditambahkan seperti kode berikut.
    ```
    List<Item> itemList = [];

    class Item {
    String owner = "";
    String name = "";
    String category = "";
    int amount = 0;
    int price = 0;
    String description = "";

    Item(
        this.owner, this.name, this.category, this.amount, this.price, this.description);
    }
    ```

2. Lakukan impor dan tambahkan kode berikut di bagian InkWellnya untuk menambahkan kondisi untuk berganti page ke halaman lihat produk, perhatikan kode berikut.
    ```
    import 'package:goodang/screens/itemlist.dart';
    ...
    // Navigate ke route yang sesuai (tergantung jenis tombol)
    if (item.name == "Tambah Item") {
        // TODO: Gunakan Navigator.push untuk melakukan navigasi ke MaterialPageRoute yang mencakup ShopFormPage.
        Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ShopFormPage(),
                ));
    } else if (item.name == "Lihat Item") {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const ItemListPage(),
            ));
    }
    ```

3. Buka file `itemlist_form.dart` lalu tambahkan kode berikut di bagian Allign `onPressed` untuk menyimpan item yang ditambahkan.
    ```
    ...
    onPressed: () {
        if (_formKey.currentState!.validate()) {
            itemList.add(Item(_owner, _name, _category, _amount, _price, _description));
            ...
    ```

4. Buat file baru di direktori `screens` dengan nama `itemlist.dart` sebagai page untuk melihat list item, isi dengan kode berikut.
    ```
    import 'package:flutter/material.dart';
    import 'package:goodang/widgets/item_card.dart';
    import 'package:goodang/widgets/left_drawer.dart';

    class ItemListPage extends StatefulWidget {
    const ItemListPage({super.key});
    @override
    State<ItemListPage> createState() => _ItemListPageState();
    }

    class _ItemListPageState extends State<ItemListPage> {
    final _formKey = GlobalKey<FormState>();
    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: const Center(
            child: Text(
                'Daftar Item di Goodang',
            ),
            ),
            backgroundColor: Colors.lightBlue[900],
            foregroundColor: Colors.white,
        ),
        drawer: const LeftDrawer(),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: itemList.length,
                    itemBuilder: (BuildContext context, int idx) {
                    return ListTile(
                        title: Text(
                            "${idx + 1}. ${itemList[idx].name}",
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            ),
                        ),
                        subtitle: Container(
                            margin: const EdgeInsets.only(left: 22.0),
                            child: Text(
                            """Owner: ${itemList[idx].owner}
    Kategori: ${itemList[idx].category}
    Jumlah: ${itemList[idx].amount}
    Harga: ${itemList[idx].price}
    Description: ${itemList[idx].description}""",
                            textAlign: TextAlign.left,
                            ),
                        ));
                    },
                )
                ],
            ),
            ),
        ),
        );
    }
    }
    ```

5. Buatlah routing pada file `left_drawer.dart`, seperti kode berikut.
```
import 'package:goodang/screens/itemlist.dart';
...
ListTile(
    leading: const Icon(Icons.checklist),
    title: const Text('Lihat Item'),
    // Bagian redirection ke ShopFormPage
    onTap: () {
        /*
        TODO: Buatlah routing ke ShopFormPage di sini,
        setelah halaman ShopFormPage sudah dibuat.
        */
        Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => const ItemListPage(),
            ));
    },
    ),
...
```

# **Tugas 9 - Integrasi Layanan Web Django dengan Aplikasi Flutter**

## **Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?**

Ya, kita dapat melakukan pengambilan data JSON tanpa membuat model terlebih dahulu, terutama jika struktur data JSONnya sederhana. Jika menggunakan bahasa pemrograman seperti Python, kita bisa langsung membaca dan memanipulasi data JSON tanpa perlu model khusus. Namun, jika data JSON lebih kompleks atau kita memiliki tugas yang memerlukan analisis yang lebih mendalam, membuat model khusus mungkin lebih baik. Keputusan ini tergantung pada kompleksitas tugas dan kebutuhan spesifik proyek kita. Untuk tugas sederhana, metode tanpa model bisa lebih efisien, sedangkan untuk tugas yang lebih kompleks, pembuatan model khusus mungkin diperlukan untuk hasil yang lebih baik.

## **Jelaskan fungsi dari `CookieRequest` dan jelaskan mengapa instance `CookieRequest` perlu untuk dibagikan ke semua komponen di aplikasi Flutter.**

`CookieRequest` berperan dalam mengelola permintaan HTTP dan pengelolaan cookie dalam konteks aplikasi Flutter. Dengan menyediakan instance `CookieRequest` melalui `Provider` ke semua komponen, akses yang konsisten terhadap informasi autentikasi dan sesi dapat diperoleh di seluruh aplikasi. Hal ini mempermudah setiap widget untuk berhubungan dengan layanan web, memberikan efisiensi tambahan dalam manajemen state dan autentikasi.

Distribusi global dari instance `CookieRequest` memastikan keseragaman dan kemudahan akses ke data sesi tanpa perlu membuat instance baru atau melakukan transfer manual informasi antar komponen. Oleh karena itu, pemanfaatan `Provider` membantu dalam menyederhanakan pengelolaan status otentikasi di seluruh aplikasi, serta memastikan bahwa setiap bagian dari aplikasi dapat dengan lancar terlibat dalam operasi otentikasi atau berinteraksi dengan layanan web.

## **Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.**

1. Buat model item dengan mengambil endpoint json di website `quicktype`. Copy kode ke file `item.dart` di folder `models`.
2. Tambahkan dependensi http yakni `flutter pub add http`.
3. Pada file `android/app/src/main/AndroidManifest.xml` tambahkan kode berikut.
    ```
    ...
    <application>
    ...
    </application>
    <!-- Required to fetch data from the Internet. -->
    <uses-permission android:name="android.permission.INTERNET" />
    ...
    ```
4. Buat file `list_item.dart` di folder `screens`, tambahkan kode berikut.
    ```
    import 'package:flutter/material.dart';
    import 'package:http/http.dart' as http;
    import 'dart:convert';
    import 'package:<APP_NAME>/models/item.dart';
    ```
5. Lalu tambahkan pula kode berikut.
    ```
    class ProductPage extends StatefulWidget {
        const ProductPage({Key? key}) : super(key: key);

        @override
        _ProductPageState createState() => _ProductPageState();
    }

    class _ProductPageState extends State<ProductPage> {
    Future<List<Item>> fetchProduct() async {
        // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
        var url = Uri.parse(
            'http://127.0.0.1:8000/json/');
        var response = await http.get(
            url,
            headers: {"Content-Type": "application/json"},
        );

        // melakukan decode response menjadi bentuk json
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        // melakukan konversi data json menjadi object Product
        List<Item> list_product = [];
        for (var d in data) {
            if (d != null) {
                list_product.add(Item.fromJson(d));
            }
        }
        return list_product;
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
            title: const Text('Item'),
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
                                "Tidak ada data item.",
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
                                        "${snapshot.data![index].fields.itemName}",
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                        ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text("${snapshot.data![index].fields.owner}"),
                                        const SizedBox(height: 10),
                                        Text("${snapshot.data![index].fields.category}"),
                                        const SizedBox(height: 10),
                                        Text("${snapshot.data![index].fields.amount}"),
                                        const SizedBox(height: 10),
                                        Text("${snapshot.data![index].fields.price}"),
                                        const SizedBox(height: 10),
                                        Text("${snapshot.data![index].fields.description}")
                                    ],
                                    ),
                                ));
                        }
                    }
                }));
        }
    }
    ```

## **Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.**
1. Mengolah input yang berisi username dan password dalam aplikasi Flutter.
2. Melakukan pengiriman informasi login pengguna ke server Django menggunakan metode http.post.
3. Setelah menerima data login, Django akan melakukan verifikasi. Jika valid, Django akan menghasilkan token autentikasi sebagai respons.
4. Dengan keberhasilan autentikasi, aplikasi Flutter akan menampilkan tampilan menu atau memberikan akses ke fitur-fitur tertentu yang memerlukan autentikasi.

## **Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.**
1. `http`: Dependensi yang diperlukan untuk mengirim permintaan HTTP.
2. `FutureBuilder`: Widget yang berguna untuk membuat komponen asinkron berdasarkan snapshot terkini dari data.
3. `Provider` : Digunakan untuk mengelola dan menyediakan state dari instance CookieRequest ke semua widget turunannya.
4. `Elevated Button`: Widget yang digunakan untuk membuat tombol.
5. `Text`:  Komponen untuk menampilkan teks.
6. `SizedBox`: Widget yang memberikan ruang atau spasi di antara elemen-elemen dalam tata letak.
7. `ListView`: Widget yang memungkinkan loop atau daftar tampilan item secara efisien.

## **step-by-step**

1. Buat `django-app authentication` pada proyek django yang dibuat.
2. jalankan perintah `pip install django-cors-headers` untuk menginstall library yg diperlukan.
3. tambahkan `authentication` dan `corsheaders` ke `settings.py` proyek utama bagian `INSTALLED_APPS`.
4. Tambahkan `corsheaders.middleware.CorsMiddleware` pada proyek utama `settings.py`.
5. Tambahkan kode berikut di `settings.py` proyek utama.
    ```
    CORS_ALLOW_ALL_ORIGINS = True
    CORS_ALLOW_CREDENTIALS = True
    CSRF_COOKIE_SECURE = True
    SESSION_COOKIE_SECURE = True
    CSRF_COOKIE_SAMESITE = 'None'
    SESSION_COOKIE_SAMESITE = 'None'
    ```
6. Buka `authentication/views.py` untuk membuat method baru seperti berikut.
    ```python
    from django.shortcuts import render
    from django.contrib.auth import authenticate, login as auth_login
    from django.http import JsonResponse
    from django.views.decorators.csrf import csrf_exempt

    @csrf_exempt
    def login(request):
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                auth_login(request, user)
                # Status login sukses.
                return JsonResponse({
                    "username": user.username,
                    "status": True,
                    "message": "Login sukses!"
                    # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
                }, status=200)
            else:
                return JsonResponse({
                    "status": False,
                    "message": "Login gagal, akun dinonaktifkan."
                }, status=401)

        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, periksa kembali email atau kata sandi."
            }, status=401)
    ```
7. Buat berkas `urls.py` di folder `authentication` dan menambahkan routing untuk fungsi yang sudah dibuat.
    ```python
    from django.urls import path
    from authentication.views import login

    app_name = 'authentication'

    urlpatterns = [
        path('login/', login, name='login'),
    ]
    ```
8. Tambahkan `path('auth/', include('authentication.urls')),` pada `goodang/urls.py`.
9. Install package berikut pada proyek mobile.
    ```
    flutter pub add provider
    flutter pub add pbp_django_auth
    ```
10. Ubah `main.dart` pada bagian `class MyApp` nya menjadi seperti berikut, untuk menyediakan `CookieRequest` library ke semua child widgets dengan menggunakan `Provider`.
    ```
    class MyApp extends StatelessWidget {
        const MyApp({Key? key}) : super(key: key);

        @override
        Widget build(BuildContext context) {
            return Provider(
                create: (_) {
                    CookieRequest request = CookieRequest();
                    return request;
                },
                child: MaterialApp(
                    title: 'Flutter App',
                    theme: ThemeData(
                        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
                        useMaterial3: true,
                    ),
                    home: MyHomePage()),
                ),
            );
        }
    }
    ```
11. Buat berkas baru dengan nama `login.dart` di `screens`, dan isi dengan kode berikut.
    ```
    import 'package:goodang/screens/menu.dart';
    import 'package:flutter/material.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';

    void main() {
        runApp(const LoginApp());
    }

    class LoginApp extends StatelessWidget {
    const LoginApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Login',
            theme: ThemeData(
                primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
        );
        }
    }

    class LoginPage extends StatefulWidget {
        const LoginPage({super.key});

        @override
        _LoginPageState createState() => _LoginPageState();
    }

    class _LoginPageState extends State<LoginPage> {
        final TextEditingController _usernameController = TextEditingController();
        final TextEditingController _passwordController = TextEditingController();

        @override
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
                                    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                                    // Untuk menyambungkan Android emulator dengan Django pada localhost,
                                    // gunakan URL http://10.0.2.2/
                                    final response = await request.login("http://127.0.0.1:8000/auth/login/", {
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
    }
    ```
12. Ubah `home: MyHomePage()` di Widget `MaterialApp(...)` di `main.dart` jadi `home: LoginPage()`
13. Buka endpoint `JSON` yang bisa diakses di web django yang sudah dibuat, salin dan copy ke web *QuickType*, disana ubah setup name jadi `Item`, source typenya `JSON` dan language `dart`, lalu copy hasil kodenya.
14. Buat file baru dengan nama `item.dart` di `lib/models`.
15. Lakukan `flutter pub add http` di proyek monile untuk menambahkan package  `http`.
16. Tambahkan kode berikut di `android/app/src/main/AndroidManifest.xml` agar akses internet diizinkan.
    ```
    ...
        <application>
        ...
        </application>
        <!-- Required to fetch data from the Internet. -->
        <uses-permission android:name="android.permission.INTERNET" />
    ...
    ```
17. Buat file baru dengan nama `list_item.dart` di `lib/screens`, tambahkan kode berikut.
    ```
    import 'package:flutter/material.dart';
    import 'package:http/http.dart' as http;
    import 'dart:convert';
    import 'package:goodang/models/item.dart';
    import 'package:goodang/widgets/left_drawer.dart';

    class ProductPage extends StatefulWidget {
        const ProductPage({Key? key}) : super(key: key);

        @override
        _ProductPageState createState() => _ProductPageState();
    }

    class _ProductPageState extends State<ProductPage> {
    Future<List<Item>> fetchProduct() async {
        // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
        var url = Uri.parse(
            'http://127.0.0.1:8000/json/');
        var response = await http.get(
            url,
            headers: {"Content-Type": "application/json"},
        );

        // melakukan decode response menjadi bentuk json
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        // melakukan konversi data json menjadi object Product
        List<Item> list_product = [];
        for (var d in data) {
            if (d != null) {
                list_product.add(Item.fromJson(d));
            }
        }
        return list_product;
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
            title: const Text('Item'),
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
                                "Tidak ada data item.",
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
                                        "${snapshot.data![index].fields.itemName}",
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                        ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text("${snapshot.data![index].fields.owner}"),
                                        const SizedBox(height: 10),
                                        Text("${snapshot.data![index].fields.category}"),
                                        const SizedBox(height: 10),
                                        Text("${snapshot.data![index].fields.amount}"),
                                        const SizedBox(height: 10),
                                        Text("${snapshot.data![index].fields.price}"),
                                        const SizedBox(height: 10),
                                        Text("${snapshot.data![index].fields.description}")
                                    ],
                                    ),
                                ));
                        }
                    }
                }));
        }
    }
    ```
18. Tambahkan halaman `list_item.dart` ke `widgets/left_drawer.dart` dengan menambahkan kode berikut.
    ```
    // Kode ListTile Menu
    ...
    ListTile(
        leading: const Icon(Icons.shopping_basket),
        title: const Text('Daftar Item'),
        onTap: () {
            // Route menu ke halaman produk
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProductPage()),
            );
        },
    ),
    ...
    ```
19. Buka `widgets/shop_card.dart` pada bagian `onTap: () { }` ubah fungsi tombol `Lihat Item` agar diarahkan ke `ProductPage`, lalu impor file yang dibutuhkan.
```
...
else if (item.name == "Lihat Item") {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProductPage()));
      }
...
```
20. Tambahkan kode berikut pada `list_item.dart` untuk menambahkan button yang mengarahkan ke page detail per item.
    ```
        ElevatedButton(
        onPressed: () {
        Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailItemPage(item: snapshot.data![index]),
        ),
        );
    },
    child: const Text('Detail Item'),
    ),
    ```
21. Buat berkas baru bernama `detail_item.dart` di folder `screens` dan isi dengan kode berikut.
    ```
    import 'package:flutter/material.dart';
    import 'package:goodang/models/item.dart';
    import 'package:goodang/widgets/left_drawer.dart';

    class DetailItemPage extends StatefulWidget {
        final Item item;

        const DetailItemPage({super.key, required this.item});

        @override
        State<DetailItemPage> createState() => _DetailItemPageState();
    }

    class _DetailItemPageState extends State<DetailItemPage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Center(
                child: Text(
                    'Detail Item',
                ),
                ),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
            ),
        drawer: const LeftDrawer(),
        body: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                const Text(
                'Item Name:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                widget.item.fields.itemName,
                style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Text(
                'Owner: ${widget.item.fields.owner}',
                style: const TextStyle(fontSize: 18),
                ),
                Text(
                'Category: ${widget.item.fields.category}',
                style: const TextStyle(fontSize: 18),
                ),
                Text(
                'Amount: ${widget.item.fields.amount}',
                style: const TextStyle(fontSize: 18),
                ),
                Text(
                'Price: ${widget.item.fields.price}',
                style: const TextStyle(fontSize: 18),
                ),
                Text(
                'Description: ${widget.item.fields.description}',
                style: const TextStyle(fontSize: 18),
                ),
                ElevatedButton(
                onPressed: () {
                    // Navigasi kembali ketika tombol ditekan
                    Navigator.pop(context);
                },
                child: const Text('Kembali'),
                ),            
            ],
            ),
        ),
        );
    }
    }
    ```

22. Buka `main/views.py` di proyek django, buat fungsi berikut.
    ```python
    @csrf_exempt
    def create_item_flutter(request):
        if request.method == 'POST':
            
            data = json.loads(request.body)

            new_product = Item.objects.create(
                user = request.user,
                owner = data["owner"],
                item_name = data["item_name"],
                category = data["category"],
                amount = int(data["amount"]),
                price = int(data["price"]),
                description = data["description"]
            )

            new_product.save()

            return JsonResponse({"status": "success"}, status=200)
        else:
            return JsonResponse({"status": "error"}, status=401)
    ```
23. Tambahkan impor dan path nya ke `main/urls.py` dengan kode berikut.
    ```python
    path('create-flutter/', create_item_flutter, name='create_product_flutter'),
    ```
24. Buka `itemlist_form.dart` tambahkan `CookieRequest` dengan kode berikut.
    ```
    ...
    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();

        return Scaffold(
    ...
    ```
25. Ubah `onPressed: ()` jadi seperti berikut.
    ```
    onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                                // Kirim ke Django dan tunggu respons
                                // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                                final response = await request.postJson(
                                "http://127.0.0.1:8000/create-flutter/",
                                jsonEncode(<String, String>{
                                    'owner': _owner,
                                    'item_name': _name,
                                    'category': _category,
                                    'amount': _amount.toString(),
                                    'price': _price.toString(),
                                    'description': _description,
                                    // TODO: Sesuaikan field data sesuai dengan aplikasimu
                                }));
                                if (response['status'] == 'success') {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                    content: Text("Item baru berhasil disimpan!"),
                                    ));
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => MyHomePage()),
                                    );
                                } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                        content:
                                            Text("Terdapat kesalahan, silakan coba lagi."),
                                    ));
                                }
                            }
                        },
    ```
26. Buat method untuk logout pada `authentication/views.py` seperti kode berikut.
    ```python
    from django.contrib.auth import logout as auth_logout
    ...
    @csrf_exempt
    def logout(request):
        username = request.user.username

        try:
            auth_logout(request)
            return JsonResponse({
                "username": username,
                "status": True,
                "message": "Logout berhasil!"
            }, status=200)
        except:
            return JsonResponse({
            "status": False,
            "message": "Logout gagal."
            }, status=401)
    ```
27. impor dan tambahkan pathnya pada `authentication/urls.py` seperti kode berikut.
    ```python
    path('logout/', logout, name='logout'),
    ```
28. Buka `lib/widgets/item_card.dart` tambahkan kode berikut dan impor yang diperlukan.
    ```
    ...
    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Material(
    ...
    ```
29. Pada `lib/widgets/item_card.dart` ubah `onTap: () {...}` jadi `onTap: () async {...}` agar widget `InkWell` bisa logout secara asinkronus, lalu tambahkan kode berikut.
    ```
    } else if (item.name == "Logout") {
                final response = await request.logout(
                    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                    "http://127.0.0.1:8000/auth/logout/");
                String message = response["message"];
                if (response['status']) {
                    String uname = response["username"];
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("$message Sampai jumpa, $uname."),
                    ));
                    Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("$message"),
                    ));
                }
                }
    ```

## **BONUS: Mengimplementasikan fitur registrasi akun pada aplikasi Flutter dan Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login**
1. Buat method `register` di `views.py` folder `authentication` di proyek django dan lakukan impor dan masukkan pathnya di `urls.py`.
    ```python
    @csrf_exempt
    def register(request):
        
        username = request.POST.get('username')
        password = request.POST.get('password')

        if User.objects.filter(username=username).exists():
            return JsonResponse({
                "status": False,
                "message": "Username sudah digunakan. Pilih username lain."
            }, status=400)

        # Buat user baru tanpa menggunakan email
        user = User.objects.create_user(username=username, password=password)

        return JsonResponse({
            "username": user.username,
            "status": True,
            "message": "Registrasi berhasil!"
        }, status=201)
    ```
2. Buat file `register.dart` di `lib/screens` proyek mobile, dan isi dengan kode berikut.
    ```
    import 'package:flutter/material.dart';
    import 'package:goodang/screens/login.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';

    class RegistrationPage extends StatefulWidget {
    const RegistrationPage({Key? key}) : super(key: key);

    @override
    _RegistrationPageState createState() => _RegistrationPageState();
    }

    class _RegistrationPageState extends State<RegistrationPage> {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: false,
                title: const Center(
                child: Text(
                    'Register',
                ),
                ),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
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
                    if (username.isEmpty || password.isEmpty) {
                        _usernameController.clear();
                        _passwordController.clear();
                        showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                            title: const Text('Input Tidak Valid'),
                            content: const Text('Harap isi semua kolom input.'),
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
                        return; // Stop eksekusi jika input tidak valid
                    }

                    final response = await request.post("http://127.0.0.1:8000/auth/register/", {
                    'username': username,
                    'password': password,
                    });

                    bool status = response['status'];

                    if (status == false) {
                        _usernameController.clear();
                        _passwordController.clear();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                title: const Text('Register Gagal'),
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
                    } else {
                        _usernameController.clear();
                        _passwordController.clear();
                        String message = response['message'];
                        String uname = response['username'];
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                        ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                                SnackBar(content: Text("$message Berhasil membuat akun dengan username $uname.")));
                    }
                    
                },
                child: const Text('Register'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                onPressed: () {
                    // Navigasi kembali ketika tombol ditekan
                    Navigator.pop(context);
                },
                child: const Text('Kembali'),
                ),  
            ],
            ),
        ),
        );
    }
    }
    ```
2. Ubah `login.dart` menjadi seperti berikut.
    ```
    import 'package:goodang/screens/menu.dart';
    import 'package:flutter/material.dart';
    import 'package:goodang/screens/register.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';

    void main() {
        runApp(const LoginApp());
    }

    class LoginApp extends StatelessWidget {
    const LoginApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Login',
            theme: ThemeData(
                primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
        );
        }
    }

    class LoginPage extends StatefulWidget {
        const LoginPage({super.key});

        @override
        _LoginPageState createState() => _LoginPageState();
    }

    class _LoginPageState extends State<LoginPage> {
        final TextEditingController _usernameController = TextEditingController();
        final TextEditingController _passwordController = TextEditingController();

        @override
        Widget build(BuildContext context) {
            final request = context.watch<CookieRequest>();
            return Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: false,
                title: const Center(
                child: Text(
                    'Login',
                ),
                ),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
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
                            onPressed: () {
                                _usernameController.clear();
                                _passwordController.clear();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                    builder: (context) => const RegistrationPage(),
                                    ),
                                );
                            },
                            child: const Text('Register'),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                                onPressed: () async {
                                    String username = _usernameController.text;
                                    String password = _passwordController.text;

                                    final response = await request.login("http://127.0.0.1:8000/auth/login/", {
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
    }
    ```
3. Untuk filter per item tambahkan method `get_item` di di `views.py` folder `authentication` di proyek django dan lakukan impor dan masukkan pathnya di `urls.py`.
    ```python
    def get_item_json(request):
        item = Item.objects.filter(user = user)
        return HttpResponse(serializers.serialize('json', item))
    ```

4. Ubah `list_item.dart` menjadi seperti berikut.
    ```
    import 'package:flutter/material.dart';
    import 'package:goodang/screens/detail_item.dart';
    import 'package:http/http.dart' as http;
    import 'dart:convert';
    import 'package:goodang/models/item.dart';
    import 'package:goodang/widgets/left_drawer.dart';
    import 'package:pbp_django_auth/pbp_django_auth.dart';
    import 'package:provider/provider.dart';

    class ProductPage extends StatefulWidget {
        const ProductPage({Key? key}) : super(key: key);

        @override
        _ProductPageState createState() => _ProductPageState();
    }

    class _ProductPageState extends State<ProductPage> {
        Future<List<Item>> fetchProduct(CookieRequest request) async {
        // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
        final response = await request.postJson(
                                    "http://127.0.0.1:8000/get-item/",
                                    jsonEncode(<String, String>{
                                        'name':'bait',
                                    }));
        // var url = Uri.parse(
        //     'http://127.0.0.1:8000/json/');
        // var response = await http.get(
        //     url,
        //     headers: {"Content-Type": "application/json"},
        // );

        // melakukan decode response menjadi bentuk json
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        // melakukan konversi data json menjadi object Product
        List<Item> list_product = [];
        for (var d in data) {
            if (d != null) {
                list_product.add(Item.fromJson(d));
            }
        }
        return list_product;
    }

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
            appBar: AppBar(
            title: const Center(
                child: Text(
                'List Item',
                ),
            ),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            ),
            drawer: const LeftDrawer(),
            body: FutureBuilder(
                future: fetchProduct(request),
                builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                        return const Center(child: CircularProgressIndicator());
                    } else {
                        if (!snapshot.hasData) {
                        return const Column(
                            children: [
                            Text(
                                "Tidak ada data item.",
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
                                        "${index + 1}. ${snapshot.data![index].fields.itemName}",
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                        ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text("${snapshot.data![index].fields.owner}"),
                                        const SizedBox(height: 10),
                                        Text("${snapshot.data![index].fields.category}"),
                                        const SizedBox(height: 10),
                                        Text("${snapshot.data![index].fields.amount}"),
                                        const SizedBox(height: 10),
                                        Text("${snapshot.data![index].fields.price}"),
                                        const SizedBox(height: 10),
                                        Text("${snapshot.data![index].fields.description}"),
                                        ElevatedButton(
                                            onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                builder: (context) => DetailItemPage(item: snapshot.data![index]),
                                                ),
                                            );
                                        },
                                        child: const Text('Detail Item'),
                                        )
                                    ],
                                    ),
                                ));
                        }
                    }
                }));
        }
    }
    ```