import 'package:flutter/material.dart';

class FullProjectCard extends StatefulWidget {
  const FullProjectCard({Key? key}) : super(key: key);

  @override
  State<FullProjectCard> createState() => _FullProjectCardState();
}

class _FullProjectCardState extends State<FullProjectCard> {
  PageController controller = PageController();

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) => Container(
    height: 1099,
    width: 800,
    decoration: BoxDecoration(
        color: Colors.white,
      borderRadius: BorderRadius.circular(16),
    ),
    padding: const EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              "Traffic Data: узнать все о транспортных потоках",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Color(0xff25222C)
              ),
            ),
            const Spacer(),
            Image.asset("assets/images/share.png"),
            const SizedBox(width: 26.5),
            Image.asset("assets/images/download.png"),
            const SizedBox(width: 27.5),
            GestureDetector(
              onTap: () => setState(() => isFavorite = !isFavorite),
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: const Color(0xffF44336)
              )
            )
          ],
        ),
        const SizedBox(height: 20),
        Container(
          height: 426,
          width: 760,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12)
          ),
          child: Stack(
            children: [
              PageView(
                controller: controller,
                children: [
                  for (int i = 0; i < 21; i++)
                    Image.asset(
                        "assets/images/traffic_data.png",
                        fit: BoxFit.fill
                    )
                ]
              ),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Row(
                    children: [
                      Container(
                        height: 26,
                          width: 70,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: const Text(
                              "1 из 21",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Color(0xff25222C)
                              )
                          )
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => setState(() => controller.previousPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease
                        )),
                        child: Container(
                            height: 36,
                            width: 36,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(25)
                            ),
                            child: const Icon(
                                Icons.arrow_back_ios,
                                size: 14.73,
                                color: Color(0xff25222C)
                            )
                        )
                      ),
                      const SizedBox(width: 16.62),
                      GestureDetector(
                          onTap: () => setState(() => controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease
                          )),
                        child: Container(
                            height: 36,
                            width: 36,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(25)
                            ),
                            child: const Icon(
                                Icons.arrow_forward_ios,
                                size: 14.73,
                                color: Color(0xff25222C)
                            )
                        )
                      )
                    ]
                )
              )
            ]
          )
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            info("Организация:", "ГУП «Мосгортранс»"),
            const SizedBox(width: 157),
            info("Студия:", "Прототип"),
            const SizedBox(width: 58),
            info("Статус:", "В работе"),
            const SizedBox(width: 47),
            info("В команде", "От 20 до 100")
          ]
        ),
        const SizedBox(height: 20),
        header("О проекте"),
        body("Программное обеспечение для анализа транспортных потоков по видео. Технология мониторинга может применяться как для учёта транспортных потоков, так и для адаптивного регулирования перекрёстков. Система способна определять ДТП, занятость парковочных мест, контролировать соблюдение правил дорожного движения, причём съёмка может проходить как со стационарных камер, так и с беспилотных летательных аппаратов. Точность определения объектов достигает 90%."),
        const SizedBox(height: 8),
        const Text(
          "сегодня в 21:00",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Color(0xffBEBCBF)
          )
        ),
        const SizedBox(height: 20),
        header("Эффект для города"),
        body("Подробный анализ транспортных потоков для их последующих оптимизации и изменений транспортных узлов."),
        const SizedBox(height: 24),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            hashTag("ПО"),
            hashTag("Перекрёстки"),
            hashTag("Учёт транспортных потоков"),
            hashTag("ДТП"),
            hashTag("Беспилотники"),
            hashTag("ПДД")
          ]
        ),
        const SizedBox(height: 30),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: const Color(0xff009A96),
            borderRadius: BorderRadius.circular(22)
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 36,
            vertical: 12
          ),
          child: const Text(
            "Назначить встречу",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.white
            )
          )
        ),
        const SizedBox(height: 30),
        header("Похожее"),
        const SizedBox(height: 20),
        ListView.builder(
            itemBuilder: (context, index) => Container()
        ),

      ]
    )
  );

  Container sport(int index) => Container(
    height: 30,
    width: 30,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8)
    ),
    child: Image.asset("assets/images/sport$index.png"),
  );

  Column info(String type, name) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            type,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Color(0xff25222C)
            )
        ),
        const SizedBox(height: 4),
        Text(
            name,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Color(0xff009A96)
            )
        )
      ]
  );

  Text header(String text) => Text(
      text,
      style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: Color(0xff25222C)
      )
  );

  Text body(String text) => Text(
      text,
      style: const TextStyle(
          fontSize: 16,
          color: Color(0xff66646B)
      )
  );

  FittedBox hashTag(String text) => FittedBox(
    child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xff009A96).withOpacity(0.15),
          borderRadius: BorderRadius.circular(22),
        ),
        padding: const EdgeInsets.only(
            top: 5,
            left: 16,
            right: 8.5,
            bottom: 5
        ),
        child: Row(
            children: [
              Text(
                  text,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xff009A96)
                  )
              ),
              const SizedBox(width: 11),
              Image.asset(
                  "assets/images/delete.png",
                  height: 13,
                  width: 13
              )
            ]
        )
    ),
  );
}