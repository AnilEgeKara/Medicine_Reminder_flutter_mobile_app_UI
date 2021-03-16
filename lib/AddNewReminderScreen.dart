import 'package:flutter/material.dart';
import 'package:healt_app/HomeScreen.dart';
import 'package:intl/intl.dart';

class AddNewReminderScreen extends StatefulWidget {
  @override
  _AddNewReminderScreenState createState() => _AddNewReminderScreenState();
}
DateTime now = DateTime.now();

class _AddNewReminderScreenState extends State<AddNewReminderScreen> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay _time = TimeOfDay(hour: int.parse(DateFormat('kk').format(now)), minute: int.parse(DateFormat('mm').format(now)));
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
  void _selectTime() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag:'herotag',
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("Add Reminder",style: TextStyle(color: Colors.black),),
          centerTitle: true,
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 34,vertical: 20),
              child: TextFormField(
                cursorColor: Theme.of(context).cursorColor,
                initialValue: '',
                maxLength: 60,
                minLines: 2,
                maxLines: 3,
                decoration: InputDecoration(
                  fillColor: Color(0xffe4e4e4),
                  filled: true,
                  labelText: 'Information of reminder',
                  labelStyle: TextStyle(
                    color: Color(0xff334473),
                  ),
                  helperText: 'Name of medicine or other related information',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff334473)),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 34,vertical: 20),
              child: TextFormField(
                cursorColor: Theme.of(context).cursorColor,
                initialValue: '',
                maxLength: 20,
                decoration: InputDecoration(
                  fillColor: Color(0xffe4e4e4),
                  filled: true,
                  labelText: 'Type of your medicine',
                  labelStyle: TextStyle(
                    color: Color(0xff334473),
                  ),
                  helperText: 'Pills , Creams , Injections etc ..',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff334473)),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 34,vertical: 20),
              child: TextFormField(
                cursorColor: Theme.of(context).cursorColor,
                initialValue: '',
                maxLength: 20,
                decoration: InputDecoration(
                  fillColor: Color(0xffe4e4e4),
                  filled: true,
                  labelText: 'Interval',
                  labelStyle: TextStyle(
                    color: Color(0xff334473),
                  ),
                  helperText: 'Once a week , every day , after breakfast',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff334473)),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                _selectDate(context);
              },
              child: Container(
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 48),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Color(0xff111840),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Color(0xfffbcb43),
                      ),
                      child: Center(child: Text('Pick a date',style: TextStyle(fontSize: 18,color: Color(0xff111840),fontWeight: FontWeight.w600),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4,right:32.0),
                      child: Container(width:100,child: Center(child: Text('${selectedDate.toLocal()}'.split(' ')[0],style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w600),))),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                _selectTime();
              },
              child: Container(
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 48,vertical: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Color(0xff111840),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Color(0xfffbcb43),
                      ),
                      child: Center(child: Text('Pick a Time',style: TextStyle(fontSize: 18,color: Color(0xff111840),fontWeight: FontWeight.w600),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4,right:32.0),
                      child: Container(width:100,child: Center(child: Text('${_time.format(context)}',style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w600),))),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30,),
            InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Color(0xfffbcb43),
                    ),
                    child: Center(child: Text('Submit',style: TextStyle(fontSize: 18,color: Color(0xff111840),fontWeight: FontWeight.w600),)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

