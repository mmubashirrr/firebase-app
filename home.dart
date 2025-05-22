
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseapp/person.dart';
import 'package:firebaseapp/services/database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Stream? personStream;
  getpersonload()async{
    personStream = await Databasemethods().getpersondata();
    setState(() {

    });
  }
  TextEditingController nameController =  TextEditingController();
  TextEditingController fatherController =  TextEditingController();
  TextEditingController degreeController =  TextEditingController();
  TextEditingController phoneController =  TextEditingController();
  TextEditingController ageController =  TextEditingController();
  TextEditingController locationController =  TextEditingController();
  TextEditingController cityController =  TextEditingController();

  @override
  void initState() {
    getpersonload();
    super.initState();
  }
  Widget allpersondata(){
   return StreamBuilder(  stream:personStream ,builder: (context,AsyncSnapshot snapshot){
     return snapshot.hasData?ListView.builder(itemCount: snapshot.data!.docs.length ,
         itemBuilder: (context,index){
           DocumentSnapshot ds = snapshot.data!.docs[index];
           return  Container(margin: EdgeInsets.only(bottom: 7),
             child: Material(elevation: 7,shadowColor: Colors.blue,
                      child: Container(width: MediaQuery.of(context).size.width,
             decoration: BoxDecoration(color: Colors.blue.shade900,borderRadius: BorderRadius.circular(12)),
             child: Column(crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ Text("Name :" +ds["Name"],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
                  GestureDetector(child: Icon(Icons.edit,color: Colors.white,
                  )
                  ,onTap: (){
                      nameController.text=ds['Name'];
                      fatherController.text=ds['Father'];
                      degreeController.text=ds['Degree'];
                      phoneController.text=ds['Phone'];
                      ageController.text=ds['Age'];
                      locationController.text=ds['Location '];
                      cityController.text=ds['City'];
                      editdetail(ds['id']);
                    },),
                    GestureDetector(child: Icon(Icons.delete,color: Colors.red,
                    )
                      ,onTap: ()async{
                      await Databasemethods().deluserinfo(ds['id']);
                      Fluttertoast.showToast(msg: 'RECORD HAS BEEN DELETED');

                      },)],
                ),
                 Text('Father :'+ds['Father'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
                 Text('Degree :'+ds['Degree'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
                 Text('Phone :'+ds['Phone'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
                 Text('Age :'+ds['Age'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
                 Text('Location :'+ds['Location '],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
                 Text('City :'+ds['City'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
               ],
             ),
                      ),
                    ),
           );
         }):Container();

   }
   );

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(backgroundColor: Colors.white,
          floatingActionButton: FloatingActionButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Userpage()));
          },
           child: Icon(Icons.add,color: Colors.blue.shade900,),),
          appBar: AppBar(backgroundColor: Colors.blue.shade900,
            title: Row(
              children: [
                Text('MY',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
                SizedBox(width: 20,),
                Text('DATA BASE',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
              ],

            ),elevation: 10,shadowColor: Colors.blue,
          ),
          body: Container(margin: EdgeInsets.only(left: 15,right: 15,top: 15),
              child: Column(
            children: [
              Expanded(child: allpersondata())
            ],

          )),
        ),
      ),

    );
  }
  Future editdetail(String id)=>showDialog(context: context, builder:( context)=>AlertDialog(
      content : SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Container(child:Column(
          children: [
            Row(
              children: [
                GestureDetector(child: Icon(Icons.cancel_outlined),
                    onTap: (){
        
                  Navigator.pop(context);
                })
                ,Text(' EDIT',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
                Text(' DETAILS',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
              ],
            ),
            Text('NAME',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue.shade900)),
            SizedBox(height: 5,),
            Container(decoration:BoxDecoration(border: Border.all(),borderRadius:BorderRadius.circular(12)),child: TextFormField(
              controller: nameController,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),

            ),)
            ,SizedBox(height: 5,),
    SizedBox(height: 5,),
      Text('FATHER',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue.shade900)),
      SizedBox(height: 5,),
      Container(decoration:BoxDecoration(border: Border.all(),borderRadius:BorderRadius.circular(12)),child:TextFormField(
        controller: fatherController,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        keyboardType: TextInputType.number, // Restrict keyboard to numbers

      ),),SizedBox(height: 5,),

    SizedBox(height: 5,),
    Text('DEGREE',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue.shade900)),
    SizedBox(height: 5,),
    Container(decoration:BoxDecoration(border: Border.all(),borderRadius:BorderRadius.circular(12)),child:TextFormField(
      controller:degreeController,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      keyboardType: TextInputType.number, // Restrict keyboard to numbers

    ),),SizedBox(height: 5,),

    Text('PHONE',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue.shade900)),
    SizedBox(height: 5,),
    Container(decoration:BoxDecoration(border: Border.all(),borderRadius:BorderRadius.circular(12)),child:TextFormField(
      controller: phoneController,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      keyboardType: TextInputType.number, // Restrict keyboard to numbers

    ),),SizedBox(height: 5,),
            Text('AGE',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue.shade900)),
            SizedBox(height: 5,),
            Container(decoration:BoxDecoration(border: Border.all(),borderRadius:BorderRadius.circular(12)),child:TextFormField(
              controller: ageController,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              keyboardType: TextInputType.number, // Restrict keyboard to numbers

            ),)
            ,SizedBox(height: 5,),
            Text('COUNTRY',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue.shade900)),
            SizedBox(height: 5,),
            Container(decoration:BoxDecoration(border: Border.all(),borderRadius:BorderRadius.circular(12)),child: TextFormField(
              controller: locationController,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),

            ),
            ),
    SizedBox(height: 5,),
    Text('CITY',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue.shade900)),
    SizedBox(height: 5,),
    Container(decoration:BoxDecoration(border: Border.all(),borderRadius:BorderRadius.circular(12)),child: TextFormField(
      controller: cityController,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),

    ),)
    ,SizedBox(height: 5,),
            ElevatedButton(onPressed:()async{
        
              Map<String,dynamic> personupdateMap={
                'Name' :nameController.text,
                'Father' :fatherController.text,
                'Degree' :degreeController.text,
                'Phone' :phoneController.text,
                'Age' :ageController.text,
                'Location ':locationController.text,
                'City':cityController.text,
                'id':id
              };
              await Databasemethods().updateuserinfo(id,personupdateMap).then((onValue)=>Navigator.pop(context));
              Fluttertoast.showToast(msg: 'RECORD HAS BEEN UPDATED');
            },style: ElevatedButton.styleFrom(elevation: 10,backgroundColor: Colors.blue.shade900), child: Text('EDIT RECORD',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)))
          ],
        )),
      )


  ));

}
