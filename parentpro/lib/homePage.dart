
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:parentpro/drawerWidget.dart';
import 'package:parentpro/singletonChoice.dart';

import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});





  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

  bool isBoy = true;

  @override
  void initState() {
    super.initState();
    isBoy = choiceOfChildBoy;
  }

  final List<Map<String, String>> items = [
    {
      'title': 'Child Education',
      'description': 'Tips and techniques for educating your child effectively.',
      'image': 'assets/education.webp'
    },
    {
      'title': 'Parenting Tips',
      'description': 'Essential tips for modern parents to manage parenting challenges.',
      'image': 'assets/tipsImage.jpeg'
    },
    {
      'title': 'Nutrition Advice',
      'description': 'Guidelines and tips for a balanced diet for your child.',
      'image': 'assets/nutrition.webp'
    },
    {
      'title': 'Activities and Games',
      'description': 'Fun and educational activities to engage your child.',
      'image': 'assets/games.jpeg'
    },
    {  'title': 'Tech and Gadgets',
      'description': 'Latest technology and gadgets to assist in parenting.',
      'image': 'assets/technologie.jpeg'
    },
    {
      'title': 'Behavior Management',
      'description': 'Strategies to manage and improve your child\'s behavior.',
      'image': 'assets/behavor.jpeg'
    },
    {
      'title': 'Health and Safety',
      'description': 'Important information to keep your child safe and healthy.',
      'image': 'assets/safety.jpeg'
    },
    {
      'title': 'Sleep Training',
      'description': 'Techniques to help your child develop healthy sleep habits.',
      'image': 'assets/sleep.webp'
    },
    // Ajoutez d'autres éléments ici
  ];

  @override
  Widget build(BuildContext context) {
   return WillPopScope(
        onWillPop: () async => false,
        child:
     Scaffold(
      backgroundColor: isBoy ? Colors.blue.shade100 : Colors.pink.shade100,
      appBar: AppBar(

        title: Text('Home'),
        backgroundColor: isBoy ? Colors.blue : Colors.pink,
      ),
       drawer: AppDrawer(isBoy: isBoy),
      body:
          Column(
            children: [
              Text("heloo"),
              Expanded(
                child:

                ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return FadeInUp(
                      delay: Duration(milliseconds: 100 * index),
                      child: Card(
                        margin: EdgeInsets.all(10.0),
                        child: ListTile(
                          leading: Image.asset(
                            items[index]['image']!,
                            width: 100,
                            height: 100,
                          ),
                          title: Text(
                            items[index]['title']!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isBoy ? Colors.blue.shade900 : Colors.pink.shade900,
                            ),
                          ),
                          subtitle: Text(items[index]['description']!),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          )

     )
   );
  }
}