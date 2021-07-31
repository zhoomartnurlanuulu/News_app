import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';

class Filter extends StatefulWidget {
  Filter({Key? key, required this.index}) : super(key: key);
  int index;
  final all = [NewsModel(title: 'Выбрать все')];
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  NewsModelList list = new NewsModelList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
            )),
        title: Text(
          'Фильтр',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                //for (int i = 0; i = list.newsModelList.length; i++) {}
                list.newsModelList[widget.index].active = false;
              });
            },
            child: Container(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                'Сбросить',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Color(0xffE5E5E5),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height:550,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: list.newsModelList.length,
                itemBuilder: (_, index) => CheckboxListTile(
                  value: list.newsModelList[index].active,
                  onChanged: (value) => setState(() {
                    list.newsModelList[index].active = value;
                    print(value);
                  }),
                  title: Text(list.newsModelList[index].categories.toString()),
                ),
              ),
            ),
            SizedBox(height: 50,),
            InkWell(
              onTap: (){},
                          child: Container(
                child: Center(child: Text('Применить', style: TextStyle(color: Colors.white))),
                height: 48,
                width: 328,
                color: Colors.blue,
              ),
            )
            
          ],
        ),
      ),
    );
  }
}
