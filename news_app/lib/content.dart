import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';

class Content extends StatelessWidget {
 Content({Key? key,required this.index}) : super(key: key);
final int index;
  @override
  Widget build(BuildContext context) {
    NewsModelList list = new NewsModelList();
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.white, leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_rounded, color: Colors.black,)),),
        body: SingleChildScrollView(
                  child: Container(
            padding: EdgeInsets.all(20),
            child: Column( //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  //height: 84,
                  child: Center(
                    child: Text(
                      list.newsModelList[index].title.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 18),
                Container(
                  height: 21,
                  child: Text(
                    list.newsModelList[index].data.toString(),
                    style: TextStyle(color: Color(0xffAEAEAE), fontSize: 14),
                  ),
                ),
                SizedBox(height: 18),
                Container(
                    height: 185,
                    width: 389,
                    child: Image(
                      image:
                          NetworkImage(list.newsModelList[index].image.toString()),
                      fit: BoxFit.cover,
                    )),SizedBox(height: 18),
                Container(
                  child: Text(
                    list.newsModelList[index].content.toString(),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
