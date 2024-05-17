import 'package:test_app/features/data/data_sources/config.dart';

String version1 = baseUrl;
String userRepositories({required int pageNo}) =>
    "$version1/search/repositories?q=data&page=$pageNo&per_page=10&sort=stars&order=desc";
