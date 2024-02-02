import 'package:cats_ca/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CatsDrawer extends StatefulWidget {
  const CatsDrawer({super.key});

  @override
  State<CatsDrawer> createState() => _CatsDrawerState();
}

class _CatsDrawerState extends State<CatsDrawer> {
  @override
  Widget build(BuildContext context) {
     return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountEmail: const Text('best cats here!'),
            currentAccountPicture: Image.asset('assets/images/pet-love.png'),
            accountName: const Text(
              'My cats app',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            decoration: const BoxDecoration(color: CustomColors.accentColor),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Facts about cats'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.shuffle),
            title: const Text('Get random cat'),
            onTap: () {
              // Random random = Random();
              // int randomCat = random.nextInt(8);
            },
          ),
        ],
      ),
    );
  }
}