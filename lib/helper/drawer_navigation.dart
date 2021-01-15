import 'package:flutter/material.dart';
import 'package:saku_dompet/view/categories_screen.dart';
import 'package:saku_dompet/view/home_screen.dart';

class DrawerNavigation extends StatefulWidget {
  @override
  _DrawerNavigationState createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://c4.wallpaperflare.com/wallpaper/138/182/484/rx-unicorn-gundam-simple-mobile-suit-gundam-mobile-suit-gundam-unicorn-wallpaper-preview.jpg'),
              ),
              accountName: Text('Nenza Nurfirmansyah'),
              accountEmail: Text('nenzan@compunerd.id'),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen())),
            ),
            ListTile(
              title: Text('Categories'),
              leading: Icon(Icons.view_list),
              onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoriesScreen())),
            )
          ],
        ),
      ),
    );
  }
}
