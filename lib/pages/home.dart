import 'package:flutter/material.dart';

final List<String> menuList = ['사진태그등록', '내사진 리스트'];

class Home extends StatelessWidget {
  static final ROUTE = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('HAI Labeling')),
        body: ListView.builder(
          itemCount: menuList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text("${menuList[index]}"),
                onTap: () {
                  switch (index) {
                    case 0:
                      Navigator.of(context).pushNamed('/add');
                      break;
                    case 1:
                      Navigator.of(context).pushNamed('/gallery');
                      break;
                  }
                },
              ),
            );
          },
        ));
    ;
  }
}
