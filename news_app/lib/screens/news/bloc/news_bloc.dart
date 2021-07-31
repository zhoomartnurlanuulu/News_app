import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:news_app/helpers/news_exceptions.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/screens/news/bloc/news_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsRepository repository = NewsRepository();

  NewsBloc(NewsRepository newsRepository) : super(NewsInitial());

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
       if (event is GetNewsEvent) {
      try {
        yield NewsLoading();
        List<NewsModel> data = await repository.getNews();
        List<CategoryModel> category = await repository.getCategories();
        yield NewsLoaded(data, category);
      } catch (e) {
        yield NewsError(NewsExceptions.catchError(e));
      }
  }
}
}