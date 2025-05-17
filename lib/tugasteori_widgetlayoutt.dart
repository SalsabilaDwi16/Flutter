import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() => runApp(MyPinterestApp());

class MyPinterestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pinterest Clone',
      home: PinterestHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PinterestHomePage extends StatelessWidget {
  final List<String> images = List.generate(
    20,
    (index) => 'https://picsum.photos/200/300?random=$index',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pinterest'),
        backgroundColor: const Color.fromARGB(255, 255, 4, 4),
actions: [
  PopupMenuButton<String>(
    offset: const Offset(0, 50), // Geser ke bawah 50px
    onSelected: (value) {
      if (value == 'add') {
        print('Tambahkan Akun diklik');
        // Arahkan ke halaman tambah akun
      } else if (value == 'logout') {
        print('Logout diklik');
        // Proses logout
      }
    },
    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
      PopupMenuItem<String>(
        value: 'user',
        enabled: false,
        child: ListTile(
          leading: Icon(Icons.person),
          title: Text('Nama Pengguna: Salsabila Dwi Kamila Putri'), 
        )
      ),
      const PopupMenuDivider(),
      const PopupMenuItem<String>(
        value: 'add',
        child: ListTile(
          leading: Icon(Icons.person_add),
          title: Text('Tambahkan Akun'),
        ) 
      ),
      const PopupMenuItem<String>(
        value: 'logout',
        child: ListTile(
          leading: Icon(Icons.logout),
          title: Text('Keluar'),
        ) 
      ),
    ],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/0/08/Pinterest-logo.png', // Ganti dengan URL profil kamu
                ),
                radius: 18,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MasonryGridView.count(
          crossAxisCount: 4,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                images[index],
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}