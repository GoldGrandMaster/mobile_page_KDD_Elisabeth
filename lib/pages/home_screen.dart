import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kdd_health/pages/finance.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  static const List<Widget> _pages = <Widget>[
    FinanceWidget(),
    Icon(
      Icons.camera,
      size: 150,
    ),
    Icon(
      Icons.chat,
      size: 150,
    ),
    Icon(
      Icons.camera,
      size: 150,
    ),
    Icon(
      Icons.chat,
      size: 150,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String searchValue = '';
  final List<String> _suggestions = [
    'Hospital1',
    'Hospital2',
  ];

  Future<List<String>> _fetchSuggestions(String searchValue) async {
    await Future.delayed(const Duration(milliseconds: 750));

    return _suggestions.where((element) {
      return element.toLowerCase().contains(searchValue.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EasySearchBar(
            title: const Text('Tagesauslastung'),
            foregroundColor: Colors.white,
            backgroundColor: Theme.of(context).secondaryHeaderColor,
            onSearch: (value) => setState(() => searchValue = value),
            actions: [
              IconButton(icon: const Icon(Icons.person), onPressed: () {})
            ],
            asyncSuggestions: (value) async => await _fetchSuggestions(value)),
        drawer: Drawer(
            child: ListView(padding: EdgeInsets.zero, children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).secondaryHeaderColor,
            ),
            child: Text('Elisabeth'),
          ),
          ListTile(
              title: const Text('Finanzen'),
              onTap: () => Navigator.pop(context)),
          ListTile(
              title: const Text('Anaylize'),
              onTap: () => Navigator.pop(context))
        ])),
        body: Center(
          child: _pages.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 60.0,
          // ignore: prefer_const_literals_to_create_immutables
          items: <Widget>[
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: FaIcon(
                FontAwesomeIcons.bed,
                size: 24,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: FaIcon(
                FontAwesomeIcons.sitemap,
                size: 24,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: FaIcon(
                FontAwesomeIcons.server,
                size: 24,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: FaIcon(
                FontAwesomeIcons.qrcode,
                size: 24,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: FaIcon(
                FontAwesomeIcons.circleQuestion,
                size: 24,
                color: Colors.white,
              ),
            ),
          ],
          color: Theme.of(context).secondaryHeaderColor,
          buttonBackgroundColor: Theme.of(context).secondaryHeaderColor,
          backgroundColor: Theme.of(context).backgroundColor,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: _onItemTapped,
          letIndexChange: (index) => true,
        ));
  }
}
