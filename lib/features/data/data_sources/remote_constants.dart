import 'package:test_app/features/data/data_sources/config.dart';

String version1 = baseUrl;
String userRepositories(
        {required String query, required int pageNo, required String sort}) =>
    "$version1/search/repositories?q=$query&page=$pageNo&per_page=10&sort=$sort&order=desc";
