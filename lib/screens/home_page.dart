import 'package:flutter/material.dart';

import 'add_prets_page.dart';
 class HomePage extends StatefulWidget {
   const HomePage({super.key});
 
   @override
   State<HomePage> createState() => _HomePageState();
 }
 
 class _HomePageState extends State<HomePage> {
   @override
   Widget build(BuildContext context) {
     return const Center(
       child:  Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text("Asynconf 2024",
             style: TextStyle(
                 fontSize: 42,
             ),),
           Text("Bienvenue sur la plateforme de gestion des prets d'argent",
             style: TextStyle(
                 fontSize: 23
             ),
           ),
           Padding(padding: EdgeInsets.only(top: 20)),
         ],
       ),);
   }
 }
 