# Test Enter Komputer The Movie DB API

Ini adalah project test reqruitment Enter Komputer, saya bukanlah seorang designer tapi saya programmer dengan skill analisis yang baik, adaptasi yang cepat, cepat dalam mempelajari sesuatu dan pemikiran yang kritis.

Project Flutter ini menggunakan arsitekture ***Clean Architecture***.

## Running The Project
Jika ingin menjalankan project secara debug maka kamu akan membutuhkan **Access Token** dan **User ID** dari The Movie DB dari akun The Movie DB yang sudah didaftarkan

untuk Menjalankan debug menggunakan perintah flutter

```bash
flutter run -d DEVICE_ID --dart-define=ACCESS_TOKEN=YOUR_ACCESS_TOKEN --dart-define=ACCOUNT_ID=YOUR_ACCOUNT_ID
```

## Building The Project
untuk membangun aplikasi android produksi

```bash
flutter build apk --release --dart-define=ACCESS_TOKEN=YOUR_ACCESS_TOKEN --dart-define=ACCOUNT_ID=YOUR_ACCOUNT_ID
```

ingat jangan pernah hardcode informasi sensitif atau pribadi

atau unduh aplikasi yang saya sudah bangun [disini](https://github.com/NewSalman/test-seleksi-enter-komputer/releases)
