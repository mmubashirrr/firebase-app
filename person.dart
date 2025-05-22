
import 'package:firebaseapp/services/database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';


class Userpage extends StatefulWidget {
  const Userpage({super.key});

  @override
  State<Userpage> createState() => _UserpageState();
}

class _UserpageState extends State<Userpage> {
  TextEditingController nameController =  TextEditingController();
  TextEditingController fatherController =  TextEditingController();
  TextEditingController degreeController =  TextEditingController();
  TextEditingController phoneController =  TextEditingController();
  TextEditingController ageController =  TextEditingController();
  TextEditingController locationController =  TextEditingController();
  TextEditingController cityController =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(

          appBar: AppBar(backgroundColor: Colors.blue.shade900,elevation: 10,shadowColor: Colors.blue,
            title: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back,color: Colors.black,),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 20,),
                  Text('USER',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
                  SizedBox(width: 15,),
                  Text(' FORM',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),

              ],
            )
          ),
          body: SingleChildScrollView(scrollDirection: Axis.vertical,
            child: Container(color : Colors.white,padding: EdgeInsets.all(10),child: Column(
              children: [ Text('NAME',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue.shade900)),
              SizedBox(height: 5,),
              Container(decoration:BoxDecoration(border: Border.all(),borderRadius:BorderRadius.circular(12)),child: TextFormField(
                controller: nameController,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Name cannot be empty';
                  }
                  return null;
                },
              ),)
                ,SizedBox(height: 5,),
                Text('FATHER NAME',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue.shade900)),
                SizedBox(height: 5,),
                Container(decoration:BoxDecoration(border: Border.all(),borderRadius:BorderRadius.circular(12)),child: TextFormField(
                  controller: fatherController,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Father cannot be empty';
                    }
                    return null;
                  },
                ),)
                ,SizedBox(height: 5,),
                Text('DEGREE',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue.shade900)),
                SizedBox(height: 5,),
                Container(decoration:BoxDecoration(border: Border.all(),borderRadius:BorderRadius.circular(12)),child: TextFormField(
                  controller: degreeController,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Degree cannot be empty';
                    }
                    return null;
                  },
                ),)
                ,SizedBox(height: 5,),
                Text('PHONE',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue.shade900)),
                SizedBox(height: 5,),
                Container(decoration:BoxDecoration(border: Border.all(),borderRadius:BorderRadius.circular(12)),child:TextFormField(
                  controller: phoneController,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  keyboardType: TextInputType.number, // Restrict keyboard to numbers
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Phone cannot be empty';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Phone must be a number';
                    }
                    return null;
                  },
                ),)
                ,SizedBox(height: 5,),
                Text('AGE',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue.shade900)),
                SizedBox(height: 5,),
                Container(decoration:BoxDecoration(border: Border.all(),borderRadius:BorderRadius.circular(12)),child:TextFormField(
                  controller: ageController,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  keyboardType: TextInputType.number, // Restrict keyboard to numbers
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Age cannot be empty';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Age must be a number';
                    }
                    return null;
                  },
                ),)
              ,SizedBox(height: 5,),
              Text('COUNTRY',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue.shade900)),
              SizedBox(height: 5,),
              Container(decoration:BoxDecoration(border: Border.all(),borderRadius:BorderRadius.circular(12)),child: TextFormField(
                controller: locationController,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Location cannot be empty';
                  }
                  return null;
                },
              ),)

                ,SizedBox(height: 5,),
                Text('CITY',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue.shade900)),
                SizedBox(height: 5,),
                Container(decoration:BoxDecoration(border: Border.all(),borderRadius:BorderRadius.circular(12)),child: TextFormField(
                  controller: cityController,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'CITY cannot be empty';
                    }
                    return null;
                  },
                ),)
                ,SizedBox(height: 5,),


                ElevatedButton(onPressed:()async{
                  if (nameController.text.trim().isEmpty ||
                      ageController.text.trim().isEmpty ||
                      locationController.text.trim().isEmpty||
                      cityController.text.trim().isEmpty ||
                      fatherController.text.trim().isEmpty||
                  degreeController.text.trim().isEmpty||
                      phoneController.text.trim().isEmpty
                  ) {
                    Fluttertoast.showToast(msg: 'Please fill in all fields');
                    return;
                  }
                  String id = randomAlphaNumeric(6);
                  Map<String,dynamic> personinfoMap={
                    'Name' :nameController.text,
                    'Father' :fatherController.text,
                    'Degree' :degreeController.text,
                    'Phone' :phoneController.text,
                    'Age' :ageController.text,
                    'Location ':locationController.text,
                    'City':cityController.text,
                    'id':id
                  };
                  await Databasemethods().addRecord(personinfoMap, id);
                  Fluttertoast.showToast(msg: 'RECORD HAS BEEN ADDED');
                  nameController.clear();
                  fatherController.clear();
                  degreeController.clear();
                  phoneController.clear();
                  ageController.clear();
                  locationController.clear();
                  cityController.clear();

                },style: ElevatedButton.styleFrom(elevation: 10,backgroundColor: Colors.blue.shade900), child: Text('ADD RECORD',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)))

              ],
            ),),
          ),
        ),
      ),
    );
  }
}
