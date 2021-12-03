import 'package:flutter/material.dart';
import 'package:stinger_web/constants.dart';
import 'package:stinger_web/models/showcase_model.dart';
import 'package:stinger_web/requests.dart';

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
  get oneStyle => const TextStyle(fontSize: 12, fontWeight: FontWeight.w500);

  get twoStyle =>
      TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: mainGreen);

  @override
  Widget build(BuildContext context) {
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
        onTap: onClick,
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
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          const Text(
                            'Сертификаты:',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),

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
                    'Программное обеспечение для анализа транспортных потоков по видео. Технология мониторинга может применяться как для учёта транспортных потоков, так и для адаптивного регулирования перекрёстков. Система способна определять...',
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  onClick() {
    print('lolol');
  }

  stage(String step, String info) => FittedBox(
          child: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            FittedBox(child: Text(step, style: oneStyle)),
            FittedBox(child: Text(info, style: twoStyle)),
          ])));
}
