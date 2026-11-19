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


### Tugas 8

1. **Jelaskan perbedaan antara `Navigator.push()`, `Navigator.pushReplacement()`, dan `Navigator.pop()`. Metode apa yang digunakan untuk membuka formulir dari kartu aksi? Jelaskan juga bagaimana opsi Home di drawer membawa pengguna kembali ke halaman utama.**

   `Navigator.push()` digunakan untuk membuka halaman baru dengan menambahkannya ke navigation stack tanpa menghapus halaman sebelumnya. Dengan demikian, pengguna masih dapat kembali ke halaman sebelumnya menggunakan tombol Back.

   `Navigator.pushReplacement()` digunakan untuk membuka halaman baru sekaligus menggantikan halaman yang sedang aktif. Halaman sebelumnya dihapus dari navigation stack sehingga pengguna tidak kembali ke halaman tersebut melalui tombol Back.

   Sementara itu, `Navigator.pop()` digunakan untuk menutup halaman atau dialog yang sedang aktif dan kembali ke halaman sebelumnya dalam navigation stack.

   Pada aplikasi saya, `Navigator.push()` digunakan ketika pengguna menekan kartu aksi **Add Experience** di halaman Home untuk membuka `ExperienceFormPage`. Saya memilih metode ini agar pengguna dapat kembali ke halaman Home menggunakan tombol Back.

   Untuk navigasi melalui Drawer, saya menggunakan `Navigator.pushReplacement()` pada opsi Home. Metode ini menggantikan halaman formulir yang sedang dibuka dengan `MyHomePage`, sehingga pengguna dapat kembali ke halaman utama tanpa menumpuk halaman sebelumnya.

2. **Bagaimana susunan `Scaffold`, `AppBar`, dan `Drawer` membantu menjaga struktur halaman tetap konsisten? Berikan satu contoh penggunaan warna tema portofolio di lebih dari satu halaman.**

   `Scaffold` berfungsi sebagai kerangka utama halaman Flutter yang menyediakan struktur seperti `AppBar`, `Drawer`, dan `body`. Dengan menggunakan `Scaffold`, setiap halaman memiliki susunan komponen yang lebih terorganisasi.

   `AppBar` digunakan untuk menampilkan bagian atas halaman, seperti judul halaman dan tombol navigasi. Sementara itu, `Drawer` menyediakan menu navigasi yang dapat digunakan untuk berpindah antarhalaman.

   Pada aplikasi saya, `LeftDrawer` dibuat sebagai reusable widget sehingga dapat digunakan kembali pada halaman Home, Project Form, dan Experience Form. Hal ini membantu menjaga navigasi tetap konsisten dan menghindari penulisan kode Drawer berulang kali.

   Saya juga menggunakan warna navy (`Color(0xFF384959)`) sebagai warna utama portofolio. Warna tersebut digunakan pada Drawer Header, AppBar Experience Form, serta beberapa elemen teks dan komponen antarmuka di halaman Home. Dengan demikian, tampilan antarhalaman tetap memiliki identitas visual yang konsisten.

3. **Mengapa tempat letak tersebut dipilih untuk formulir? Jelaskan peran widget pengatur jarak dan widget penggulung ketika ruang layar terbatas.**

   Saya memilih untuk menyusun formulir secara vertikal menggunakan `Column` karena susunan tersebut membuat setiap input mudah dibaca dan diisi secara berurutan. Formulir juga menggunakan `Padding` untuk memberikan jarak antara komponen dengan tepi layar agar tampilannya lebih rapi dan nyaman digunakan.

   Widget `SizedBox` digunakan untuk memberikan jarak antarbagian formulir, seperti antara Title, Description, Category, dan Thumbnail. Dengan pengaturan jarak tersebut, setiap input memiliki ruang yang cukup dan tidak terlihat terlalu berdekatan.

   Selain itu, saya menggunakan `SingleChildScrollView` agar seluruh isi formulir tetap dapat diakses ketika tinggi layar terbatas atau ketika keyboard muncul. Tanpa widget tersebut, beberapa komponen seperti tombol Save Experience berpotensi tidak terlihat dan sulit dijangkau oleh pengguna.

4. **Apa peran `GlobalKey<FormState>`, `validator`, dan `validate()` saat tombol Simpan ditekan? Berikan satu contoh nilai yang ditolak oleh validasi dan jelaskan mengapa memilih jenis input atau papan ketik saja belum cukup.**

   `GlobalKey<FormState>` digunakan untuk memperoleh akses terhadap state dari widget `Form`. Melalui key tersebut, aplikasi dapat menjalankan proses validasi terhadap seluruh input yang berada di dalam formulir.

   `validator` merupakan fungsi yang digunakan untuk menentukan apakah nilai yang dimasukkan pengguna sudah memenuhi aturan tertentu. Jika input tidak valid, fungsi tersebut akan mengembalikan pesan kesalahan. Sebaliknya, jika input valid, fungsi akan mengembalikan `null`.

   Sementara itu, `validate()` digunakan untuk menjalankan seluruh fungsi validator ketika pengguna menekan tombol Save Experience. Apabila terdapat input yang tidak valid, proses penyimpanan tidak dilanjutkan dan pesan kesalahan ditampilkan pada field terkait.

   Contohnya, pada field Title, input yang hanya berisi spasi seperti `"     "` akan ditolak karena setelah menggunakan `.trim()`, nilainya menjadi kosong. Pada field Thumbnail, URL seperti `"gambar-saya"` juga ditolak karena tidak menggunakan skema HTTP atau HTTPS dan tidak memiliki host yang valid.

   Memilih jenis input atau keyboard saja belum cukup untuk menjamin validitas data. Misalnya, `TextInputType.url` hanya membantu menampilkan keyboard yang sesuai untuk memasukkan URL, tetapi tidak menjamin bahwa URL yang dimasukkan benar-benar valid. Oleh karena itu, validasi tetap diperlukan untuk memastikan data memenuhi aturan yang ditentukan sebelum diproses lebih lanjut.

## AI Diclosure

Pada proses pengerjaan Tugas 8, saya tidak menggunakan AI dalam proses pengerjaannya dengan rincian proses serta problem solving sebagai berikut

### Proses Pengerjaan dan Problem Solving

Dalam pengerjaan Individual Assignment 8, saya membagi implementasi menjadi beberapa tahapan agar pengembangan fitur lebih terstruktur.

#### 1. Analisis Model dan Penentuan Field Form

Langkah pertama adalah mempelajari model `Experience` yang sebelumnya telah dibuat pada proyek Django. Tujuannya adalah memastikan field pada Flutter Form sesuai dengan struktur data yang sudah tersedia di backend.

Berdasarkan model tersebut, saya memilih empat field untuk formulir Experience, yaitu:
- **Title**: nama pengalaman, wajib diisi dengan batas maksimal 255 karakter.
- **Description**: deskripsi pengalaman, wajib diisi.
- **Category**: kategori pengalaman yang dipilih melalui dropdown.
- **Thumbnail**: URL gambar pengalaman yang bersifat opsional.

Saya tidak memasukkan field `started_at` karena nilainya dibuat secara otomatis oleh Django (`auto_now_add`), sedangkan `ended_at` tidak termasuk dalam field pada `ExperienceForm` Django.

#### 2. Implementasi Experience Form

Setelah menentukan field, saya membuat file `experience_form.dart` di dalam direktori `lib/screens/`.

Form dibuat menggunakan `StatefulWidget`, `Form`, dan `GlobalKey<FormState>`. Setiap input dilengkapi dengan validator sesuai kebutuhan, seperti memeriksa input kosong, input yang hanya berisi spasi, batas panjang Title, serta format URL Thumbnail.

Untuk field Category, saya menggunakan `DropdownButtonFormField` dengan pilihan kategori yang disesuaikan dengan `EXPERIENCE_CHOICES` pada model Django.

#### 3. Integrasi Navigasi dari Home dan Drawer

Selanjutnya, saya mengintegrasikan Experience Form dengan navigasi aplikasi.

Pada halaman Home, saya menambahkan kartu aksi **Add Experience** yang menggunakan `Navigator.push()` untuk membuka halaman formulir.

Saya juga menambahkan opsi **Add Experience** pada `LeftDrawer` menggunakan `Navigator.pushReplacement()`. Dengan demikian, pengguna dapat mengakses formulir melalui dua jalur navigasi, yaitu kartu aksi pada Home dan Drawer.

Opsi Home pada Drawer juga menggunakan `Navigator.pushReplacement()` agar pengguna dapat kembali ke halaman utama.

#### 4. Penanganan Masalah Reset Form

Selama pengujian, saya menemukan bahwa setelah pengguna mengisi formulir dan menekan tombol OK pada AlertDialog, seluruh data input masih tertinggal pada halaman Experience Form.

Setelah membandingkan implementasinya dengan `ProjectFormPage`, saya menemukan bahwa fungsi tombol OK pada Experience Form hanya menutup dialog menggunakan `Navigator.pop(context)`, tanpa melakukan reset terhadap input.

Untuk mengatasi masalah tersebut, saya menambahkan:
- `_formKey.currentState!.reset()` untuk mereset seluruh field pada Form.
- `setState()` untuk mengembalikan variabel input ke nilai awal.
- Pengembalian kategori ke nilai default `organization`.

Dengan perbaikan tersebut, setelah dialog ditutup, formulir kembali ke kondisi awal dan dapat digunakan untuk memasukkan pengalaman baru.

#### 5. Pengujian Fungsionalitas

Tahap terakhir adalah menguji berbagai alur penggunaan aplikasi, meliputi:
- Membuka Experience Form melalui kartu aksi Home.
- Membuka Experience Form melalui Drawer.
- Memastikan validasi menolak input wajib yang kosong atau hanya berisi spasi.
- Memastikan URL Thumbnail yang tidak valid ditolak.
- Memastikan input yang valid menghasilkan AlertDialog berisi ringkasan seluruh data.
- Memastikan tombol OK menutup dialog dan mereset formulir.
- Memastikan navigasi kembali ke Home berjalan dengan baik.

Melalui tahapan tersebut, saya dapat mengidentifikasi dan memperbaiki permasalahan selama implementasi sehingga fitur Experience Form dapat digunakan sesuai kebutuhan tugas.