import 'package:flutter/material.dart';
import 'package:splash_intro/utilsconfig.dart';

void main() => runApp(HomeScreen());

class HomeScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: splashScreenAppName,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: appHeaderTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            tooltip: 'Play video',
            onPressed: (){
              print('Settings Pressed');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            drawerHeader(appHeaderUserTitle),
            ListTile(
              title: Text('Link 1'),
              onTap: () {
                print('Link 1 menu item pressed');
              },
            ),
            Divider(),
            ListTile(
              title: Text('Link 2'),
              onTap: () {
                print('Link 2 menu item pressed');
              },
            ),
            Divider(),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Home Screen',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
    );
  }

  Widget drawerHeader(appTitle){
  return UserAccountsDrawerHeader(
    accountName: new Text(appTitle, style: TextStyle(fontSize: 20.0),),
    accountEmail: null,
    currentAccountPicture: new CircleAvatar(
      backgroundImage: new AssetImage(accountHeaderUserIcon),
      backgroundColor: Colors.white,
    ),
  );
}

}