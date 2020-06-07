import '../models/singleState.dart';
import '../enums/viewState.dart';
import '../services/api.dart';
import '../locator.dart';
import 'baseModel.dart';

class StateModel extends BaseModel {

  //get reference to the API singleton object
  API _api = locator<API>();

  List<StateData> stats;
  StateData totalStats;

  Future getStateWiseStats() async {

    setState(ViewState.Busy);     //notifies listeners

    stats = await _api.getStateStats();   //get data from the internet
    totalStats = stats[0];
    stats.removeAt(0);

    //sort the result in ascending order of State Names
    stats.sort((a, b) {
      return a.stateName.toLowerCase().compareTo(b.stateName.toLowerCase());
    });


    setState(ViewState.Idle);     //notifies listeners
  }

//  SortingFunction(Parameter asc){
//    setState as Busy and hence notify Listeners to display the progress bar.
//    if asc==true => sort in ascending order
//    else => sort in descending order
//    setState as Idle and hence notify Listeners to display data.
//  }


  //1. Sort according to number of active cases.
  sortByActive(asc){
    setState(ViewState.Busy);
    if (asc)
    stats.sort((a, b) {
      return int.parse(a.active).compareTo(int.parse(b.active));
    });
    else
      stats.sort((a, b) {
        return int.parse(b.active).compareTo(int.parse(a.active));
      });
    setState(ViewState.Idle);
  }



  //2. Sort according to the names of state.
  sortByName(asc){
    setState(ViewState.Busy);
    if(asc)
    stats.sort((a, b) {
      return a.stateName.compareTo(b.stateName);
    });
    else
      stats.sort((a, b) {
        return b.stateName.compareTo(a.stateName);
      });
    setState(ViewState.Idle);
  }



  //3. Sort according to number of recovered cases.
  sortByRecovered(asc){
    setState(ViewState.Busy);
    if(asc)
    stats.sort((a, b) {
      return int.parse(a.recovered).compareTo(int.parse(b.recovered));
    });
    else
      stats.sort((a, b) {
        return int.parse(b.recovered).compareTo(int.parse(a.recovered));
      });
    setState(ViewState.Idle);
  }



  //4. Sort according to number of confirmed cases.
  sortByConfirmed(asc){
    setState(ViewState.Busy);
    if(asc)
    stats.sort((a, b) {
      return int.parse(a.confirmed).compareTo(int.parse(b.confirmed));
    });
    else
      stats.sort((a, b) {
        return int.parse(b.confirmed).compareTo(int.parse(a.confirmed));
      });
    setState(ViewState.Idle);
  }



  //5. Sort according to number of deaths.
  sortByDeaths(asc){
    setState(ViewState.Busy);
    if(asc)
    stats.sort((a, b) {
      return int.parse(a.deaths).compareTo(int.parse(b.deaths));
    });
    else
      stats.sort((a, b) {
      return int.parse(b.deaths).compareTo(int.parse(a.deaths));
    });
    setState(ViewState.Idle);
  }

}
