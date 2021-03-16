import 'package:flutter/material.dart';
import 'package:healt_app/AddNewReminderScreen.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReminderObject {
  final String info;
  final String type;
  final String interval;
  final String date;
  final String time;

  ReminderObject({this.info,this.type,this.interval,this.date,this.time});
}
List<ReminderObject> ReminderObjectList = [ReminderObject(info:'info',type:'type',interval:'interval',date:'date',time: 'time')];

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

DateTime now = DateTime.now();
DateTime now_minos1 = DateTime.now().subtract(new Duration(days: 1));
DateTime now_minos2 = DateTime.now().subtract(new Duration(days: 2));
DateTime now_minos3 = DateTime.now().subtract(new Duration(days: 3));
DateTime now_plus1 = DateTime.now().add(new Duration(days: 1));
DateTime now_plus2 = DateTime.now().add(new Duration(days: 2));
DateTime now_plus3 = DateTime.now().add(new Duration(days: 3));
String formattedDate = DateFormat('kk:mm').format(now);
String formattedDate2 = DateFormat('MMMM dd, yy').format(now);
String MName = DateFormat('MMMM').format(now);
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        heroTag: 'herotag',
        onPressed: () async {
          await Navigator.of(context).pushNamed('/AddNewReminderScreen');
        },
        elevation: 24,
        child: FaIcon(FontAwesomeIcons.plus,color: Colors.white,),
        backgroundColor: Color(0xff766FB3)
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(MName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
                Divider(thickness: 1,height: 1,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(DateFormat('E').format(now_minos3),style: TextStyle(color: Colors.black87,fontSize: 18),),
                          Text(DateFormat('dd').format(now_minos3)),
                        ],
                      ),
                      Column(
                        children: [
                          Text(DateFormat('E').format(now_minos2),style: TextStyle(color: Colors.black87,fontSize: 18),),
                          Text(DateFormat('dd').format(now_minos2)),
                        ],
                      ),
                      Column(
                        children: [
                          Text(DateFormat('E').format(now_minos1),style: TextStyle(color: Colors.black87,fontSize: 18),),
                          Text(DateFormat('dd').format(now_minos1)),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 2,horizontal: 12),
                        decoration: BoxDecoration(
                          color: Color(0xff2E2959),
                          borderRadius: BorderRadius.all(Radius.circular(30))
                        ),
                        child:
                          Column(
                            children: [
                              Text(DateFormat('E').format(now),style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                              Text(DateFormat('dd').format(now),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                            ],
                          ),
                      ),
                      Column(
                        children: [
                          Text(DateFormat('E').format(now_plus1),style: TextStyle(color: Colors.black87,fontSize: 18),),
                          Text(DateFormat('dd').format(now_plus1)),
                        ],
                      ),
                      Column(
                        children: [
                          Text(DateFormat('E').format(now_plus2),style: TextStyle(color: Colors.black87,fontSize: 18),),
                          Text(DateFormat('dd').format(now_plus2)),
                        ],
                      ),
                      Column(
                        children: [
                          Text(DateFormat('E').format(now_plus3),style: TextStyle(color: Colors.black87,fontSize: 18),),
                          Text(DateFormat('dd').format(now_plus3)),
                        ],
                      ),
                    ],
                  ),
                )
              ]),
            ),
            SliverGrid.count(
              crossAxisCount: 1,
              childAspectRatio: 2,
              children:
                /*ReminderObjectList.map((currentObject) {
                  Row(
                   //key: '1',
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Card(
                        color: Color(0xff453a8e),
                        child: Container(
                          height: MediaQuery.of(context).size.width*0.45,
                          width: MediaQuery.of(context).size.width*0.45,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:16,top:16,right: 16),
                                child: Row(
                                  children: [
                                    Card(
                                      elevation: 0,
                                      color: Colors.white38,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: FaIcon(FontAwesomeIcons.solidBell,color: Colors.white,),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 8),
                                      child: Text(formattedDate,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w900),),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:20,top: 4),
                                child: Text(formattedDate2,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:20,top: 8),
                                child: Text('ToDay',style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:20,top: 12),
                                child: Text(currentObject.info,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w300),),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.width*0.45,
                        width: MediaQuery.of(context).size.width*0.45,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 30,
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                color: Color(0xff334473),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 30,
                                    padding: EdgeInsets.symmetric(horizontal: 8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                      color: Color(0xfffbcb43),
                                    ),
                                    child: Center(child: Text('Once A Week',style: TextStyle(fontSize: 14,color: Color(0xff111840),fontWeight: FontWeight.w600),)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4,right:12.0),
                                    child: Center(child: Text('Pill',style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w600),)),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 35,
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                color: Color(0xff334473),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('time is approaching ',style: TextStyle(color: Colors.white),),
                                ],
                              ),
                            ),
                            Container(
                              height: 35,
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                color: Color(0xff334473),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('Mark as done',style: TextStyle(color: Colors.white),),
                                  FaIcon(FontAwesomeIcons.check,color: Colors.white,size: 18,),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }).toList(),*/
              [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xff2E2959),
                            borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        height: MediaQuery.of(context).size.width*0.45,
                        width: MediaQuery.of(context).size.width*0.45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:16,top:16,right: 16),
                              child: Row(
                                children: [
                                  Card(
                                    elevation: 0,
                                    color: Colors.white38,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: FaIcon(FontAwesomeIcons.solidBell,color: Colors.white,),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 8),
                                    child: Text(formattedDate,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w900),),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:20,top: 4),
                              child: Text(formattedDate2,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:20,top: 8),
                              child: Text('Yesterday',style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:20,top: 12),
                              child: Text('Vitamins',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w300),),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width*0.45,
                      width: MediaQuery.of(context).size.width*0.45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: MediaQuery.of(context).size.width*0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              color: Color(0xff2E2959),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 30,
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                    color: Color(0xfffbcb43),
                                  ),
                                  child: Center(child: Text('Every Day',style: TextStyle(fontSize: 14,color: Color(0xff111840),fontWeight: FontWeight.w600),)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4,right:12.0),
                                  child: Center(child: Text('Pill',style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w600),)),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 35,
                            width: MediaQuery.of(context).size.width*0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              color: Color(0xffC43C44),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('It is late !!!',style: TextStyle(color: Colors.white),),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width*0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              color: Color(0xffC43C44),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 30,
                                  width: MediaQuery.of(context).size.width*0.3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                    color: Color(0xff0B842C),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width*0.2,
                                        height: 30,
                                        padding: EdgeInsets.symmetric(horizontal: 8),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(30)),
                                          color: Color(0xfffbcb43),
                                        ),
                                        child: Center(child: Text('Mark as',style: TextStyle(fontSize: 14,color: Color(0xff111840),fontWeight: FontWeight.w600),)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4,right:12.0),
                                        child: FaIcon(FontAwesomeIcons.check,color: Colors.white,size: 18,),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4,right:12.0),
                                  child: FaIcon(FontAwesomeIcons.trash,color: Colors.white,size: 18,),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),

                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xff2E2959),
                            borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        height: MediaQuery.of(context).size.width*0.45,
                        width: MediaQuery.of(context).size.width*0.45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:16,top:16,right: 16),
                              child: Row(
                                children: [
                                  Card(
                                    elevation: 0,
                                    color: Colors.white38,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: FaIcon(FontAwesomeIcons.solidBell,color: Colors.white,),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 8),
                                    child: Text(formattedDate,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w900),),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:20,top: 4),
                              child: Text(formattedDate2,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:20,top: 8),
                              child: Text('ToDay',style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:20,top: 12),
                              child: Text('Do not forget to take pills for your heart',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w300),),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width*0.45,
                      width: MediaQuery.of(context).size.width*0.45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: MediaQuery.of(context).size.width*0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              color: Color(0xff2E2959),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 30,
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                    color: Color(0xfffbcb43),
                                  ),
                                  child: Center(child: Text('Every Day',style: TextStyle(fontSize: 14,color: Color(0xff111840),fontWeight: FontWeight.w600),)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4,right:12.0),
                                  child: Center(child: Text('Pill',style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w600),)),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 35,
                            width: MediaQuery.of(context).size.width*0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              color: Color(0xff2E2959),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('time is approaching ',style: TextStyle(color: Colors.white),),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width*0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              color: Color(0xffC43C44),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 30,
                                  width: MediaQuery.of(context).size.width*0.3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                    color: Color(0xff0B842C),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width*0.2,
                                        height: 30,
                                        padding: EdgeInsets.symmetric(horizontal: 8),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(30)),
                                          color: Color(0xfffbcb43),
                                        ),
                                        child: Center(child: Text('Mark as',style: TextStyle(fontSize: 14,color: Color(0xff111840),fontWeight: FontWeight.w600),)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4,right:12.0),
                                        child: FaIcon(FontAwesomeIcons.check,color: Colors.white,size: 18,),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4,right:12.0),
                                  child: FaIcon(FontAwesomeIcons.trash,color: Colors.white,size: 18,),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),

                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xff2E2959),
                            borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        height: MediaQuery.of(context).size.width*0.45,
                        width: MediaQuery.of(context).size.width*0.45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:16,top:16,right: 16),
                              child: Row(
                                children: [
                                  Card(
                                    elevation: 0,
                                    color: Colors.white38,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: FaIcon(FontAwesomeIcons.solidBell,color: Colors.white,),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 8),
                                    child: Text(formattedDate,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w900),),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:20,top: 4),
                              child: Text(formattedDate2,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:20,top: 8),
                              child: Text('Tomorrow',style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:20,top: 12),
                              child: Text('apply cream on your arm',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w300),),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width*0.45,
                      width: MediaQuery.of(context).size.width*0.45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: MediaQuery.of(context).size.width*0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              color: Color(0xff2E2959),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 30,
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                    color: Color(0xfffbcb43),
                                  ),
                                  child: Center(child: Text('Every Day',style: TextStyle(fontSize: 14,color: Color(0xff111840),fontWeight: FontWeight.w600),)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4,right:12.0),
                                  child: Center(child: Text('Cream',style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w600),)),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 35,
                            width: MediaQuery.of(context).size.width*0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              color: Color(0xff2E2959),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('time is approaching ',style: TextStyle(color: Colors.white),),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width*0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              color: Color(0xffC43C44),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 30,
                                  width: MediaQuery.of(context).size.width*0.3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                    color: Color(0xff0B842C),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width*0.2,
                                        height: 30,
                                        padding: EdgeInsets.symmetric(horizontal: 8),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(30)),
                                          color: Color(0xfffbcb43),
                                        ),
                                        child: Center(child: Text('Mark as',style: TextStyle(fontSize: 14,color: Color(0xff111840),fontWeight: FontWeight.w600),)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4,right:12.0),
                                        child: FaIcon(FontAwesomeIcons.check,color: Colors.white,size: 18,),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4,right:12.0),
                                  child: FaIcon(FontAwesomeIcons.trash,color: Colors.white,size: 18,),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xff2E2959),
                            borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        height: MediaQuery.of(context).size.width*0.45,
                        width: MediaQuery.of(context).size.width*0.45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:16,top:16,right: 16),
                              child: Row(
                                children: [
                                  Card(
                                    elevation: 0,
                                    color: Colors.white38,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: FaIcon(FontAwesomeIcons.solidBell,color: Colors.white,),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 8),
                                    child: Text(formattedDate,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w900),),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:20,top: 4),
                              child: Text(formattedDate2,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:20,top: 8),
                              child: Text('Yesterday',style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:20,top: 12),
                              child: Text('Vitamins',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w300),),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width*0.45,
                      width: MediaQuery.of(context).size.width*0.45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: MediaQuery.of(context).size.width*0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              color: Color(0xff2E2959),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 30,
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                    color: Color(0xfffbcb43),
                                  ),
                                  child: Center(child: Text('Every Day',style: TextStyle(fontSize: 14,color: Color(0xff111840),fontWeight: FontWeight.w600),)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4,right:12.0),
                                  child: Center(child: Text('Pill',style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w600),)),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 35,
                            width: MediaQuery.of(context).size.width*0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              color: Color(0xffC43C44),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('It is late !!!',style: TextStyle(color: Colors.white),),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width*0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              color: Color(0xffC43C44),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 30,
                                  width: MediaQuery.of(context).size.width*0.3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                    color: Color(0xff0B842C),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width*0.2,
                                        height: 30,
                                        padding: EdgeInsets.symmetric(horizontal: 8),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(30)),
                                          color: Color(0xfffbcb43),
                                        ),
                                        child: Center(child: Text('Mark as',style: TextStyle(fontSize: 14,color: Color(0xff111840),fontWeight: FontWeight.w600),)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4,right:12.0),
                                        child: FaIcon(FontAwesomeIcons.check,color: Colors.white,size: 18,),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4,right:12.0),
                                  child: FaIcon(FontAwesomeIcons.trash,color: Colors.white,size: 18,),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),

                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xff2E2959),
                            borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        height: MediaQuery.of(context).size.width*0.45,
                        width: MediaQuery.of(context).size.width*0.45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:16,top:16,right: 16),
                              child: Row(
                                children: [
                                  Card(
                                    elevation: 0,
                                    color: Colors.white38,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: FaIcon(FontAwesomeIcons.solidBell,color: Colors.white,),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 8),
                                    child: Text(formattedDate,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w900),),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:20,top: 4),
                              child: Text(formattedDate2,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:20,top: 8),
                              child: Text('ToDay',style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:20,top: 12),
                              child: Text('Do not forget to take pills for your heart',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w300),),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width*0.45,
                      width: MediaQuery.of(context).size.width*0.45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: MediaQuery.of(context).size.width*0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              color: Color(0xff2E2959),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 30,
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                    color: Color(0xfffbcb43),
                                  ),
                                  child: Center(child: Text('Every Day',style: TextStyle(fontSize: 14,color: Color(0xff111840),fontWeight: FontWeight.w600),)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4,right:12.0),
                                  child: Center(child: Text('Pill',style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w600),)),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 35,
                            width: MediaQuery.of(context).size.width*0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              color: Color(0xff2E2959),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('time is approaching ',style: TextStyle(color: Colors.white),),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width*0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              color: Color(0xffC43C44),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 30,
                                  width: MediaQuery.of(context).size.width*0.3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                    color: Color(0xff0B842C),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width*0.2,
                                        height: 30,
                                        padding: EdgeInsets.symmetric(horizontal: 8),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(30)),
                                          color: Color(0xfffbcb43),
                                        ),
                                        child: Center(child: Text('Mark as',style: TextStyle(fontSize: 14,color: Color(0xff111840),fontWeight: FontWeight.w600),)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4,right:12.0),
                                        child: FaIcon(FontAwesomeIcons.check,color: Colors.white,size: 18,),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4,right:12.0),
                                  child: FaIcon(FontAwesomeIcons.trash,color: Colors.white,size: 18,),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),

                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xff2E2959),
                            borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        height: MediaQuery.of(context).size.width*0.45,
                        width: MediaQuery.of(context).size.width*0.45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:16,top:16,right: 16),
                              child: Row(
                                children: [
                                  Card(
                                    elevation: 0,
                                    color: Colors.white38,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: FaIcon(FontAwesomeIcons.solidBell,color: Colors.white,),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 8),
                                    child: Text(formattedDate,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w900),),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:20,top: 4),
                              child: Text(formattedDate2,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:20,top: 8),
                              child: Text('Tomorrow',style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:20,top: 12),
                              child: Text('apply cream on your arm',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w300),),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width*0.45,
                      width: MediaQuery.of(context).size.width*0.45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: MediaQuery.of(context).size.width*0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              color: Color(0xff2E2959),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 30,
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                    color: Color(0xfffbcb43),
                                  ),
                                  child: Center(child: Text('Every Day',style: TextStyle(fontSize: 14,color: Color(0xff111840),fontWeight: FontWeight.w600),)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4,right:12.0),
                                  child: Center(child: Text('Cream',style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w600),)),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 35,
                            width: MediaQuery.of(context).size.width*0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              color: Color(0xff2E2959),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('time is approaching ',style: TextStyle(color: Colors.white),),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width*0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              color: Color(0xffC43C44),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 30,
                                  width: MediaQuery.of(context).size.width*0.3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                    color: Color(0xff0B842C),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width*0.2,
                                        height: 30,
                                        padding: EdgeInsets.symmetric(horizontal: 8),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(30)),
                                          color: Color(0xfffbcb43),
                                        ),
                                        child: Center(child: Text('Mark as',style: TextStyle(fontSize: 14,color: Color(0xff111840),fontWeight: FontWeight.w600),)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4,right:12.0),
                                        child: FaIcon(FontAwesomeIcons.check,color: Colors.white,size: 18,),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4,right:12.0),
                                  child: FaIcon(FontAwesomeIcons.trash,color: Colors.white,size: 18,),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ]
            ),
          ],
        ),
      ),
    );
  }
}
