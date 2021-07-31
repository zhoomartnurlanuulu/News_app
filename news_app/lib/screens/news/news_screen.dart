import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/model/language.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/screens/content/content_screen.dart';
import 'package:news_app/screens/news/bloc/news_bloc.dart';
import 'package:news_app/screens/news/bloc/news_repository.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({Key? key}) : super(key: key);
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int selectedIndex = 0;
  List<bool> isSelected = [];

  void _changeLanguage(Language? language) {
    print(language?.langeuageCode);
  }

  final bloc = NewsBloc(NewsRepository());
  @override
  void initState() {
    super.initState();
    bloc.add(GetNewsEvent());
  }

  List<NewsModel> selectedCard = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffE5E5E5),
        elevation: 0,
        title: Text(
          'Новости',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
        actions: [
          DropdownButton(
            onChanged: (Language? language) {
              _changeLanguage(language);
            },
            underline: SizedBox(),
            icon: Icon(
              Icons.language,
              color: Colors.white,
            ),
            items: Language.languageList()
                .map<DropdownMenuItem<Language>>(
                  (lang) => DropdownMenuItem(
                    value: lang,
                    child: Row(
                      children: [Text(lang.flag), Text(lang.name)],
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is NewsLoading) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state is NewsLoaded) {
              return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  color: Color(0xffE5E5E5),
                  child: Column(
                    children: [
                      Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.model.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                state.model_2[index].active =
                                    !state.model_2[index].active!;
                                    if(state.model_2[index].active = false)
                                   {}// bloc.add();

                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(left: 5, right: 5),
                              padding: EdgeInsets.only(left: 5, right: 5),
                              decoration: BoxDecoration(
                                color: state.model_2[index].active!
                                    ? Color(0xff71C343)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(state.model_2[index].name.toString()),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.79,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          //padding: EdgeInsets.only(),
                          itemCount: state.model.length,
                          itemBuilder: (_, index) => ListTile(
                            title: Container(
                                color: Colors.white,
                                height: 156,
                                child: Image(
                                  image: NetworkImage(
                                      state.model[index].firstImage.toString()),
                                  fit: BoxFit.cover,
                                )),
                            subtitle: Container(
                              color: Colors.white,
                              height: 60,
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Center(
                                      child: Text(
                                        state.model[index].kgTitle.toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    height: 60,
                                    width: 300,
                                    // color: Colors.red,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Content(index: index),
                                          ),
                                        );
                                      },
                                      icon: Icon(Icons.keyboard_arrow_right))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ));
            } else if (state is NewsError) {
              return Container(
                  color: Colors.yellow,
                  height: 50,
                  width: 200,
                  child: Text('111111111'));
            }
            return Text('ошибка');
          }),
    );
  }
}

