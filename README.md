# graphql_example

This project illustrates how to implement a grqphql client into our flutter application making use of the package [graphql](https://pub.dev/packages/graphql).
The example retrieves data of [SpaceX](https://www.spacex.com/) missions.
It also use another useful packages, such as:
- [rxdart](https://pub.dev/packages/rxdart) to help us to implement reactive programming using the bloc pattern.
- [url_launcher](https://pub.dev/packages/url_launcher) to launch urls with a simple line of code.
- [json_serializable](https://pub.dev/packages/json_serializable) which is really helpful when we want to parse the json response of the server into our object models. It creates for us all the boilerplate code necessary for that.
- [build_runner](https://pub.dev/packages/build_runner) which is a build system for Dart code generation and modular compilation. It is used by the json_serializable package to create the json parser classes.
