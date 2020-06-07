//data model to hold the statistics of a state

class StateData {
  String active;
  String confirmed;
  String deaths;
  String updatedTime;
  String recovered;
  String stateName;
  String stateCode;

  //constructor
  StateData(
      {this.active,
      this.confirmed,
      this.deaths,
      this.updatedTime,
      this.recovered,
      this.stateName,
      this.stateCode});

  //convert JSON data to object model
  StateData.fromJSON(Map<String, dynamic> json) {
    active = json['active'];
    confirmed = json['confirmed'];
    deaths = json['deaths'];
    updatedTime = json['lastupdatedtime'];
    recovered = json['recovered'];
    stateName = json['state'];
    stateCode = json['statecode'];
  }

  //convert object model to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['confirmed'] = this.confirmed;
    data['deaths'] = this.deaths;
    data['lastupdatedtime'] = this.updatedTime;
    data['recovered'] = this.recovered;
    data['state'] = this.stateName;
    data['statecode'] = this.stateCode;
    return data;
  }

  //string representation of the model
  @override
  String toString() {
    return 'SingleState{active: $active, confirmed: $confirmed, deaths: $deaths, updatedTime: $updatedTime, recovered: $recovered, stateName: $stateName, stateCode: $stateCode}\n';
  }
}
