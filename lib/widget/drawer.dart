import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../navigate_pages/navigate.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrl = "https://photos.app.goo.gl/8Bk8UAYEkWX28iLHA";
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                accountName: Text("Umakant Patil"),
                accountEmail: Text("umakantpatil2712@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/Umakant_Patil.jpg"),


                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,

              ),
              onTap: () async{
                await Navigator.pushNamed(context, MyRoutes.homeButton);
              },
              title: Text(
                "Home",
                textScaleFactor: 1.1,
                style: TextStyle(
                  color: Colors.white,
                ),

              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.photo,
                color: Colors.white,

              ),
              onTap: ()async {
                print("Gallery");
                await Navigator.pushNamed(context, MyRoutes.galleryButton);
              },
              title: Text(
                "Gallery",
                textScaleFactor: 1.1,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.1,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.phone,
                color: Colors.white,
              ),
              title: Text(
                "Contact us",
                textScaleFactor: 1.1,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
