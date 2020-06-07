import 'package:flutter/material.dart';
import '../widgets/mainCards.dart';
import '../../ui/helpers.dart';
import '../../ui/widgets/statsTable.dart';
import '../widgets/header.dart';
import '../../enums/viewState.dart';
import '../../viewModels/state_model.dart';
import './base_view.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    //get media query data for current device
    var mediaQuery = MediaQuery
        .of(context)
        .size;
    var height = mediaQuery.height;


    return BaseView<StateModel>(

      //fetch data from internet
      onModelReady: (model) => model.getStateWiseStats(),

      //build UI
      builder: (context, model, child) =>

          //use SafeArea to prevent distortions due to notch and notification bar
          SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[

                    //application header
                    Header.header(model, mediaQuery),

                    //check if the state is busy
                    //if yes, show the progress indicator
                    //otherwise display data

                    model.state == ViewState.Busy
                        ? Center(child: CircularProgressIndicator())
                        : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Total Statistics',
                          style: UIHelpers.headingStyle(30.0),),
                        Padding(
                          padding: const EdgeInsets.all(8.0),

                          //display total stats of India
                          child: totalStatsTable(height, model),

                        ),
                        Text('Last updated on: '+model.totalStats.updatedTime,style: UIHelpers.headingStyle(10.0),),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child:Text('StateWise Data',style: UIHelpers.headingStyle(30.0),),
                        ),
                        Card(
                            elevation: 10,
                            margin: EdgeInsets.all(1),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(5, 5, 0, 10),

                              //table to display stateWise stats
                              child: StateWiseStats.statsTable(model.stats),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }

  Widget totalStatsTable(height,model) {
    NumberFormat numberFormat = NumberFormat("##,###", "en_US");
    return Table(
      children: [
        TableRow(children: [
          MainCard.card(
              Colors.blue,
              'Total Cases',
              height,
              numberFormat.format(
                  int.parse(model.totalStats.confirmed)),
              height),
          MainCard.card(
              Colors.purple,
              'Active Cases',
              height,
              numberFormat.format(
                  int.parse(model.totalStats.active)),
              height),
        ]),
        TableRow(children: [
          MainCard.card(
              Colors.red,
              'Total Deaths',
              height,
              numberFormat.format(
                  int.parse(model.totalStats.deaths)),
              height),
          MainCard.card(
              Colors.green,
              'Recovered',
              height,
              numberFormat.format(
                  int.parse(model.totalStats.recovered)),
              height),
        ]),
      ],
    );
  }

}
