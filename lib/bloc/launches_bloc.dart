import 'package:graphql_example/models/launching.dart';
import 'package:graphql_example/models/launches_past_page.dart';
import 'package:graphql_example/network_provider/launches_network_provider.dart';
import 'package:rxdart/rxdart.dart';

class LaunchesBloc {
  final _launchesNetworkProvider = LaunchesNetworkProvider();
  final _launchesFetcher = PublishSubject<List<Launching>>();
  Stream<List<Launching>> get launches => _launchesFetcher.stream;
  List<Launching> _launchList = [];

  LaunchesBloc() {
    if(!_launchesFetcher.isClosed) {
      _launchesNetworkProvider.getLaunches();
      _launchesNetworkProvider.launchesStreamController.stream.listen((launchesPastPage) {
        LaunchesPastPage page = launchesPastPage;
        if(_launchList.isNotEmpty && _launchList[0].missionName == page.launchesPast[0].missionName) {
          _launchList.clear();
        }
        _launchList.addAll(page.launchesPast);
        _launchesFetcher.sink.add(_launchList);
      });
    }
  }

  loadMore() {
    _launchesNetworkProvider.getLaunches();
  }

  dispose() {
    _launchesFetcher.close();
  }
}