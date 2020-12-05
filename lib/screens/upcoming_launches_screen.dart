import 'package:flutter/material.dart';
import 'package:rocketman/models/upcoming_launch.dart';
import 'package:rocketman/services/api.dart';
import 'package:rocketman/widgets/network_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
class UpcomingScreen extends StatefulWidget {
  @override
  _UpcomingScreenState createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {
  ApiProvider _provider = ApiProvider();
  List <UpcomingLaunch> upcomings=[];
  List<String> fav=[];
  bool loading=false;
  String problem="";
  //Get List of Upcoming Launch
  getUpcoming()async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    setState(() {
      fav=localStorage.getStringList('fav');
      localStorage.setStringList('fav', fav);
      loading=true;
    });
    try{
      final response = await _provider.get('upcoming');
      setState(() {
        for (Map i in response) {
          UpcomingLaunch up=UpcomingLaunch.fromJson(i);
          checkFav(up);
          upcomings.add(up);
        }
        loading = false;
      });
    }catch(e){
      setState(() {
        problem=e.toString();
        loading=false;
      });
    }
  }
  addToFavorite(UpcomingLaunch up)async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    setState(() {
      up.favorite=true;
      fav.add(up.flightNumber.toString());
      localStorage.setStringList('fav', fav);
    });

  }
  checkFav(UpcomingLaunch up){
    for(int i=0;i<fav.length;i++){
      if(up.flightNumber.toString()==fav[i])
        {
          up.favorite=true;
        }
    }
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
      body: loading?Loading(loadingMessage: 'Loading'):problem!=""?Center(child: Text(problem,style: TextStyle(color: Colors.white),),):Column(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        upcomings[index].favorite?Icon(Icons.favorite):Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                              color: Colors.black.withOpacity(0.3),
                              child: Text('Add to Favorite'),
                              onPressed:() {
                                addToFavorite(upcomings[index]);
                                print(upcomings[index].favorite);
                              },
                        ),
                        )
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
