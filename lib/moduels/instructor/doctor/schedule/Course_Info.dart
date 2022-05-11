import 'package:flutter/material.dart';

class CourseInfo extends StatefulWidget {
  const CourseInfo({Key? key}) : super(key: key);

  @override
  State<CourseInfo> createState() => _CourseInfoState();
}

class _CourseInfoState extends State<CourseInfo> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
          title:const Text('Student Schedule')
      ),

      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
            padding: EdgeInsets.all(0.0),
            children: <Widget>[
             const UserAccountsDrawerHeader(
                accountName: Text('mokh',style:TextStyle(
                  color: Colors.blue
                ),),
                accountEmail: Text('mokh@gmail.com',style:TextStyle(
                    color: Colors.blue
                ),),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.black,
                  maxRadius: 20.0,
                  backgroundImage: AssetImage('lib/shared/pecture/Doctor.png',),
                ),
                decoration: BoxDecoration(
                    color: Color(0xffC5C5C5),
                ),),

              ListTile(
                title: Text('Student Schedule'),
                leading: Icon(Icons.person),
                onLongPress: (){},
              ),

              Divider(),


              ListTile(
                title: Text('Materials'),
                leading: Icon(Icons.book),
              ),

              ListTile(
                title: Text('tasks'),
                leading: Icon(Icons.assignment),
                onLongPress: (){},
              ),


              ListTile(
                title:const Text('quiz'),
                leading: Icon(Icons.assignment),
                onLongPress: (){},
              ),

              Divider(),

              ListTile(
                  title: Text('Close '),
                  leading: Icon(Icons.close),
                  onTap: (){
                    Navigator.of(context).pop();}
              ),
            ]
        ),
      ),
    );
  }
}
