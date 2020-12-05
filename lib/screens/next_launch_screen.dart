import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rocketman/services/api.dart';
import 'package:rocketman/models/next_launch.dart';
import 'package:intl/intl.dart';
import 'package:rocketman/widgets/network_widget.dart';

class NextLaunchScreen extends StatefulWidget {
  @override
  _NextLaunchScreenState createState() => _NextLaunchScreenState();
}

class _NextLaunchScreenState extends State<NextLaunchScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ApiProvider _provider = ApiProvider();
  NextLaunch next;
  int estimateTs;
  bool loading=false;
  String problem="";
  // get data of next launch
  getNext()async {
    setState(() {
      loading=true;
    });
    try{
      final response = await _provider.get('nextt');
      setState(() {
        next = NextLaunch.fromJson(response);
        estimateTs = next.launchDateUnix * 1000;
        loading=false;
      });
    }catch(e){
      setState(() {
        problem=e.toString();
        loading=false;
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // get data on widget initial
    getNext();
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Next Launch',style: TextStyle(fontSize: 25,color: Colors.white),),
          ),
          Opacity(
            opacity: 0.9,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                // using steamBuilder to continue refresh widget
                child: StreamBuilder(
                    stream: Stream.periodic(Duration(seconds: 1), (i) => i),
                    builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                      DateFormat format = DateFormat("hh:mm:ss");
                      int now = DateTime
                          .now()
                          .millisecondsSinceEpoch;
                      Duration remaining = Duration(milliseconds: (estimateTs)-now );
                      //Get remaining days
                      var days='${remaining.inDays}';
                      //Get remaining Time
                      var timeString = '${format.format(
                          DateTime.fromMillisecondsSinceEpoch(remaining.inMilliseconds))}';
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text('Days:',style: TextStyle(fontSize: 20),),
                                    Text(days,style: TextStyle(fontSize: 20),),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('Hours:',style: TextStyle(fontSize: 20),),
                                    Text(timeString.substring(0,2),style: TextStyle(fontSize: 20),),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('Mins:',style: TextStyle(fontSize: 20),),
                                    Text(timeString.substring(3,5),style: TextStyle(fontSize: 20),),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('Secs:',style: TextStyle(fontSize: 20),),
                                    Text(timeString.substring(6,8),style: TextStyle(fontSize: 20),),
                                  ],
                                ),
                              ],
                            ),),
                        ],
                      );
                    }),
              ),
            ),
          ),
        ],
      )
    );
  }
}
