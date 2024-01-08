import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/Crud/Update.dart';
import 'package:flutter/material.dart';
class Show extends StatefulWidget {
  const Show({super.key});

  @override
  State<Show> createState() => _ShowState();
}

class _ShowState extends State<Show> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Info').snapshots(),
        builder: (context, snapshot) {
          var lenght=snapshot.data!.docs.length;
          return ListView.builder(
            itemCount: lenght,
            itemBuilder: (context, index) {
            String username_value=snapshot.data!.docs[index]['username'];
            String phone_value=snapshot.data!.docs[index]['phone'];
            String address_value=snapshot.data!.docs[index]['address'];
            String email_value=snapshot.data!.docs[index]['email'];
            String password_value=snapshot.data!.docs[index]['password'];
            var id=snapshot.data!.docs[index].id;
            return SizedBox(
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('$username_value',style: TextStyle(
                              color: Colors.purple,
                              fontSize: 30
                          ),),
                          Text('$phone_value',style: TextStyle(
                              color: Colors.purple,
                              fontSize: 30
                          ),),
                          Text('$address_value',style: TextStyle(
                              color: Colors.purple,
                              fontSize: 30
                          ),),
                          Text('$email_value',style: TextStyle(
                              color: Colors.purple,
                              fontSize: 30
                          ),),
                          Text('$password_value',style: TextStyle(
                              color: Colors.purple,
                              fontSize: 30
                          ),),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(onPressed: () async{
                             await FirebaseFirestore.instance.collection('Info').doc(id).delete();

                          }, icon: Icon(Icons.delete)),
                          SizedBox(width: 10,),
                          IconButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Update(username1: username_value, address1: address_value, password1: password_value, email1: email_value, phone1:password_value, id: id,)));
                          }, icon: Icon(Icons.edit)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },);
        },
      )
    );
  }
}
