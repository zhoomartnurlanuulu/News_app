import 'package:news_app/model/category.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/screens/news/bloc/news_provider.dart';

class NewsRepository {
  Future<List<NewsModel>> getNews() {
    NewsProvider provider = NewsProvider();
    return provider.getNews();
  }

  Future<List<CategoryModel>> getCategories() {
    NewsProvider provider = NewsProvider();
    return provider.getCategories();
  }
}

