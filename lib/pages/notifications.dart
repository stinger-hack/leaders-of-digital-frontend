import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:stinger_web/models/notification_model.dart';

/**
 * Уведомления
 */
class NotificationsPage extends StatelessWidget {
  NotificationsPage({Key? key}) : super(key: key);

  final List<NotificationModel> notificationModels = [
    NotificationModel(
        url: "images/avatar.png",
        name: "Ксения Ливина",
        date: "12 октября",
        header: "Traffic Data: узнать все о транспортных потоках",
        body: "Лучшего решения проблемы я еще не видела!"),
    NotificationModel(
        header: "Traffic Data: узнать все о транспортных потоках",
        body: "Приглашает на событие."),
    NotificationModel(
        header: "Acerta: предоставление оборудования",
        body: "Запрос на встречу с командой."),
    NotificationModel(
        header: "Acerta: предоставление оборудования",
        body: "Ура! Прототип проекта готов!"),
    NotificationModel(
        url: "images/avatar5.png",
        name: "Николай Кузин",
        date: "1 октября",
        header: "Acerta: предоставление оборудования",
        body: "Ребята молодцы! Всегда все на высшем уровне!!!)")
  ];

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.all(50),
      child: AnimationLimiter(child: Wrap(
          spacing: 40,
          runSpacing: 40,
          direction: Axis.vertical,
          children: [
            for (int i = 0; i < notificationModels.length; i++)
              AnimationConfiguration.staggeredGrid(
                  columnCount: 2,
                  position: i,
                  duration: const Duration(milliseconds: 375),
                  child: ScaleAnimation(
                      scale: 0.5,
                      child: FadeInAnimation(
                          child: notification(i)
                      )
                  )
              )
          ])));

  Container notification(int index) => Container(
      height: 150,
      width: 590,
      padding: const EdgeInsets.only(top: 16, left: 20, right: 20, bottom: 13),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 10,
                color: Color.fromRGBO(0, 0, 0, 0.05))
          ]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (notificationModels[index].url != null)
          Row(children: [
            CircleAvatar(child: Image.asset(notificationModels[index].url!)),
            const SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(notificationModels[index].name!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xff25222C))),
              Text(notificationModels[index].date!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xffB0AFB3)))
            ])
          ]),
        const SizedBox(height: 12),
        Text(notificationModels[index].header!,
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Color(0xff25222C))),
        const SizedBox(height: 8),
        Row(children: [
          Text(
            notificationModels[index].body!,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Color(0xff66646B)),
          ),
          const Spacer(),
          Container(
              height: 32,
              width: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color(0xff009A96),
                  borderRadius: BorderRadius.circular(16)),
              child: const Icon(Icons.arrow_forward_ios))
        ])
      ]));
}
