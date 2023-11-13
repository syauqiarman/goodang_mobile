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