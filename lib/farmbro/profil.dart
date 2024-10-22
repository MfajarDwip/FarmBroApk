import 'package:farmbroapk/farmbro/ubahPassword.dart';
import 'package:farmbroapk/resource/color/mycolor.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Menggunakan Stack untuk menempatkan gambar profil di tengah, setengah di luar dan setengah di dalam
          Stack(
            clipBehavior: Clip.none, // Agar gambar bisa keluar dari container
            alignment: Alignment.center, // Memastikan gambar berada di tengah
            children: [
              // Bagian background header
              Container(
                width: screenSize.width,
                height: screenSize.height * 0.20,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/coba.png'), fit: BoxFit.cover),
                  color: navbar,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 40.0), // Posisi dari atas
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: -50, // Posisi gambar profil
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(
                      'assets/cuy.png'), // Ganti dengan path foto profil
                ),
              ),

              Positioned(
                bottom: -120, // Sesuaikan posisi teks dari gambar profil
                child: Column(
                  children: [
                    Text(
                      'Fadias Keyn', // Nama user
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Owner', // Teks role/jabatan
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 160), // Jarak setelah foto profil

          // Bagian informasi profil
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // Nomor telepon
                ListTile(
                  leading: Icon(Icons.phone, color: Colors.brown),
                  title: Text('+6285859714058'),
                  tileColor: Color(0xFFFDEFE3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(height: 15),
                // Email
                ListTile(
                  leading: Icon(Icons.email, color: Colors.brown),
                  title: Text('fadiaskeyn@gmail.com'),
                  tileColor: Color(0xFFFDEFE3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(height: 15),
                // Tombol ubah password
                ListTile(
                  leading: Icon(Icons.lock, color: Colors.brown),
                  title: Text('Ubah Password'),
                  tileColor: Color(0xFFFDEFE3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UbahPassword(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          Spacer(),

          // Tombol keluar akun

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                // Aksi saat tombol keluar akun ditekan
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonhapus, // Warna tombol
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  'KELUAR AKUN',
                  style: TextStyle(
                    color: Colors.white,
                    // color: const Color.fromARGB(255, 233, 0, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 20), // Jarak dari tombol keluar ke bottom
        ],
      ),
    );
  }
}
