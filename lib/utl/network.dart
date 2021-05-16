import 'package:http/http.dart'as http;
import 'dart:async';
import 'dart:convert';


String url ='http://34.245.91.5:3000/api/getPlayedLo/5e2d42d67c8c2b282d99040c/en?fbclid=IwAR1efNhCet8dvPREdkYScAEp5R1YJ7dDa0DMiM1XlzXzfc3Wz26vNgKWEps#';

class NetworkHelper{
  Future fetchData() async{
    final response = await http.get(url);
    if (response.statusCode == 200) {
    var jsonData = json.decode(response.body);
    return jsonData;
  }else {
      throw Exception('Unexpected error occured!');
    }

  }
}
