import 'package:flutter/material.dart';
import 'package:flutter_bottom_nav/screens/home_page.dart';
import 'package:flutter_bottom_nav/screens/profile.dart';
import 'package:flutter_bottom_nav/screens/settings.dart';

class CScaffold extends StatefulWidget {
  const CScaffold({
    Key? key,
  }) : super(key: key);

  @override
  State<CScaffold> createState() => _CScaffoldState();
}

class _CScaffoldState extends State<CScaffold> {
  int _selectedIndex = 0;
  void onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> widgedList = [
    HomePage(),
    Profile(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: onItemTap,
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        child: Drawer(
          backgroundColor: Color.fromARGB(255, 114, 135, 143),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.12,
                child: DrawerHeader(
                    child: Center(
                  child: Text(
                    "Navigation",
                    style: TextStyle(fontSize: 30),
                  ),
                )),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.settings))
        ],

        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.),
        // ),
        title: Text("This is app bar"),
      ),
      body: widgedList[_selectedIndex],
    );
  }
}
