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