import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hal_labeling_pre/const/color_const.dart';
import 'package:hal_labeling_pre/widgets/custom_appbar.dart';

import 'tag_detail_view.dart';
import 'tagInput.dart';

class PageMyGallery extends StatefulWidget {
//  final String data;
//
//  PageMyGallery(this.data);
  static final ROUTE = '/gallery';

  @override
  _PageMyGalleryState createState() => _PageMyGalleryState();
}

class _PageMyGalleryState extends State<PageMyGallery> {
  bool _loading = false;
  List<String> mglist = List<String>();
  var defalut_path =
      '/data/data/net.yeastudio.hal_labeling_pre/files/my_gallery/';

  @override
  void initState() {
    super.initState();

    print("[PageMyGallery] init() list load");
    _loadData();
  }

  // Mywork 리스트를 파일에서 조회하고 list를 만듬
  Future _loadData() async {
    mglist.clear();

    // 임시로 로드
    mglist.add('cat1.jpg');
    mglist.add('dog1.jpg');
    mglist.add('hedgehog1.jpg');
    mglist.add('lion1.jpg');
    mglist.add('zebra1.jpg');
    mglist.add('zebra2.jpg');

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(
        "[PageMyGallery] build() start!! mglist : " + mglist.length.toString());

    return Scaffold(
        appBar: CustomAppBar(
          height: 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "마이 갤러리",
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              )
            ],
          ),
        ),
        body: Container(
            color: CC_SIDE_BG,
            alignment: Alignment.topCenter,
            child: GridView.count(
                padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                crossAxisCount: 3,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: mglist.map((String value) {
                  // 리스트 내부는 Card 객체들로 채워짐
//              return MyCard(defalut_path + '' + value, onChangeState: (bool changeYN) {});
                  return MyCard(defalut_path + '' + value);
                }).toList())));
  }
}

class MyCard extends StatefulWidget {
  String mainImgPath = "";

  MyCard(this.mainImgPath); // Card에 보여지는 그림 경로를 미리 받음

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  String mainImgPath;

  @override
  void initState() {
    mainImgPath = widget.mainImgPath;

    print("mainImgPath => " + mainImgPath);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("[item] mainImgPath : " + mainImgPath.toString());

    return Container(
      child: Column(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TagInput()));
              },
              child: Card(
                  child: Image.file(
                File(widget.mainImgPath),
                fit: BoxFit.cover,
              )),
            ),
            /*
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.file(
                    File(widget.mainImgPath),
                    fit: BoxFit.cover,
                  ),
                )),
                */
          ),
        ],
      ),
    );
    /*
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
              onTap: () {
                print("My Gallery View page!!!!!!!!!!!!!!");
              },
              child: ClipRRect(
                //borderRadius: BorderRadius.circular(15.0),
                child: Image.file(File(widget.mainImgPath),
                    key: Key(DateTime.now().millisecondsSinceEpoch.toString())),
              ))
        ],
      ),

    );*/
  }
}
