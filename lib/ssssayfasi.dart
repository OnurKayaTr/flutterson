import 'package:flutter/material.dart';
import 'main.dart'; // AppDrawer için

class SSSSayfasi extends StatelessWidget {
  final List<SSSSoruCevap> sorular = [
    SSSSoruCevap(
      soru: 'İnternet neden yavaş?',
      cevap:
          'Yoğun kullanım saatlerinde hız düşebilir. Eğer uzun süre düzelmez ise. Destek ekibimiz ile iletişime geçebilirsiniz.',
    ),
    SSSSoruCevap(
      soru: 'Faturamı nasıl ödeyebilirim?',
      cevap:
          'Online işlem merkezinden veya mobil uygulamamızdan ödeme yapabilirsiniz. Detaylı bilgi için Muhasabe ile görüşebilirsiniz.',
    ),
    SSSSoruCevap(
      soru: 'Destek ekibine nasıl ulaşırım?',
      cevap:
          'Destek sayfasından telefon, e-posta veya WhatsApp üzerinden ulaşabilirsiniz.',
    ),
    SSSSoruCevap(
      soru: 'Modem ayarlarımı nasıl yaparım?',
      cevap:
          'DSL altyapılarda Modem kurulumu gerekmektedir modeminizin modeline göre internet üzerinde araştırma yapabilirsiniz.',
    ),
    SSSSoruCevap(
      soru:
          'Kurulum taksitlerim bitmeden aboneliğimi iptal ettirdiğimde kurulum ücreti faturama nasıl yansır?',
      cevap:
          'Taahhütsüz paketlerde aboneliğin kurulum taksitleri bitmeden herhangi bir sebeple, müşteri tarafından yahut müşteriden kaynaklanan bir nedenle Cannet tarafından feshedilmesi halinde kurulum ücretinin kalan taksitleri faturaya yansıtılır.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SIK SORULAN SORULAR',
          style: TextStyle(
            fontSize: 24,
            fontFamily: "MYfont",
            color: Colors.blue,
          ),
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        elevation: 2,
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: sorular.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ExpansionTile(
                leading: Icon(Icons.question_answer, color: Colors.orange),
                title: Text(
                  sorular[index].soru,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(sorular[index].cevap),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class SSSSoruCevap {
  final String soru;
  final String cevap;

  SSSSoruCevap({required this.soru, required this.cevap});
}
