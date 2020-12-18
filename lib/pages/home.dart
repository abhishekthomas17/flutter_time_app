import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Home> {

  Map data = {};


  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String bgimage = data['isDay']? 'day.png' : 'night.png';
    Color bgcolor = data['isDay']? Colors.blue : Colors.indigo[700];
    Color textcolor = data['isDay']? Colors.grey[850] : Colors.grey[500];


    return Scaffold(
      backgroundColor: bgcolor,
      body:SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image : DecorationImage(
              image:AssetImage('assets/$bgimage'),
              fit:BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120,0,0),
            child: Column(
             children: [
               FlatButton.icon(
                   onPressed: () async {
                    dynamic result =  await Navigator.pushNamed(context,'/location');
                    setState(() {
                        data={
                          'time':result['time'],
                          'location':result['location'],
                          'flag':result['flag'],
                          'isDay':result['isDay'],
                        };
                    });
                   },
                   icon: Icon(
                     Icons.edit_location,
                         color:Colors.grey[300],
                   ),
                   label: Text(
                       "Edit Location",
                     style:TextStyle(
                        color:Colors.grey[300],
                       fontSize:18,
                   )
                   ),
               ),

               SizedBox(height:50),

               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children:[

                   Text(
                       data['location'],
                     style:TextStyle(
                       fontSize: 30,
                       letterSpacing: 2.0,
                       fontWeight: FontWeight.bold,
                         color:textcolor

                     )
                   ),

                 ]
               ),

               SizedBox(height:30),

               Text(
                 data['time'],
                 style:TextStyle(

                   fontSize: 55,
                     fontWeight: FontWeight.bold,
                     color:textcolor
                 )
               )

             ],

            ),
          ),
        ),
      )
    );
  }
}
