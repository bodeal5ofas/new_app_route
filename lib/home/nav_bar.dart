import 'package:flutter/material.dart';
import 'package:news_app/home/home_view.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Center(
              child: Text(
                'News App!',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.menu),
            title: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeView(),
                      ));
                },
                child: Text(
                  'Categories',
                  style: Theme.of(context).textTheme.titleLarge,
                )),
          ),
        ],
      ),
    );
  }
}
