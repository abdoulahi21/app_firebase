
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
class AddPretsPage extends StatefulWidget {
  const AddPretsPage({super.key});

  @override
  State<AddPretsPage> createState() => _AddPretsPageState();
}

class _AddPretsPageState extends State<AddPretsPage> {

  final _formKey = GlobalKey<FormState>();
  final clientNameController= TextEditingController();
  final produitNameController= TextEditingController();
  final prixController= TextEditingController();
  DateTime selectedDate = DateTime.now();
  final etatController= 'en cours';
  @override
  void dispose() {
    clientNameController.dispose();
    produitNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child:  Column(
          children:[
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child:  TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nom du Client',
                  hintText: 'Entrer le nom du client',
                  hintStyle: TextStyle(color: Colors.grey),
                  labelStyle:TextStyle(fontSize: 23),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'S\'il vous plait Entrer le nom du client';
                  }
                  return null;
                },
                controller: clientNameController,
              ),
            ),
            DateTimeField(
              padding: EdgeInsets.only(bottom: 10),
              decoration: const InputDecoration(
                hintText: 'YYYY/MM/DD',
                hintStyle: TextStyle(color: Colors.black45),
                errorStyle: TextStyle(color: Colors.redAccent),
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.event_note),
                labelStyle:TextStyle(fontSize: 23),
                labelText: 'Enter Date',
              ),
              value: selectedDate,
              mode: DateTimeFieldPickerMode.dateAndTime,
              onChanged: (DateTime? value) {
                setState(() {
                  selectedDate = value!;
                });
              },
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20, right: 10),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey),
                        labelStyle:TextStyle(fontSize: 23),
                        labelText: "Nom Produits",
                        hintText: "Nom du produit",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: produitNameController,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20, left: 10),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey),
                        labelStyle:TextStyle(fontSize: 23),
                        labelText: "Prix",
                        hintText: "Prix du produit",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: prixController,
                    ),
                  ),
                ),
                SizedBox(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20, left: 10),
                        child:
                      ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor:MaterialStatePropertyAll(Colors.deepPurpleAccent),
                          ),
                          onPressed:(){
                            },
                          child: Container(child: Icon(Icons.add,color: Colors.white,),)
                      ),
                    )
                )
              ],
            ),
            Center(
              child: Row(
                children: [
                  SizedBox(
                   //width: double.infinity,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                         // backgroundColor:MaterialStatePropertyAll(Colors.blue)
                        ),
                      onPressed:(){
                           if(_formKey.currentState!.validate()) {
                             final clientName = clientNameController.text;
                             final produitName = produitNameController.text;
                             final prix = int.parse(prixController.text);
                             FocusScope.of(context).requestFocus(FocusNode());
                             //ajout dans la base de donnes
                             FirebaseFirestore.instance.collection('prets').add({
                             'nom': clientName,
                             'produit': produitName,
                             'date': selectedDate,
                             'prix': prix,
                             'etat': etatController
                             });
                           }
                           clientNameController.clear();
                           produitNameController.clear();
                           prixController.clear();
                        },

                      child: Text("Ajouter"),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
