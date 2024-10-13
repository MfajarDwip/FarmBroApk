import 'package:farmbroapk/util/reusable/color.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                width: screenSize.width,
                height: screenSize.height * 0.20,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/coba.png'),
                      fit: BoxFit.cover
                  ),
                  color: navbar,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: const Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 40.0),
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
              const Positioned(
                bottom: -50,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(
                      'assets/cuy.png'
                  )
                ),
              ),
              const Positioned(
                bottom: -120,
                child: Column(
                  children: [
                    Text(
                      'Fadias Keyn',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Owner',
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

          const SizedBox(height: 160),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
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
                ListTile(
                  leading: Icon(Icons.lock, color: Colors.brown),
                  title: Text('Ubah Password'),
                  tileColor: Color(0xFFFDEFE3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onTap: () {
                  },
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonhapus, // Warna tombol
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Center(
                child: Text(
                  'KELUAR AKUN',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
