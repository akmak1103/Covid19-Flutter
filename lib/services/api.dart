import 'dart:convert';
import '../models/singleState.dart';

import 'package:http/http.dart' as http;

class API {
  //website for fetching data
  static const endpoint = 'https://api.covid19india.org';

  var client = new http.Client();

  //send request via http client
  Future<List<StateData>> getStateStats() async {
    var stateWiseStats = List<StateData>();
    var response = await client.get('$endpoint/data.json');

    //parse JSON data to get the list of stateWise stats
    var parsed = json.decode(response.body)['statewise'] as List<dynamic>;

    //add each state's data to the list
    for (var state in parsed) {
      stateWiseStats.add(StateData.fromJSON(state));
    }

    //remove unassigned state's data
    stateWiseStats.removeWhere((element) => element.stateCode == "UN");

    return stateWiseStats;
  }
}
