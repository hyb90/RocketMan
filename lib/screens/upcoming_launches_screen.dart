import 'package:flutter/material.dart';
import 'package:rocketman/models/upcoming_launch.dart';
import 'package:rocketman/services/api.dart';
import 'package:rocketman/widgets/network_widget.dart';
class UpcomingScreen extends StatefulWidget {
  @override
  _UpcomingScreenState createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {
  ApiProvider _provider = ApiProvider();
  List <UpcomingLaunch> upcomings=[];
  bool loading=false;
  //Get List of Upcoming Launch
  getUpcoming()async {
    setState(() {
      loading=true;
    });
    final response = await _provider.get('upcoming');
      setState(() {
        for (Map i in response) {
          upcomings.add(UpcomingLaunch.fromJson(i));
        }
        loading = false;
      });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUpcoming();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title:Text('Rocket Man',style: TextStyle(color: Colors.white))
      ),
      body: loading?Loading(loadingMessage: 'loading',):Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( 'Upcoming Launches',style: TextStyle(fontSize: 25,color: Colors.white),),
            ],

          ),
          Flexible(
            child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: upcomings.length,
                itemBuilder: (BuildContext context, int index) =>Opacity(
                  opacity: 0.9,
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ListTile(
                          title: Text('Mission Name'),
                          trailing: Text(upcomings[index].missionName),
                        ),
                        ListTile(
                          title: Text('Date'),
                          trailing: Text(upcomings[index].launchDateLocal.substring(0,10)),
                        ),
                        ListTile(
                          title: Text('Launchpad'),
                          trailing: Text(upcomings[index].launchSite.siteName)
                        ),

                      ],
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
