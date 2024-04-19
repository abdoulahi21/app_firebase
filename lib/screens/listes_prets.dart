import 'package:firebase/screens/prets_encours.dart';
import 'package:firebase/screens/prets_termines.dart';
import 'package:flutter/material.dart';

class ListesPrets extends StatefulWidget {
  const ListesPrets({super.key});

  @override
  State<ListesPrets> createState() => _ListesPretsState();
}

class _ListesPretsState extends State<ListesPrets> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length:2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "En cours",
               ),
              Tab(
                text: "Terminés",
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
             PretsEncours(),
             PretsTermines()
          ],
        ),
      ),
    );
  }
}
