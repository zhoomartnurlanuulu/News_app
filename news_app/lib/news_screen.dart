import 'package:flutter/material.dart';
import 'package:news_app/content.dart';
import 'package:news_app/filter.dart';
import 'package:news_app/model/language.dart';

import 'model/news_model.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  NewsModelList list = new NewsModelList();
  int selectedIndex = 0;

void _changeLanguage(Language? language){
  print(language?.langeuageCode);
}

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
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        Filter(index: list.newsModelList.length)));
              },
              child: DropdownButton(
                onChanged: (Language? language){
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

              // Container(
              //   padding: EdgeInsets.only(right: 10),
              //   child: Text(
              //     'Фильтр',
              //     style: TextStyle(fontSize: 14),
              //   ),
              // ),
              ),
        ],
      ),
      body: Container(
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
                itemCount: list.newsModelList.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 5, right: 5),
                    padding: EdgeInsets.only(left: 5, right: 5),
                    decoration: BoxDecoration(
                      color: index == selectedIndex
                          ? Color(0xff71C343)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:
                        Text(list.newsModelList[index].categories.toString()),
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
                itemCount: list.newsModelList.length,
                itemBuilder: (_, index) => ListTile(
                  title: Container(
                      color: Colors.white,
                      height: 156,
                      child: Image(
                        image: NetworkImage(
                            list.newsModelList[index].image.toString()),
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
                              list.newsModelList[index].title.toString(),
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
                                  builder: (context) => Content(index: index),
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
        ),
      ),
    );
  }
}
