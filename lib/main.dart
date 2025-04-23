import 'package:flutter/material.dart';
import 'hesap.dart';
import 'ayarlar.dart';
import 'destek.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CANNET ANA SAYFA',

      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/bills': (context) => DummyPage(title: 'Faturaları Görüntüle'),
        '/account': (context) => HesapSayfasi(),
        '/settings': (context) => DummyPage(title: 'Ayarlar'),
        '/support': (context) => DestekSayfasi(),
      },
    );
  }
}

//onur
class HomeScreen extends StatelessWidget {
  final String fullName = "Ahmet Yılmaz";
  final String serviceNumber = "1234567890";
  final double currentDebt = 150.75;
  final List<String> internetPackages = [
    "100 Mbps Limitsiz - 200 TL",
    "50 Mbps 200 GB - 150 TL",
    "25 Mbps 100 GB - 100 TL",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ANA SAYFA',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 30,
                fontFamily: "MYfont",
                color: Colors.blue,
              ),
            ),
          ],
        ),
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            UserInfoCard(fullName: fullName, serviceNumber: serviceNumber),
            SizedBox(height: 16),
            DebtCard(debt: currentDebt),
            SizedBox(height: 16),
            PackageList(packages: internetPackages),
            SizedBox(height: 16),
            SpeedTestSection(),
          ],
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Menü',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //SizedBox(height: 12),
                Image.asset(
                  'assets/images/canlogo.png',
                  height: 75,
                  width: 230,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),

          ListTile(
            leading: Icon(Icons.home),
            title: Text('Ana Sayfa'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: Icon(Icons.receipt),
            title: Text('Faturaları Görüntüle'),
            onTap: () {
              Navigator.pushNamed(context, '/bills');
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Hesap Bilgileri'),
            onTap: () {
              Navigator.pop(context); // Drawer False
              Navigator.pushNamed(context, '/account');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Ayarlar'),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
          ListTile(
            leading: Icon(Icons.support),
            title: Text('Destek'),
            onTap: () {
              Navigator.pushNamed(context, '/support');
            },
          ),
        ],
      ),
    );
  }
}

class DummyPage extends StatelessWidget {
  final String title;

  DummyPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: AppDrawer(),
      body: Center(
        child: Text(
          '$title Sayfası (Geliştirilecek)',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class UserInfoCard extends StatelessWidget {
  final String fullName;
  final String serviceNumber;

  UserInfoCard({required this.fullName, required this.serviceNumber});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("$fullName"),
        subtitle: Text("Hizmet No: $serviceNumber"),
        leading: Icon(Icons.person),
      ),
    );
  }
}

class DebtCard extends StatelessWidget {
  final double debt;

  DebtCard({required this.debt});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("Borçlarım"),
        subtitle: Text("Güncel Borç: ₺${debt.toStringAsFixed(2)}"),
        leading: Icon(Icons.money_off),
      ),
    );
  }
}

class PackageList extends StatelessWidget {
  final List<String> packages;

  PackageList({required this.packages});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text("Paket Bilgileri"),
        children: packages.map((pkg) => ListTile(title: Text(pkg))).toList(),
      ),
    );
  }
}

class SpeedTestSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("Hız Testi"),
        subtitle: Text("İnternet hızınızı test etmek için tıklayın."),
        leading: Icon(Icons.speed),
        trailing: ElevatedButton(
          child: Text("Test Et"),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Hız testi başlatılıyor...")),
            );
          },
        ),
      ),
    );
  }
}
