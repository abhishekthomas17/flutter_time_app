import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location;
  String time;
  String flag;
  String url;
  bool isDay;

  Future<void> getData() async
  {

    try {
      Response response = await get(
          "http://www.worldtimeapi.org/api/timezone/$url");

      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'];
      int hours = int.parse(offset.substring(1, 3));
      int minutes = int.parse(offset.substring(4, 6));

      DateTime now = DateTime.parse(datetime);
      if(offset.substring(0,1) == "-")
      {
      now = now.subtract(Duration(hours: hours, minutes: minutes));
      }

      else
        {
          now = now.add(Duration(hours: hours, minutes: minutes));
        }

      time = DateFormat.jm().format(now);
      isDay = now.hour > 6 && now.hour <20 ? true : false;
    }

    catch(e)
    {
      time = "Could Not Get Time";
    }

  }

  WorldTime({this.location,this.flag,this.url});

}
