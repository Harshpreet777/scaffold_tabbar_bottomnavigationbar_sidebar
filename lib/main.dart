import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Scaffold Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  static const List<Widget> widgetList = <Widget>[
    Text('Home'),
    Text('Search'),
    Text('Message')
  ];
  void onItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.person),
              ),
              Tab(
                icon: Icon(Icons.people),
              ),
              Tab(
                icon: Icon(Icons.emoji_people),
              ),
            ]),
          ),
          drawer: Drawer(
            child: ListView(
              children: const [
                DrawerHeader(child: Text('Header')),
                ListTile(
                  title: Text('Title 1'),
                ),
                ListTile(
                  title: Text('Title 2'),
                ),
                ListTile(
                  title: Text('Title 3'),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'SEARCH'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message), label: 'MESSAGE'),
              // BottomNavigationBarItem(icon: Icon(Icons.message), label: ''),
            ],
            iconSize: 30,
            backgroundColor: Colors.black,
            currentIndex: selectedIndex,
            elevation: 30,
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.blue,
            unselectedIconTheme: const IconThemeData(color: Colors.black),
            type: BottomNavigationBarType.shifting,
            onTap: onItemTap,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widgetList.elementAt(selectedIndex),
                ],
              ),
            ),
          ),
        ));
  }
}
