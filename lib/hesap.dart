import 'package:flutter/material.dart';
import 'main.dart'; 
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HesapSayfasi extends StatefulWidget {
  @override
  _HesapSayfasiState createState() => _HesapSayfasiState();
}

class _HesapSayfasiState extends State<HesapSayfasi> {
  final String isim = 'Ahmet Yılmaz';
  final String devreNo = '1234567890';
  final String kullaniciAdi = '259191022402239@canonline';
  final String sifre = 'Sifre2024!';
  bool sifreGizli = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Hesap Bilgileri',
          style: TextStyle(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontFamily: "MYfont",
          ),
        ),

        backgroundColor: Colors.blue.shade700,
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRow(Icons.person, "İsim", isim),
                SizedBox(height: 16),
                _buildRow(Icons.numbers, "XDSL Devre No", devreNo),
                SizedBox(height: 16),
                _buildRow(Icons.alternate_email, "Kullanıcı Adı", kullaniciAdi),
                SizedBox(height: 16),
                Text(
                  "Şifre",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        sifreGizli ? "********" : sifre,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue.shade900,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        sifreGizli ? Icons.visibility : Icons.visibility_off,
                        color: Colors.orange.shade700,
                      ),
                      onPressed: () {
                        setState(() {
                          sifreGizli = !sifreGizli;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRow(IconData icon, String baslik, String deger) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue, size: 28),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              baslik,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            Text(
              deger,
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue.shade900,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
