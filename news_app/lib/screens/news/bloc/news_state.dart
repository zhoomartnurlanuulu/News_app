part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState{}

// class CategoryLoaded extends NewsState {
//   final List<CategoryModel> model;
//   CategoryLoaded(this.model);
// }

// class SelectedLanguage extends NewsState {
//   final List<SelectedLanguageModel> model;
//   SelectedLanguage(this.model);
// }


class NewsLoaded extends NewsState {
  final List<NewsModel> model;
   final List<CategoryModel> model_2;
  NewsLoaded(this.model, this.model_2);
 
}

class NewsError extends NewsState {
  final NewsExceptions message;
  NewsError(this.message);
}