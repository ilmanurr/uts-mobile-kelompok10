import 'package:flutter/material.dart';


class TombolNext extends StatelessWidget {
  const TombolNext({
    super.key,
    required this.onPressed, // Fungsi yang akan dipanggil ketika tombol ditekan
    required this.label, // Label teks yang ditampilkan pada tombol
  });

  final VoidCallback? onPressed; // Callback yang akan dipanggil ketika tombol ditekan
  final String label; // Label teks yang ditampilkan pada tombol

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed, // Menetapkan fungsi onPressed sebagai fungsi yang akan dipanggil ketika tombol ditekan
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Card(
          // Memberi warna putih pada tombol jika onPressed tidak null (tombol aktif)
          // jika tidak, biarkan kosong (tombol tidak aktif)
          color: onPressed != null ? Colors.white : null,
          child: Center(
            child: Text(
              label, // Menampilkan label teks pada tombol
              style: const TextStyle(
                letterSpacing: 2,
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
