import 'package:achievement_view/achievement_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/Crud/Show.dart';
import 'package:flutter/material.dart';

import '../Widgets/TextField.dart';
class Insert extends StatefulWidget {
  const Insert({super.key});

  @override
  State<Insert> createState() => _InsertState();
}

class _InsertState extends State<Insert> {
  final email_c=TextEditingController();
  final password=TextEditingController();
  final phone_c=TextEditingController();
  final username_c=TextEditingController();
  final address_c=TextEditingController();
  final key1=GlobalKey<FormState>();
  void addData() async{
   try
       {
         Map<String,dynamic> data={
           "username":username_c.text.toString(),
           "email":email_c.text.toString(),
           "password":password.text.toString(),
           "address":address_c.text.toString(),
           "phone":phone_c.text.toString()
         };
         await FirebaseFirestore.instance.collection("Info").add(data);
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
                  Text('Insert Data',style: TextStyle(
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

                  }, child: Text('Insert'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


