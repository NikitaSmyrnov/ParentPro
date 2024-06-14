import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final bool isBoy; // Add any necessary parameters here

  const AppDrawer({
    Key? key,
    required this.isBoy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: isBoy ? Colors.blue : Colors.pink,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              // Update UI based on drawer item tap
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              // Update UI based on drawer item tap
              Navigator.pop(context); // Close the drawer
            },
          ),
          // Add more list tiles or widgets as needed
        ],
      ),
    );
  }
}
