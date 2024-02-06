import 'package:cats_ca/core/route/router.dart';
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
            currentAccountPicture: Image.asset('assets/pet-love.png'),
            accountName: const Text(
              'My cats app',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            decoration: const BoxDecoration(color: CustomColors.accentColor),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              router.go('/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favourite cats'),
            onTap: () {
              Navigator.pop(context);
              router.go('/favourite');
            },
          ),
          ListTile(
            leading: const Icon(Icons.shuffle),
            title: const Text('Cats by different merits'),
            onTap: () {
              Navigator.pop(context);
              router.go('/categories');
            },
          ),
        ],
      ),
    );
  }
}
