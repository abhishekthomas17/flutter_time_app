import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:time_app/pages/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  String time = "Loading...";
  void setUp() async
  {
    WorldTime obj = WorldTime(location:'India',url:'Asia/Kolkata',flag:'dummmy.png');
    await obj.getData();
    Navigator.pushReplacementNamed(context, '/home',arguments:
    {
      'time':obj.time,
      'location':obj.location,
      'flag':obj.flag,
      'isDay':obj.isDay,

    });
  }

  void initState()
  {
    super.initState();
    setUp();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:Center(
        child:SpinKitFadingCircle(
          color: Colors.white,
          size: 70.0,
        ),
      )
    );
  }
}
