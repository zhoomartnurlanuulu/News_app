import 'package:dio/dio.dart';
import 'package:news_app/helpers/api_requester.dart';
import 'package:news_app/helpers/news_exceptions.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/model/news_model.dart';

class NewsProvider {
  Future<List<NewsModel>> getNews() async {
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.toGet("news");
      if (response.statusCode == 200) {
        response.data.map((val) => print(val));
        return response.data.map<NewsModel>((val) => NewsModel.fromJson(val)).toList();
      }
      throw NewsExceptions.catchError(response);
    } catch (e) {
      print(e);
      throw NewsExceptions.catchError(e);
    }
  }
  Future<List<CategoryModel>> getCategories() async {
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.toGet("category");
      if (response.statusCode == 200) {
        response.data.map((val) => print(val));
        return response.data.map<CategoryModel>((val) => CategoryModel.fromJson(val)).toList();
      }
      throw NewsExceptions.catchError(response);
    } catch (e) {
      print(e);
      throw NewsExceptions.catchError(e);
    }
  }

}