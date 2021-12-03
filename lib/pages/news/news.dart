import 'package:flutter/material.dart';
import 'package:stinger_web/components/my_appbar.dart';
import 'package:stinger_web/constants.dart';
import 'package:stinger_web/models/news_model.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<NewsModel> newsModels = [
    NewsModel(
        url: "images/sc.png",
        name: "SC - team",
        image: "images/sc_image.png",
        header: "Встречайте победителей!",
        body:
            "На хакатоне «Финансы. Банкинг. Страхование» были представлены 8 задач от следующих кейсодержателей: Госкорпорации «Росатом», Министерства финансов РФ, Accenture, Balance Platform, ВТБ, ПСБ, Международного аэропорта Шереметьево и Министерства...",
        time: DateTime.parse("2021-12-04 21:00:00Z")),
    NewsModel(
        url: "images/smart_car.png",
        name: "Smart Car",
        image: "images/smart_car_image.png",
        header: "Борьба с изменением климата окупает себя...",
        body:
            "Транспортно-логистические компании, которые реализуют планы по сокращению выбросов, получили значительный рост общей годовой прибыли акционеров. Но для обеспечения экономической устойчивости компаниям следует включить зеленую повестку в свои...",
        time: DateTime.parse("2021-12-04 16:32:00Z")),
    NewsModel(
        url: "assets/images/поколение_победителей.png",
        name: "Поколение победителей",
        image: "assets/images/поколение_победителей_image.png",
        header: "Забудьте о пробках, есть решение!",
        body:
            "На хакатоне «Финансы. Банкинг. Страхование» были представлены 8 задач от следующих кейсодержателей: Госкорпорации «Росатом», Министерства финансов РФ, Accenture, Balance Platform, ВТБ, ПСБ, Международного аэропорта Шереметьево и Министерства финансов Рес...",
        time: DateTime.parse("2021-12-04 21:00:00Z")),
    NewsModel(
        url: "assets/images/огибая_планету.png",
        name: "Огибая_планету",
        image: "assets/images/огибая_планету_image.png",
        header: "Без опозданий",
        body:
            "Транспортно-логистические компании, которые реализуют планы по сокращению выбросов, получили значительный рост общей годовой прибыли акционеров. Но для обеспечения экономической устойчивости компаниям следует включить зеленую повестку в свои...",
        time: DateTime.parse("2021-12-04 16:32:00Z"))
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: background,
        body: Padding(
            padding: const EdgeInsets.only(top: 40, left: 110, right: 110),
            child: Column(
              children: [
                const MyAppBar(selectedPage: 1),
                const SizedBox(height: 40),
                Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1.2,
                              crossAxisSpacing: 40,
                              mainAxisSpacing: 40,
                              crossAxisCount: 2),
                      itemCount: newsModels.length,
                      itemBuilder: (context, index) => Container(
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
                                      child:
                                          Image.asset(newsModels[index].url!)),
                                  const SizedBox(width: 16),
                                  Column(children: [
                                    Text(newsModels[index].name!,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            color: Color(0xff25222C))),
                                    const SizedBox(height: 1),
                                    Text(
                                        "сегодня в ${newsModels[index].time!.hour}:${newsModels[index].time!.minute}",
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
                            Image.asset(newsModels[index].image!, height: 252),
                            const SizedBox(height: 20),
                            Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(children: [
                                  Text(newsModels[index].header!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 22,
                                          color: Color(0xff25222C))),
                                  const SizedBox(height: 6),
                                  Text(newsModels[index].body!,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Color(0xff66646B)))
                                ]))
                          ]))),
                )
              ],
            )),
      );
}
