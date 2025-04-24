import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GirisSayfasi extends StatefulWidget {
  @override
  _GirisSayfasiState createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController sifreController = TextEditingController();
  bool yukleniyor = false;

  Future<void> girisYap() async {
    setState(() {
      yukleniyor = true;
    });

    final response = await http.post(
      Uri.parse('https://reqres.in/api/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': emailController.text,
        'password': sifreController.text,
      }),
    );

    setState(() {
      yukleniyor = false;
    });

    if (response.statusCode == 200) {
      final veri = jsonDecode(response.body);
      final token = veri['token'];
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Giriş başarılı! Token: $token'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushReplacementNamed(context, '/');
    } else {
      final hata = jsonDecode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Hata: ${hata['error']}'),
          backgroundColor: Colors.orange,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Giriş Yap',
          style: TextStyle(
            fontFamily: "MYfont",
            color: Colors.white,
            fontSize: 32,
          ),
        ),

        backgroundColor: Colors.blue.shade800,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              SizedBox(height: 30),
              Image.asset('assets/images/canlogo.png', height: 100),
              SizedBox(height: 40),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'E-posta',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: sifreController,
                decoration: InputDecoration(
                  labelText: 'Şifre',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              SizedBox(height: 30),
              yukleniyor
                  ? CircularProgressIndicator()
                  : SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: girisYap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade800,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Giriş Yap',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: "MYfont",
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
