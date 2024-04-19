import 'package:flutter/material.dart';
import 'package:firebase/screens/add_prets_page.dart';
import 'package:firebase/screens/home_page.dart';
import 'package:firebase/screens/listes_prets.dart';

class ControllePage extends StatefulWidget {
  const ControllePage({super.key});

  @override
  State<ControllePage> createState() => _ControllePageState();
}

class _ControllePageState extends State<ControllePage> {

  int _selectedIndex = 0;
  @override
  SetCurrentIndex(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: [
            Text('Accueil'),
            Text('Gestions des prets'),
            Text('Formulaire d\'ajout d\'un nouveau prets'),
          ][_selectedIndex],
        ),
        body: [
          HomePage(),
          ListesPrets(),
          AddPretsPage()
        ][_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: SetCurrentIndex,
          selectedItemColor: Colors.deepPurpleAccent,
          iconSize: 40,
          elevation: 10,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Listes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Nouveau',
            ),
          ],
        ),
      ),
    );
  }
}
