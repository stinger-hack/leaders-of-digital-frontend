import 'package:flutter/material.dart';

class MyPageView extends StatefulWidget {
  final int pageIndex;
  const MyPageView({Key? key, this.pageIndex = 0}) : super(key: key);

  @override
  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  List<Widget> pageLisst = [
    Container(color: Colors.red, width: 100, height: 100),
    Container(color: Colors.blue, width: 100, height: 100),
    Container(color: Colors.white, width: 100, height: 100)
  ];

  List<String> pageList = ['PageView1', 'PageView2', 'PageView3'];

  @override
  Widget build(BuildContext context) {
    var _currentPageIndex = 0;
    return Container(
      width: 500,
      height: 500,
      child: PageView.builder(
        onPageChanged: (int index) {
          setState(() {
            _currentPageIndex = index % (pageList.length);
          });
        },
        itemCount: pageList.length,
        itemBuilder: (context, index) {
          return _buildPageViewItem(pageList[index % (pageList.length)]);
        },
      ),
    );
  }
  _buildPageViewItem(String txt, {Color color = Colors.red}) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child: Text(
        txt,
        style: TextStyle(color: Colors.white, fontSize: 28),
      ),
    );
  }
}
