import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:graphql_example/bloc/launches_bloc.dart';
import 'package:graphql_example/models/launches_past.dart';
import 'package:url_launcher/url_launcher.dart';

class Launches extends StatefulWidget {
  final String title;

  Launches({Key key, this.title}) : super(key: key);

  @override
  _LaunchesState createState() => _LaunchesState();
}

class _LaunchesState extends State<Launches> {
  final launchesBloc = LaunchesBloc();
  final scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.offset == scrollController.position.maxScrollExtent) {
        launchesBloc.loadMore();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    launchesBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black87,
        shadowColor: Colors.white70,
      ),
      backgroundColor: Colors.white10,
      body: StreamBuilder(
          stream: launchesBloc.launches,
          builder: (context, AsyncSnapshot<List<LaunchesPast>> snapshot) {
            if(snapshot.hasData) {
              return _buildLaunchesList(snapshot.data);
            } else if(snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Center(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                          child: Text('Loading...'),
                        )
                      ],
                    ),
                  ),
                )
              );
            }
          }
      ),
    );
  }

  Widget _buildLaunchesList(List<LaunchesPast> launchList) {
    List<Widget> ships = [];
    launchList.map((launching) => ships.add(
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
          ),
          itemCount: launching.ships.length,
          itemBuilder: (context, index) {
            return launching.ships[index] != null
                && launching.ships[index].image != null
                && launching.ships[index].name != null ?
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  launching.ships[index].image,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width/3,
                  height: MediaQuery.of(context).size.width/4,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    launching.ships[index].name,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ) :
            null;
          },
        )
    )).toList();

    return ListView.builder(
      controller: scrollController,
      itemCount: launchList.length + 1,
      itemBuilder: (context, index) {
        if(index < launchList.length) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.black87,
              shadowColor: Colors.white70,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Mission:',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    Center(
                      child: Text(
                        launchList[index].missionName,
                        style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      'Launch date:',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      _getDate(launchList[index].launchDateLocal.toIso8601String()),
                      style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      'Launch site:',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      launchList[index].launchSite.siteNameLong,
                      style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      'Video:',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    GestureDetector(
                      child: Text(
                        launchList[index].links.videoLink,
                        style: TextStyle(fontSize: 16, color: Colors.orange),
                      ),
                      onTap: () {
                        _launchUrl(launchList[index].links.videoLink);
                      },
                    ),
                    SizedBox(height: 8,),
                    Text(
                      'Rocket:',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Text(
                      launchList[index].rocket.name,
                      style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor),
                    ),
                    GestureDetector(
                      child: Text(
                        launchList[index].rocket.rocketWikipedia.wikipedia,
                        style: TextStyle(fontSize: 16, color: Colors.orange),
                      ),
                      onTap: () {
                        _launchUrl(launchList[index].rocket.rocketWikipedia.wikipedia);
                      },
                    ),
                    SizedBox(height: 8,),
                    Text(
                      'Ships:',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(height: 8,),
                    ships[index],
                  ],
                ),
              ),
            ),
          );
        } else {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Center(child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )),
          );
        }
      }
    );
  }

  String _getDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return '${dateTime.month}-${dateTime.day}-${dateTime.year}, ${dateTime.hour}:${dateTime.minute}';
  }

  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
