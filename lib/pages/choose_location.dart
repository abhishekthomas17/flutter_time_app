import 'package:flutter/material.dart';
import 'package:time_app/pages/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Kolkata', location: 'India', flag: 'india.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async
  {

    WorldTime obj = locations[index];
    await obj.getData();

    Navigator.pop(context,
        {
          'time':obj.time,
          'location':obj.location,
          'flag':obj.flag,
          'isDay':obj.isDay,

        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title:Text(
        "Choose Location"
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body:Padding(
        padding: const EdgeInsets.fromLTRB(0,10,0,0),
        child: ListView.builder(itemCount:locations.length,itemBuilder: (context,index)
        {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical:2,horizontal: 10),
              child: Card(
                child:ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title:Text(
                    locations[index].location
                  ),
                  leading:CircleAvatar(
                    backgroundImage:AssetImage(
                        'assets/${locations[index].flag}',
                  ),
                )
              )
              ),
            );
        }),
      )
    );
  }
}
