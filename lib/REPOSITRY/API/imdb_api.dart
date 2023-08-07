import 'dart:convert';
import 'package:http/http.dart';
import 'package:imdbrating/REPOSITRY/MODELCLASS/Imdbmodel.dart';
import 'api_claint.dart';






class Imdbapi {
  ApiClient apiClient = ApiClient();


  Future<Imdbmodel> getimdbmodel() async {
    String trendingpath = "https://imdb188.p.rapidapi.com/api/v1/searchIMDB";
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return Imdbmodel.fromJson(jsonDecode(response.body));
  }
}