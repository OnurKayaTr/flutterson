import 'package:flutter/material.dart';
import 'main.dart'; 
import 'package:http/http.dart' as http;
import 'dart:convert';

class FaturaSayfasi extends StatefulWidget {
  @override
  _FaturaSayfasiState createState() => _FaturaSayfasiState();
}

class _FaturaSayfasiState extends State<FaturaSayfasi> {
  List<dynamic> faturalar = [];
  bool yukleniyor = true;

  @override
  void initState() {
    super.initState();
    faturaVerileriniGetir();
  }

  Future<void> faturaVerileriniGetir() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/carts'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        faturalar = data['carts'];
        // Ödenmemiş faturaları en üste al
        faturalar.sort((a, b) {
          bool aOdenmis = a['total'] < 1000; // Örnek kriter
          bool bOdenmis = b['total'] < 1000;
          return aOdenmis == bOdenmis
              ? 0
              : (aOdenmis ? 1 : -1); // Ödenmemişler önce
        });
        yukleniyor = false;
      });
    } else {
      // Hata durumu
      setState(() {
        yukleniyor = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fatura Geçmişi', style: TextStyle(fontFamily: "MYfont")),
        backgroundColor: Colors.blue.shade700,
      ),
      drawer: AppDrawer(),
      body:
          yukleniyor
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: faturalar.length,
                itemBuilder: (context, index) {
                  final fatura = faturalar[index];
                  final odenmis = fatura['total'] < 1000; // Örnek kriter
                  final renk =
                      odenmis ? Colors.green.shade100 : Colors.red.shade100;
                  final durum = odenmis ? 'Ödenmiş' : 'Ödenmemiş';
                  final tarih = DateTime.now().subtract(
                    Duration(days: index * 30),
                  );
                  return Card(
                    color: renk,
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      title: Text(
                        'Fatura Tarihi: ${tarih.day}.${tarih.month}.${tarih.year}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Tutar: ₺${fatura['total']} - Durum: $durum',
                      ),
                      trailing: Icon(
                        odenmis ? Icons.check_circle : Icons.warning,
                        color: odenmis ? Colors.green : Colors.red,
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
