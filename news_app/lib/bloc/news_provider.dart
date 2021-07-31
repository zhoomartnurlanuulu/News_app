// import 'package:dio/dio.dart';
// import 'package:news_app/helpers/api_requester.dart';
// import 'package:news_app/helpers/news_exceptions.dart';
// import 'package:news_app/model/news_model.dart';

// class NewsProvider {
//   Future<List<NewsModel>> getNews() async {
//     try {
//       ApiRequester requester = ApiRequester();
//       Response response = await requester.toGet("everything?q=Apple&from=2021-07-31&sortBy=popularity&apiKey=80d381eb22154790883267a0278af586");
//       if (response.statusCode == 200) {
//         response.data.map((val) => print(val));
//         return response.data.map<NewsModel>((val) => NewsModel.fromJson(val)).toList();
//       }
//       throw NewsExceptions.catchError(response);
//     } catch (e) {
//       print(e);
//       throw NewsExceptions.catchError(e);
//     }
//   }
// }