# MyPortfolio Mobile

Aplikasi mobile portofolio pribadi yang dikembangkan menggunakan Flutter dan Dart sebagai bagian dari Individual Assignment 7 mata kuliah Pemrograman Berbasis Platform (PBP).

Aplikasi ini menampilkan informasi profil pemilik portofolio serta beberapa menu aksi sederhana dengan desain yang mengadaptasi warna Navy dan Sky Blue.

## Features

- Menampilkan informasi pribadi berupa NPM, nama lengkap, dan kelas PBP.
- Menampilkan halaman sambutan portofolio.
- Menyediakan tiga menu aksi: View Portfolio, Add Portfolio Item, dan Logout.
- Menampilkan ikon dan warna yang berbeda pada setiap menu aksi.
- Menampilkan SnackBar ketika pengguna menekan menu aksi.

## Tech Stack

- Flutter
- Dart
- Material Design 3

## Project Structure

```text
myportofolio_mobile/
├── lib/
│   ├── main.dart
│   └── menu.dart
├── android/
├── web/
├── pubspec.yaml
└── README.md
```

## Getting Started

### Prerequisites

Pastikan Flutter SDK sudah terpasang dan dapat dijalankan melalui terminal.

Periksa instalasi Flutter dengan:

```bash
flutter doctor
```

### Installation

1. Clone repository:

```bash
git clone <repository-url>
```

2. Masuk ke direktori proyek:

```bash
cd myportofolio_mobile
```

3. Install dependencies:

```bash
flutter pub get
```

4. Jalankan aplikasi:

```bash
flutter run
```

Untuk menjalankan aplikasi melalui Google Chrome:

```bash
flutter run -d chrome
```

### Code Analysis

Untuk memeriksa kualitas dan potensi kesalahan kode, jalankan:

```bash
flutter analyze
```

## Tugas 7

### Pertanyaan Reflektif

**1. Jelaskan apa yang dimaksud dengan widget tree pada Flutter dan bagaimana hubungan induk-anak (parent-child) bekerja antar-widget!**

Widget tree merupakan struktur hierarki yang menggambarkan bagaimana widget-widget dalam Flutter disusun untuk membentuk antarmuka aplikasi. Setiap widget dapat memiliki widget lain sebagai anaknya, sehingga membentuk hubungan parent-child.

Widget parent bertanggung jawab untuk mengatur atau menyediakan struktur bagi widget child. Sebagai contoh, pada proyek ini, `Scaffold` menjadi parent yang menyediakan struktur dasar halaman aplikasi, seperti `AppBar` dan `body`. Di dalam `body`, terdapat `SingleChildScrollView` yang memiliki `Column` sebagai child. Selanjutnya, `Column` menampung beberapa widget seperti `Container`, `Row`, `Text`, dan `GridView`.

Dengan konsep widget tree, antarmuka aplikasi dapat dibangun secara terstruktur, modular, dan mudah dikelola. Perubahan pada suatu bagian widget juga dapat dilakukan tanpa harus mengubah keseluruhan struktur aplikasi.

**2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya masing-masing!**

Berikut merupakan widget-widget yang digunakan dalam proyek MyPortfolio Mobile:

| Widget | Fungsi |
|---|---|
| `MaterialApp` | Menjadi root aplikasi dan menyediakan konfigurasi tema serta navigasi. |
| `Scaffold` | Menyediakan struktur dasar halaman aplikasi. |
| `AppBar` | Menampilkan bagian header aplikasi. |
| `Text` | Menampilkan teks seperti judul, informasi profil, dan deskripsi. |
| `Icon` | Menampilkan ikon pada aplikasi. |
| `IconButton` | Menampilkan tombol berbasis ikon yang dapat ditekan. |
| `Padding` | Memberikan jarak di sekitar widget. |
| `CircleAvatar` | Menampilkan ikon profil dan ikon berbentuk lingkaran. |
| `SingleChildScrollView` | Memungkinkan konten halaman digulir secara vertikal. |
| `Column` | Menyusun widget secara vertikal. |
| `Row` | Menyusun widget secara horizontal. |
| `Container` | Menjadi wadah untuk mengatur ukuran, warna, dekorasi, dan tata letak. |
| `SizedBox` | Memberikan jarak atau ruang dengan ukuran tertentu. |
| `Expanded` | Mengatur widget agar mengisi ruang yang tersedia dalam Row atau Column. |
| `GridView.count` | Menampilkan kumpulan widget dalam susunan grid. |
| `Card` | Menampilkan informasi profil dalam bentuk kartu. |
| `Material` | Menyediakan permukaan Material untuk kartu menu aksi. |
| `InkWell` | Memberikan interaksi ketika pengguna menekan kartu. |
| `SnackBar` | Menampilkan pesan sementara setelah tombol aksi ditekan. |
| `ScaffoldMessenger` | Mengelola dan menampilkan SnackBar pada halaman. |

Selain widget bawaan Flutter tersebut, proyek ini juga menggunakan dua reusable widget buatan sendiri, yaitu:

- `InfoCard`: digunakan untuk menampilkan informasi NPM, nama, dan kelas dalam bentuk kartu.
- `ItemCard`: digunakan untuk menampilkan menu aksi dengan ikon, warna, judul, deskripsi, dan interaksi SnackBar.

Proyek ini juga menggunakan class `ItemHomepage` sebagai model untuk menyimpan informasi setiap menu aksi, seperti nama, ikon, dan warna.

**3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini umumnya digunakan sebagai root widget pada aplikasi Flutter!**

`MaterialApp` merupakan widget yang menyediakan konfigurasi dasar untuk aplikasi Flutter yang menggunakan Material Design. Widget ini biasanya digunakan sebagai root widget karena menjadi titik awal dalam membangun struktur aplikasi.

Dalam proyek ini, `MaterialApp` digunakan untuk mengatur beberapa konfigurasi, seperti:

- `title` untuk menentukan judul aplikasi.
- `theme` untuk mengatur tema visual aplikasi, termasuk warna utama dan warna sekunder.
- `debugShowCheckedModeBanner` untuk mengatur tampilan label debug.
- `home` untuk menentukan halaman pertama yang ditampilkan ketika aplikasi dijalankan.

Dengan menggunakan `MaterialApp` sebagai root widget, aplikasi dapat memiliki konfigurasi global yang konsisten dan menyediakan berbagai fitur dasar Flutter, sehingga pengembangan antarmuka menjadi lebih terstruktur.

**4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget! Kapan kita sebaiknya memilih StatelessWidget dan kapan harus menggunakan StatefulWidget?**

`StatelessWidget` dan `StatefulWidget` merupakan dua jenis widget utama dalam Flutter yang dibedakan berdasarkan pengelolaan state atau keadaan internalnya.

`StatelessWidget` merupakan widget yang tidak memiliki state internal yang dapat berubah selama siklus hidup widget. Tampilan widget ditentukan berdasarkan konfigurasi atau data yang diterima. Widget ini cocok digunakan untuk komponen yang tampilannya relatif tetap.

Sementara itu, `StatefulWidget` merupakan widget yang memiliki state yang dapat berubah selama aplikasi berjalan. Perubahan state dapat menyebabkan widget melakukan rebuild sehingga tampilan diperbarui. Contohnya adalah form input, checkbox, counter, atau komponen yang perlu merespons perubahan data pengguna.

Pada proyek MyPortfolio Mobile, `MyHomePage` menggunakan `StatelessWidget` karena informasi profil dan daftar menu aksi yang ditampilkan bersifat statis. Tidak terdapat state lokal yang perlu diperbarui secara dinamis. Oleh karena itu, penggunaan `StatelessWidget` lebih sederhana dan sesuai dengan kebutuhan halaman utama saat ini.

**5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di dalam metode build?**

`BuildContext` merupakan referensi terhadap lokasi suatu widget di dalam widget tree. Setiap widget memiliki `BuildContext` yang dapat digunakan untuk mengakses informasi dan resource dari widget-widget yang berada di atasnya dalam hierarki.

`BuildContext` penting karena memungkinkan suatu widget berinteraksi dengan struktur aplikasi dan mengakses berbagai konfigurasi yang disediakan oleh ancestor widget.

Dalam proyek ini, `BuildContext` digunakan sebagai parameter pada metode `build` di beberapa widget. Salah satu contohnya adalah:

```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    // Widget halaman utama
  );
}
```

Selain itu, `BuildContext` juga digunakan ketika menampilkan SnackBar melalui:

```dart
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text('Kamu telah menekan tombol ${item.name}!'),
  ),
);
```

Melalui `context`, aplikasi dapat menemukan `ScaffoldMessenger` yang sesuai dalam widget tree dan menampilkan SnackBar pada halaman yang sedang aktif.

**6. Jelaskan konsep hot reload di Flutter dan apa perbedaannya dengan hot restart! Kapan kita tidak bisa hanya mengandalkan hot reload dan harus melakukan hot restart atau full restart?**

Hot reload merupakan fitur Flutter yang memungkinkan developer menerapkan perubahan kode ke aplikasi yang sedang berjalan tanpa harus memulai ulang aplikasi secara keseluruhan. Fitur ini membantu mempercepat proses pengembangan karena perubahan pada tampilan atau sebagian kode dapat langsung terlihat.

Hot restart berbeda dengan hot reload karena hot restart akan memulai ulang aplikasi dari awal dan menginisialisasi ulang state aplikasi. Dengan demikian, perubahan yang berkaitan dengan proses inisialisasi atau state awal dapat diterapkan secara lebih menyeluruh.

Hot reload cocok digunakan ketika melakukan perubahan pada tampilan, teks, warna, atau struktur widget yang tidak memerlukan inisialisasi ulang aplikasi.

Namun, hot reload tidak selalu cukup. Hot restart diperlukan ketika perubahan berkaitan dengan inisialisasi state atau perubahan yang tidak diterapkan secara benar melalui hot reload. Sementara itu, full restart dapat diperlukan ketika terdapat perubahan konfigurasi native, plugin, atau lingkungan aplikasi yang membutuhkan proses build dan peluncuran ulang secara menyeluruh.

## AI Disclosure

chat AI : https://chatgpt.com/share/6af86801-6c40-83ec-84b5-2d03232f65d8

Dalam proses pengerjaan Individual Assignment 7, saya menggunakan ChatGPT sebagai alat bantu untuk memahami konsep Flutter dan Dart, mendiskusikan struktur widget, serta memperoleh saran implementasi interface aplikasi.

Bantuan AI digunakan dalam beberapa bagian, antara lain:
- Memahami konsep `StatelessWidget`, `MaterialApp`, widget tree, dan `BuildContext`.
- Mendiskusikan struktur dan pemisahan kode antara `main.dart` dan `menu.dart`.
- Mendapatkan saran implementasi reusable widget seperti `InfoCard` dan `ItemCard`.
- Mendapatkan saran desain antarmuka dan penggunaan warna.
- Membantu mengidentifikasi serta memperbaiki potensi masalah pada kode.

Seluruh saran dan kode yang dihasilkan AI ditinjau kembali dan disesuaikan dengan kebutuhan proyek serta instruksi Individual Assignment 7. Saya tetap bertanggung jawab untuk memahami implementasi, melakukan perubahan, dan memeriksa hasil aplikasi secara mandiri.

AI digunakan sebagai alat bantu pembelajaran dan pengembangan, bukan sebagai pengganti pemahaman terhadap materi yang dipelajari.
