import 'package:achievement_view/achievement_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/Crud/Show.dart';
import 'package:flutter/material.dart';

import '../Widgets/TextField.dart';
class Update extends StatefulWidget {
  String username1;
  String address1;
  String password1;
  String email1;
  String phone1;
  var id;


  Update({required this.username1, required this.address1, required this.password1, required this.email1,required this.phone1,required this.id});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  final email_c=TextEditingController();
  final password=TextEditingController();
  final phone_c=TextEditingController();
  final username_c=TextEditingController();
  final address_c=TextEditingController();
  final key1=GlobalKey<FormState>();
  var id1;
  Future<void> addData() async{
    try
    {
      Map<String,dynamic> data={
        "username":username_c.text.toString(),
        "email":email_c.text.toString(),
        "password":password.text.toString(),
        "address":address_c.text.toString(),
        "phone":phone_c.text.toString()
      };
      // await FirebaseFirestore.instance.collection("Info").add(data);
      await FirebaseFirestore.instance.collection('Info').doc(id1).update(data);
      AchievementView(
        title: "Data Insert",
        color: Colors.green,
        icon: Icon(Icons.emoji_emotions),

      ).show(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Show(),));
    }
    catch(e)
    {
      AchievementView(
        title: "Data Not Insert",
        color: Colors.red,
        icon: Icon(Icons.dangerous),

      ).show(context);
    }

  }
  @override
  void initState() {
    username_c.text=widget.username1;
    phone_c.text=widget.phone1;
    address_c.text=widget.address1;
    email_c.text=widget.email1;
    password.text=widget.password1;
    id1=widget.id;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: key1,
              child: Column(
                children: [
                  SizedBox(height: 40,),
                  Text('Update Data',style: TextStyle(
                      color: Colors.purple,
                      fontSize: 40
                  ),),
                  SizedBox(height: 30,),
                  CustomTextField(
                    validator1: (value1)
                    {
                      if(value1==null||value1=='')
                      {
                        return "Please fill this field";
                      }
                    },
                    isShow: false,
                    controller1: username_c,
                    hintText1: "Enter your username",
                    lable1: "Username",
                    icon1: Icons.verified_user,
                  ),
                  SizedBox(height: 20,),
                  CustomTextField(
                    validator1: (value1)
                    {
                      if(value1==null||value1=='')
                      {
                        return "Please fill this field";
                      }
                    },
                    isShow: false,
                    controller1: phone_c,
                    hintText1: "Enter your phone",
                    lable1: "Phone",
                    icon1: Icons.phone,
                  ),
                  SizedBox(height: 20,),
                  CustomTextField(
                    validator1: (value1)
                    {
                      if(value1==null||value1=='')
                      {
                        return "Please fill this field";
                      }
                    },
                    isShow: false,
                    controller1: address_c,
                    hintText1: "Enter your address",
                    lable1: "Address",
                    icon1: Icons.home,
                  ),
                  SizedBox(height: 20,),

                  CustomTextField(
                    validator1: (value1)
                    {
                      if(value1==null||value1=='')
                      {
                        return "Please fill this field";
                      }
                    },
                    isShow: false,
                    controller1: email_c,
                    hintText1: "Enter your Email",
                    lable1: "Email",
                    icon1: Icons.alternate_email,
                  ),
                  SizedBox(height: 20,),
                  CustomTextField(
                    validator1: (value1)
                    {
                      if(value1==null||value1=='')
                      {
                        return "Please fill this field";
                      }
                    },
                    isShow: true,
                    controller1: password,
                    hintText1: "Enter your Password",
                    lable1: "Password",
                    icon1: Icons.password,
                  ),
                  SizedBox(height: 40,),
                  ElevatedButton(onPressed: (){
                    if(key1.currentState!.validate())
                    {
                      addData();

                    }

                  }, child: Text('Update'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



