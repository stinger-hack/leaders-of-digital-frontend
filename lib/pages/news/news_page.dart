import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:stinger_web/components/my_circular_indicator.dart';
import 'package:stinger_web/components/my_searchfield.dart';
import 'package:stinger_web/constants.dart';
import 'package:stinger_web/models/news_model.dart';

import '../../requests.dart';

/**
 * Экран новостной ленты
 */
class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  bool isLoading = true;
  var searchController = TextEditingController();
  List<NewsModel> news = [];

  String formatMonth(date) {
    switch (date.month) {
      case 1:
        return 'Января';
      case 2:
        return 'Февраля';
      case 3:
        return 'Марта';
      case 4:
        return 'Апрелья';
      case 5:
        return 'Мая';
      case 6:
        return 'Июня';
      case 7:
        return 'Июля';
      case 8:
        return 'Августа';
      case 9:
        return 'Сентября';
      case 10:
        return 'Октября';
      case 11:
        return 'Ноября';
      case 12:
        return 'Декабря';
      default:
        return '';
    }
  }

  @override
  void initState() {
    HttpRequests().getNews().then((value) {
      if (value != null) {
        setState(() {
          news = value;
          isLoading = false;
        });
      } else {
        var snackBar = const SnackBar(content: Text("Что-то пошло не так"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => isLoading
      ? Center(child: Indicator.circle)
      : Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 110, right: 110),
      child: Column(
        children: [
          MySearchField(controller: searchController),
          const SizedBox(height: 40),
          Expanded(
              child: AnimationLimiter(
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1.2,
                          crossAxisSpacing: 40,
                          mainAxisSpacing: 40,
                          crossAxisCount: 2
                      ),
                      itemCount: news.length,
                      itemBuilder: (context, index) => AnimationConfiguration.staggeredGrid(
                          columnCount: 2,
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          child: ScaleAnimation(
                              scale: 0.5,
                              child: FadeInAnimation(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: shadow,
                                              offset: const Offset(0, 2),
                                              blurRadius: 2,
                                              spreadRadius: 1,
                                            )
                                          ],
                                          borderRadius: BorderRadius.circular(20)),
                                      child: Column(children: [
                                        Container(
                                            height: 76,
                                            width: double.infinity,
                                            padding: const EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(20)),
                                            child: Row(children: [
                                              CircleAvatar(
                                                  child: Image.asset(
                                                      'assets/images/team${index + 1}.png')),
                                              const SizedBox(width: 16),
                                              Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    FittedBox(
                                                      child: Text(news[index].newsHeader,
                                                          style: const TextStyle(
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 16,
                                                              color: Color(0xff25222C))),
                                                    ),
                                                    const SizedBox(height: 1),
                                                    Text(
                                                        DateTime.parse(
                                                            news[index].createdAt)
                                                            .day
                                                            .toString() +
                                                            ' ' +
                                                            formatMonth(DateTime.parse(
                                                                news[index].createdAt)),
                                                        style: const TextStyle(
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 12,
                                                            color: Color(0xff929095)))
                                                  ]),
                                              const Spacer(),
                                              GestureDetector(
                                                  child: Image.asset(
                                                      "images/popup_button.png"))
                                            ])),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(14),
                                          child: Image.network(
                                            news[index].imgLink,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Column(children: [
                                              Text(news[index].newsHeader,
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 22,
                                                      color: Color(0xff25222C))),
                                              const SizedBox(height: 6),
                                              Text(news[index].newsText,
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      color: Color(0xff66646B)
                                                  )
                                              )
                                            ])
                                        )
                                      ])
                                  )
                              )
                          )
                      )
                  )
              )
          )
        ]
      )
  );
}
