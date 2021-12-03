import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stinger_web/constants.dart';
import 'package:stinger_web/models/showcase_model.dart';
import 'package:stinger_web/requests.dart';

import 'full_project_card.dart';

class ProjectCard extends StatefulWidget {
  final Showcase data;

  const ProjectCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  get oneStyle => const TextStyle(fontSize: 12, fontWeight: FontWeight.w600);

  get twoStyle =>
      TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: mainGreen);

  @override
  Widget build(BuildContext context) {
    final date = DateTime.parse(widget.data.createdAt);
    String formatMonth() {
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

    var rng = Random();
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: white,
          boxShadow: [
            BoxShadow(
              color: shadow,
              offset: const Offset(0, 3),
              blurRadius: 5,
              spreadRadius: 1,
            )
          ]),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FullProjectCard()));
        },
        child: Column(
          children: [
            SizedBox(
              height: 24,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.data.projectName,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert),
                    color: Colors.black,
                    iconSize: 24,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              flex: 6,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                          color: semiGrey,
                          borderRadius: BorderRadius.circular(14)),
                      child:
                          ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.network(widget.data.imgLink, fit: BoxFit.fill),),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              stage('Стадия:', 'Прототип'),
                              const SizedBox(width: 30),
                              stage('Статус:', 'В работе'),
                            ],
                          ),
                          stage('В кодманде:', 'От 1 до 4'),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: const Text(
                              'Сертификаты:',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ),
                          avardsIcon(rng.nextInt(3) + 1),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Text(
                    widget.data.description,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Text(
                    '${date.day} ${formatMonth()}, ${date.year}',
                    style: TextStyle(color: semiGrey),
                  )),
                  Container(
                    width: 20,
                    height: 20,
                    child: InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.download_rounded,
                        size: 20,
                        color: semiGrey,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    width: 20,
                    height: 20,
                    child: InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.favorite,
                        size: 20,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  stage(String step, String info) => FittedBox(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            FittedBox(child: Text(step, style: oneStyle)),
            FittedBox(child: Text(info, style: twoStyle)),
          ])));

  avardsIcon(int index) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 50,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (int i = 0; i < index; i++)
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: avardsBkg,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/sport${i + 1}.png',
                        scale: 1,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
          ],
        ),
      );
}
