import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lms/moduels/instructor/doctor/schedule/Course_Info.dart';
import 'package:lms/services/Doctor/Get_Schedule.dart';

void main() => runApp(new MainApp());



class PageOne extends StatefulWidget {
  String? accounttype;
  String? companyname;
  String? username;
  String? password;
  PageOne({
    this.accounttype,
    this.companyname,
    this.password,
    this.username,
  });


  @override
  State<PageOne> createState() => _PageOneState();
}


class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff030629),
      appBar: AppBar(
        backgroundColor: const Color(0xff030629),
        title: Text(" Home ",style: TextStyle(color: Colors.white),),
      ),
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your Company Is : " + widget.companyname.toString(),style: TextStyle(color: Colors.white),),
            Text("And Your Are - " +
                widget.accounttype.toString() +
                " -  In This Company ",
              style: TextStyle(color: Colors.white),),
          ],
        ),
      ),


    );
  }
}

class PageTwo extends StatefulWidget {
  String? accounttype;
  String? companyname;
  String? username;
  String? password;
  PageTwo({
    this.accounttype,
    this.companyname,
    this.password,
    this.username,
  });
  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  List<dynamic>?  data ;
  void initState()  {
    super.initState();
    Future (() async {
     data = await AllSchedule().Get_All_Schedule(
          accounttype: widget.accounttype!,
          companyname: widget.companyname!,
          password: widget.password!,
          username: widget.username!);

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: const Color(0xff030629),
      appBar: AppBar(backgroundColor: const Color(0xff030629),title: Text(" Schedules ",style: TextStyle(color: Colors.white),),),
      body:GridView.count(
        scrollDirection:Axis.vertical,

          crossAxisCount: 2,
          children:
            List.generate(2, (index){
              return  GestureDetector(
                onTap: (){
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder:(context){
                      return CourseInfo();
                    }));
                  });

                },
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Card(
                    child: Center(
                      child: ListTile(
                        title: Text(data![0]["instructor_schedule_name"],textAlign: TextAlign.center, ),
                      ),
                    ),
                    elevation: 8,
                    shadowColor: Colors.green,
                    shape: CircleBorder(side: BorderSide(width: 5, color: Colors.indigo),
                    ),
                  ),
                ),
              );

            })


          // children:  [
          //
          //
          // ],
          // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2,
          //     crossAxisSpacing: 50,
          // )
      ),




    );
  }
}

class PageThree extends StatefulWidget {

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff030629),
      appBar: AppBar(
        backgroundColor: const Color(0xff030629),
        title: Text(" Profile ",style: TextStyle(color: Colors.white),),
      ),
      body:
      Center(
        child: Column(
          children: [
          ],
        ),
      ),


    );
  }
}

class MainApp extends StatefulWidget {
  String? accounttype;
  String? companyname;
  String? username;
  String? password;
  MainApp({
    this.accounttype,
    this.companyname,
    this.password,
    this.username,
  });
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {


  Widget getPage(int index) {
    switch (index){
      case 0:
        return PageOne(accounttype: widget.accounttype,companyname: widget.companyname,username: widget.username,password: widget.password,);
      case 1:
        return PageTwo(accounttype: widget.accounttype,companyname: widget.companyname,username: widget.username,password: widget.password,);
      case 2:
        return PageThree();
      default:
        return PageOne();
    }
  }

  int _currentIndex = 0;

  onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return  WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: getPage(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.table_view_outlined),label: 'Schedule'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),label: 'profile'),
          ],
          onTap: onTabTapped,
          currentIndex: _currentIndex,
        ),
      ),
    );
  }
}



// Padding(
//   padding: EdgeInsets.all(5.0),
//   child: Card(
//     child: Center(
//       child: ListTile(
//         title: Text("Schedule Name",textAlign: TextAlign.center, ),
//       ),
//     ),
//     elevation: 8,
//     shadowColor: Colors.green,
//     shape: CircleBorder(side: BorderSide(width: 5, color: Colors.indigo),
//     ),
//   ),
// ),

// MaterialButton(onPressed: ()async{
//
//     List<dynamic>  data =await AllSchedule().Get_All_Schedule(accounttype:widget.accounttype!,companyname:widget.companyname! ,password:widget.password! ,username:widget.username! );
//     Navigator.push(context, MaterialPageRoute(builder:(context){
//       return CourseInfo();
//     }));
//
// },color: Colors.white,),

