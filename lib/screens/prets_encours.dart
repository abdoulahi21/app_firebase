import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PretsEncours extends StatefulWidget {
  const PretsEncours({super.key});

  @override
  State<PretsEncours> createState() => _PretsEncoursState();
}

class _PretsEncoursState extends State<PretsEncours> {

  final prets=[];

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('prets').snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return CircularProgressIndicator();
            }
            if(!snapshot.hasData){
              return Text("Pas de données");
            }
            List<dynamic> prets=[];
            snapshot.data!.docs.forEach((element) {
              prets.add(element);
            });
             return Center(
               child: ListView.builder(
                    itemCount: prets.length,
                    itemBuilder: (context,index){
                      final pret=prets[index];
                      final nom=pret['nom'];
                      final produit=pret['produit'];
                      final Timestamp timestamp =pret['date'];
                      final date=DateFormat.yMd().add_jm().format(timestamp.toDate());
                     return  Card(
                       child:  ListTile(
                         title: Text('$nom'),
                         subtitle: Text('$produit, $date'),
                         trailing: Icon(Icons.edit),
                       ),
                     );
                   }
               ),
             );
          }
      )
    );
  }
}
