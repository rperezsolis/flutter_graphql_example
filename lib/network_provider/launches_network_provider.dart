import 'dart:async';

import 'package:graphql/client.dart';
import 'package:graphql_example/env/environment.dart';
import 'package:graphql_example/models/launches_past_page.dart';

class LaunchesNetworkProvider {
  final String readLaunchesQuery = '''
  query readLaunches(\$offset: Int, \$limit: Int) {
    launchesPast(offset: \$offset, limit: \$limit) {
      mission_name
      launch_date_local
      launch_site {
        site_name_long
      }
      links {
        video_link
      }
      rocket {
        rocket_name
        rocket {
          wikipedia
        }
      }
      ships {
        name
        image
      }
    }
  }''';
  final int _offsetIncrement = 5;
  int _limit = 5;
  int _offset = 0;
  StreamController _launchesStreamController = StreamController();
  StreamController get launchesStreamController => _launchesStreamController;

  getLaunches() async {
    QueryOptions options = QueryOptions(
      documentNode: gql(readLaunchesQuery),
        variables: {
          'limit': _limit,
          'offset': _offset
        }
    );
    _offset += _offsetIncrement;
    QueryResult result = await Environment.client.query(options);
    if (result.hasException) {
      print(result.exception.toString());
    }
    LaunchesPastPage launchesPastPage;
    try {
      launchesPastPage = LaunchesPastPage.fromJson(result.data);
    } catch(exception) {
      print('RESPONSE_EXCEPTION: ${exception.toString()}');
    }
    _launchesStreamController.add(launchesPastPage);
  }
}