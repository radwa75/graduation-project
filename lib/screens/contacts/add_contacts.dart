// ignore_for_file: unnecessary_this, prefer_conditional_assignment, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sasa/screens/contacts/contactsm.dart';
import 'package:sasa/screens/contacts/db_services.dart';

import 'package:sqflite/sqflite.dart';

import 'contacts_page.dart';


class AddContactsPage extends StatefulWidget {
  const AddContactsPage({super.key});

  @override
  State<AddContactsPage> createState() => _AddContactsPageState();
}

class _AddContactsPageState extends State<AddContactsPage> {
  DatabaseHelper databasehelper = DatabaseHelper();
  List<TContact>? contactList;
  int count = 0;

  void showList() {
    Future<Database> dbFuture = databasehelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<TContact>> contactListFuture =
          databasehelper.getContactList();
      contactListFuture.then((value) {
        setState(() {
          this.contactList = value;
          this.count = value.length;
        });
      });
    });
  }

  void deleteContact(TContact contact) async {
    int result = await databasehelper.deleteContact(contact.id);
    if (result != 0) {
      Fluttertoast.showToast(msg: "contact removed succesfully");
      showList();
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showList();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (contactList == null) {
      contactList = [];
    }
    return SafeArea(
      child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              ElevatedButton(
                // Use ElevatedButton for a standard button
                onPressed: () async {
                  bool result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactsPage(),
                    ),
                  );
                  if (result == true) {
                    showList();
                  }
                },
                child: Text('Add Trusted Contacts',style: GoogleFonts.rem(
    textStyle: TextStyle(color: Colors.black, letterSpacing: 2,fontWeight: FontWeight.bold,fontSize: 15),
  )), // Set the button text
              ),
              Expanded(
                child: ListView.builder(
                  // shrinkWrap: true,
                  itemCount: count,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(contactList![index].name),
                          trailing: SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () async {
                                      await FlutterPhoneDirectCaller.callNumber(
                                          contactList![index].number);
                                    },
                                    icon: const Icon(
                                      Icons.call,
                                      color: Colors.greenAccent,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      deleteContact(contactList![index]);
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Color.fromARGB(255, 255, 155, 148),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}
