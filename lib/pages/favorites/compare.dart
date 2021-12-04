import 'package:flutter/material.dart';

/**
 * Экран сравнений
 */
class ComparePage extends StatelessWidget {
  const ComparePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      Image.asset(
          "images/background.png",
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width
      ),
      Padding(
        padding: const EdgeInsets.only(
          left: 110,
          right: 110
        ),
        child: SingleChildScrollView(
          child: Row(
              children: [
                certificate(
                    "Traffic Data: узнать все о транспортных потоках",
                    "Прототип",
                    "В работе",
                    "От 20 до 100 человек",
                    "Программное обеспечение для анализа транспортных потоков по видео. Технология мониторинга может применяться как для учёта транспортных потоков, так и для адаптивного регулирования перекрёстков. Система способна определять...",
                    "21 июня",
                    3
                ),
                const SizedBox(width: 40),
                certificate(
                    "Chanje: транспортные грузоперевозки",
                    "Идея",
                    "В разработке",
                    "До 20 человек",
                    "Программное обеспечение для анализа транспортных потоков по видео. Технология мониторинга может применяться как для учёта транспортных потоков, так и для адаптивного регулирования перекрёстков. Система способна определять...з",
                    "13 октября",
                    1
                )
              ]
          )
        )
      )
    ]
  );

  Expanded certificate(
      String header, stage, status, inTeam, about, date, int articles
      ) => Expanded(
    child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(vertical: 134),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 10,
                color: Color.fromRGBO(0, 0, 0, 0.05)
            )]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  header,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Color(0xff25222C)
                  )
              ),
              const SizedBox(height: 20),
              type("Стадия:"),
              const SizedBox(height: 8),
              valueYesNo(stage, stage == "Прототип"),
              const SizedBox(height: 9),
              const Divider(color: Color(0xffEFEFEF)),
              const SizedBox(height: 8),
              type("Статус:"),
              const SizedBox(height: 8),
              valueYesNo(status, status == "В работе"),
              const SizedBox(height: 9),
              const Divider(color: Color(0xffEFEFEF)),
              const SizedBox(height: 8),
              type("В команде:"),
              const SizedBox(height: 8),
              value(inTeam),
              const SizedBox(height: 9),
              const Divider(color: Color(0xffEFEFEF)),
              const SizedBox(height: 8),
              type("Сертификаты:"),
              const SizedBox(height: 8),
              const SizedBox(height: 9),
              const Divider(color: Color(0xffEFEFEF)),
              const SizedBox(height: 8),
              type("О проекте:"),
              const SizedBox(height: 9),
              simpleValue(about),
              const SizedBox(height: 7),
              const Divider(color: Color(0xffEFEFEF)),
              const SizedBox(height: 8),
              type("Дата запуска:"),
              const SizedBox(height: 9),
              simpleValue(date),
              const SizedBox(height: 9),
              const Divider(color: Color(0xffEFEFEF)),
              const SizedBox(height: 9),
              type("Статьи в СМИ:"),
              const SizedBox(height: 9),
              simpleValue(articles.toString()),
              const SizedBox(height: 9),
              const Divider(color: Color(0xffEFEFEF)),
              const SizedBox(height: 8),
              type("Отчёты:"),
              const SizedBox(height: 9),
              value("Скачать"),
            ]
        )
    )
  );

  Text type(String text) => Text(
    text,
    style: const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      color: Color(0xff25222C)
    )
  );

  Text value(String text) => Text(
      text,
      style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Color(0xff009A96)
      )
  );

  Row valueYesNo(String text, bool yesNo) => Row(
    children: [
      Text(
          text,
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Color(0xff009A96)
          )
      ),
      const Spacer(),
      yesNo
      ? Image.asset("images/yes.png")
      : Image.asset("images/no.png")
    ]
  );

  Text simpleValue(String text) => Text(
      text,
      style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Color(0xff66646B)
      )
  );
}