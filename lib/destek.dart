import 'package:flutter/material.dart';
import 'main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DestekSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.left,
              'DESTEK',
              style: TextStyle(
                fontSize: 28,
                fontFamily: "MYfont",
                color: Colors.blue,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        elevation: 2,
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SupportCard(
              icon: Icons.phone,
              title: "CAN TELEKOM",
              detail: "+90 272 333 33 33",
              color: Colors.blue,
            ),
            SupportCard(
              icon: Icons.email,
              title: "Teknik E-Mail",
              detail: "destek@cantelekom.com",
              color: Colors.orange,
            ),
            SupportCard(
              icon: FontAwesomeIcons.whatsapp,

              title: "Teknik WhatsApp",
              detail: "+90 533 554 18 24",
              color: Colors.green,
            ),
            SupportCard(
              icon: Icons.email_outlined,
              title: "Muhasebe E-Mail",
              detail: "muhasebe@cantelekom.com",
              color: Colors.orange,
            ),
            SupportCard(
              icon: Icons.message,
              title: "Muhasebe WhatsApp",
              detail: "+90 530 991 62 26",
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

class SupportCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String detail;
  final Color color;

  SupportCard({
    required this.icon,
    required this.title,
    required this.detail,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: color, size: 30),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(detail, style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
