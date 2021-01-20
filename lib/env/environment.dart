import 'package:graphql/client.dart';

class Environment {
  static HttpLink _httpLink = HttpLink(
    uri: 'https://api.spacex.land/graphql/',
  );
  static  GraphQLClient client = GraphQLClient(
    cache: InMemoryCache(),
    link: _httpLink,
  );
}