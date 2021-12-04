import 'package:flutter/material.dart';
import 'package:stinger_web/components/my_download.dart';
import 'package:stinger_web/models/similar_model.dart';
import 'package:stinger_web/models/team_model.dart';

class FullProjectCard extends StatefulWidget {
  const FullProjectCard({Key? key}) : super(key: key);

  @override
  State<FullProjectCard> createState() => _FullProjectCardState();
}

class _FullProjectCardState extends State<FullProjectCard> with SingleTickerProviderStateMixin {
  List<SimilarModel> similarModels = [
    SimilarModel(
      url: "images/similar1.png",
      name: "Chanje: транспортные грузоперевозки"
    ),
    SimilarModel(
        url: "images/similar2.png",
        name: "GG: предоставление оборудования"
    ),
    SimilarModel(
        url: "images/similar1.png",
        name: "Chanje: транспортные грузоперевозки"
    ),
    SimilarModel(
        url: "images/similar2.png",
        name: "GG: предоставление оборудования"
    )
  ];

  List<TeamModel> teamModels = [
    TeamModel(
      url: "images/team1.png",
      name: "Вениамин Манукян",
      status: "Капитан команды",
      phoneNumber: "+7 920 103-45-76",
      email: "vanilka1000-7@mail.ru",
      summary: "Продуктовый менеджер, бизнесмен, владелец стартап-студии. Создал 23 успешных продукта, актуальных и по сей день.",
      city: "Ярославль",
      year: 21
    ),
    TeamModel(
        url: "images/team2.png",
        name: "Дык Фам",
        status: "Full stack",
        phoneNumber: "+7 920 103-45-76",
        email: "vanilka1000-7@mail.ru",
        summary: "Full stack, бизнесмен, владелец стартап-студии. Создал 23 успешных коммита за 1 минуту, установив мировой рекорд среди спортивных программистов.",
        city: "Ярославль",
        year: 22
    ),
    TeamModel(
        url: "images/team3.png",
        name: "Павел Работянин",
        status: "Капитан команды",
        phoneNumber: "+7 920 103-45-76",
        email: "vanilka1000-7@mail.ru",
        summary: "Full stack, бизнесмен, владелец стартап-студии. Создал 1 успешных коммита за 23 года, установив мировой рекорд среди спортивных программистов.",
        city: "Ярославль",
        year: 21
    ),
    TeamModel(
        url: "images/team4.png",
        name: "Оксана Хохлотян",
        status: "Продуктовый дизайнер",
        phoneNumber: "+7 920 103-45-76",
        email: "vanilka1000-7@mail.ru",
        summary: "Продуктовый менеджер, бизнесмен, владелец стартап-студии. Создал 23 успешных продукта, актуальных и по сей день.",
        city: "Ярославль",
        year: 21
    ),
    TeamModel(
        url: "images/team5.png",
        name: "Семен Колесников",
        status: "Full stack",
        phoneNumber: "+7 920 103-45-76",
        email: "vanilka1000-7@mail.ru",
        summary: "Full stack, бизнесмен, владелец стартап-студии. Создал 1 успешных коммита за 23 года, установив мировой рекорд среди спортивных программистов.",
        city: "Ярославль",
        year: 21
    )
  ];

  PageController pageController = PageController();
  TabController? tabController;

  bool isFavorite = false;

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Stack(
      children: [
        Image.asset(
            "images/background.png",
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width
        ),
        Padding(
          padding: const EdgeInsets.only(left: 110),
          child: SingleChildScrollView(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 2227,
                        width: 800,
                        margin: const EdgeInsets.only(top: 134),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.only(
                            top: 20,
                            left: 20
                        ),
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
                                  ),
                                  const SizedBox(width: 21)
                                ],
                              ),
                              const SizedBox(height: 20),
                              Container(
                                  height: 426,
                                  width: 760,
                                  margin: const EdgeInsets.only(right: 20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                  child: Stack(
                                      children: [
                                        PageView(
                                            controller: pageController,
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
                                                      onTap: () => setState(() => pageController.previousPage(
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
                                                      onTap: () => setState(() => pageController.nextPage(
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
                              Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Wrap(
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
                                  )
                              ),
                              const SizedBox(height: 30),
                              Container(
                                  height: 44,
                                  width: 225,
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
                              SizedBox(
                                  height: 104,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: similarModels.length,
                                      itemBuilder: (context, index) => Container(
                                          margin: const EdgeInsets.only(right: 20),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8)
                                          ),
                                          child: Stack(
                                              children: [
                                                Image.asset(similarModels[index].url!),
                                                Positioned(
                                                    bottom: 8,
                                                    left: 8,
                                                    right: 7,
                                                    child: Text(
                                                        similarModels[index].name!,
                                                        style: const TextStyle(
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 14,
                                                            color: Colors.white
                                                        )
                                                    )
                                                )
                                              ]
                                          )
                                      )
                                  )
                              ),
                              const SizedBox(height: 41),
                              TabBar(
                                  controller: tabController,
                                  indicatorColor: const Color(0xff009A96),
                                  indicatorWeight: 2,
                                  isScrollable: true,
                                  tabs: [
                                    tabBarTab("Сертификаты"),
                                    tabBarTab("СМИ"),
                                    tabBarTab("Команда"),
                                    tabBarTab("Презентация"),
                                    tabBarTab("Отчёты")
                                  ]
                              ),
                              SizedBox(
                                  height: 400,
                                  child: TabBarView(
                                      controller: tabController,
                                      children: [
                                        Row(
                                            children: [
                                              certificate("Сертификат соответствия", 1),
                                              certificate("Лучший в теме", 2),
                                              certificate("Лучшая защита", 3),
                                            ]
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                top: 50,
                                                right: 16
                                            ),
                                            child: Row(
                                                children: [
                                                  Container(
                                                      height: 290.14,
                                                      width: 465,
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(20)
                                                      ),
                                                      child: Stack(
                                                          children: [
                                                            Image.asset("images/MM1.png"),
                                                            Positioned(
                                                                left: 16,
                                                                right: 13.83,
                                                                bottom: 16.14,
                                                                child: Column(
                                                                    children: const [
                                                                      Text(
                                                                          "24 февраля 2021",
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16,
                                                                              color: Colors.white
                                                                          )
                                                                      ),
                                                                      SizedBox(height: 6),
                                                                      Text(
                                                                        "СМИ о Traffic Data: телеканал ТВЦ с репортажем про достижения акселератора",
                                                                        style: TextStyle(
                                                                            fontWeight: FontWeight.w600,
                                                                            fontSize: 20,
                                                                            color: Colors.white
                                                                        ),
                                                                      )
                                                                    ]
                                                                )
                                                            )
                                                          ]
                                                      )
                                                  ),
                                                  const SizedBox(width: 20),
                                                  Container(
                                                      height: 290,
                                                      width: 279,
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(20)
                                                      ),
                                                      child: Stack(
                                                          children: [
                                                            Image.asset("images/MM2.png"),
                                                            Positioned(
                                                                bottom: 12,
                                                                left: 12,
                                                                right: 26,
                                                                child: Column(
                                                                    children: const [
                                                                      Text(
                                                                          "17 февраля 2021",
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16,
                                                                              color: Colors.white
                                                                          )
                                                                      ),
                                                                      SizedBox(height: 6),
                                                                      Text(
                                                                          "Чем полезны государственные акселераторы?",
                                                                          style: TextStyle(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontSize: 20,
                                                                              color: Colors.white
                                                                          )
                                                                      )
                                                                    ]
                                                                )
                                                            )
                                                          ]
                                                      )
                                                  )
                                                ]
                                            )
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                top: 33,
                                                right: 20
                                            ),
                                            child: ListView.builder(
                                                itemCount: teamModels.length,
                                                itemBuilder: (context, index) => Container(
                                                    height: 148,
                                                    margin: const EdgeInsets.only(bottom: 20),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(12)
                                                    ),
                                                    child: Column(
                                                        children: [
                                                          Row(
                                                              children: [
                                                                CircleAvatar(
                                                                    child: Image.asset(
                                                                        teamModels[index].url!,
                                                                        height: 66,
                                                                        width: 66
                                                                    )
                                                                ),
                                                                const SizedBox(width: 10),
                                                                Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Text(
                                                                          teamModels[index].name!,
                                                                          style: const TextStyle(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontSize: 18,
                                                                              color: Color(0xff25222C)
                                                                          )
                                                                      ),
                                                                      const SizedBox(height: 2),
                                                                      Text(
                                                                          teamModels[index].status!,
                                                                          style: const TextStyle(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16,
                                                                              color: Color(0xff66646B)
                                                                          )
                                                                      ),
                                                                      const SizedBox(height: 2),
                                                                      Text(
                                                                          "${teamModels[index].phoneNumber}, ${teamModels[index].email}",
                                                                          style: const TextStyle(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16,
                                                                              color: Color(0xff009A96)
                                                                          )
                                                                      )
                                                                    ]
                                                                ),
                                                                const Spacer(),
                                                                Text(
                                                                    "г. ${teamModels[index].city}, ${teamModels[index].year} год",
                                                                    style: const TextStyle(
                                                                        fontWeight: FontWeight.w500,
                                                                        fontSize: 14,
                                                                        color: Color(0xff9E9EA2)
                                                                    )
                                                                )
                                                              ]
                                                          ),
                                                          const SizedBox(height: 12),
                                                          Text(
                                                              teamModels[index].summary!,
                                                              style: const TextStyle(
                                                                  fontWeight: FontWeight.w500,
                                                                  fontSize: 16,
                                                                  color: Color(0xff66646B)
                                                              )
                                                          )
                                                        ]
                                                    )
                                                )
                                            )
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.only(top: 46),
                                            child: Align(
                                                alignment: Alignment.center,
                                                child: Container(
                                                    height: 161,
                                                    width: 287,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8)
                                                    ),
                                                    child: Stack(
                                                        children: [
                                                          Image.asset(
                                                              "images/presentation.png"
                                                          ),
                                                          Column(
                                                              children: const [
                                                                SizedBox(height: 20),
                                                                Text(
                                                                    "Презентация",
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight.w600,
                                                                        fontSize: 16,
                                                                        color: Colors.white
                                                                    )
                                                                ),
                                                                SizedBox(height: 8),
                                                                Text(
                                                                    "Traffic Data: узнать все о транспортных потоках",
                                                                    style: TextStyle(
                                                                        fontWeight: FontWeight.w500,
                                                                        fontSize: 14,
                                                                        color: Colors.white
                                                                    )
                                                                ),
                                                                SizedBox(height: 32),
                                                                MyDownload()
                                                              ]
                                                          )
                                                        ]
                                                    )
                                                )
                                            )
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.only(top: 37),
                                            child: Row(
                                                children: [
                                                  certificate("Отчёт", 4),
                                                  certificate("Отчёт", 5),
                                                  certificate("Отчёт", 4),
                                                  certificate("Отчёт", 5),
                                                ]
                                            )
                                        )
                                      ]
                                  )
                              )
                            ]
                        )
                    ),
                    const SizedBox(width: 40),
                    Column(
                        children: [
                          Container(
                            height: 54,
                              width: 380,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 134),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16)
                              ),
                              child: const Text(
                                  "Проект получил новый сертификат!",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Color(0xff66646B)
                                  )
                              )
                          ),
                          const SizedBox(height: 16),
                          Container(
                            height: 128,
                              width: 380,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16)
                              ),
                              child: Column(
                                  children: [
                                    Row(
                                        children: [
                                          CircleAvatar(
                                              child: Image.asset("images/avatar.png")
                                          ),
                                          Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: const [
                                                Text(
                                                    "Ксения Ливина",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 16,
                                                        color: Color(0xff25222C)
                                                    )
                                                ),
                                                SizedBox(height: 3),
                                                Text(
                                                    "12 октября",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 14,
                                                        color: Color(0xffB0AFB3)
                                                    )
                                                )
                                              ]
                                          )
                                        ]
                                    ),
                                    const SizedBox(height: 12),
                                    const Text(
                                        "Лучшего решения проблемы я еще не видела!",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                            color: Color(0xff66646B)
                                        )
                                    )
                                  ]
                              )
                          ),
                          const SizedBox(height: 16),
                          Container(
                              height: 54,
                              width: 380,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16)
                              ),
                              child: const Text(
                                  "Ура! Прототип проекта готов!",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Color(0xff66646B)
                                  )
                              )
                          ),
                          const SizedBox(height: 16),
                          Container(
                              height: 54,
                              width: 380,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16)
                              ),
                              child: const Text(
                                  "Проект получил новый сертификат!",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Color(0xff66646B)
                                  )
                              )
                          ),
                          const SizedBox(height: 16),
                          Container(
                              height: 126,
                              width: 380,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16)
                              ),
                              child: Column(
                                  children: [
                                    Row(
                                        children: [
                                          CircleAvatar(
                                              child: Image.asset("images/avatar.png")
                                          ),
                                          Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: const [
                                                Text(
                                                    "Ксения Ливина",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 16,
                                                        color: Color(0xff25222C)
                                                    )
                                                ),
                                                SizedBox(height: 3),
                                                Text(
                                                    "12 октября",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 14,
                                                        color: Color(0xffB0AFB3)
                                                    )
                                                )
                                              ]
                                          )
                                        ]
                                    ),
                                    const SizedBox(height: 12),
                                    const Text(
                                        "Выдаёт решения мечты!",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                            color: Color(0xff66646B)
                                        )
                                    )
                                  ]
                              )
                          )
                        ]
                    )
                  ]
              )
          )
        )
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

  Padding body(String text) => Padding(
    padding: const EdgeInsets.only(right: 20),
    child: Text(
        text,
        style: const TextStyle(
            fontSize: 16,
            color: Color(0xff66646B)
        )
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

  Tab tabBarTab(String text) => Tab(
    child: Text(
      text,
      style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: Color(0xff25222C)
      )
    )
  );

  Container certificate(String text, int index) => Container(
    height: 193,
    width: 144,
    margin: const EdgeInsets.only(right: 30),
    child: Stack(
        children: [
          Container(
            height: 180,
            width: 144,
            decoration: BoxDecoration(
                color: const Color(0xffEBF7F7),
                borderRadius: BorderRadius.circular(8)
            ),
            child: Column(
              children: [
                const SizedBox(height: 33.03),
                Image.asset("images/certificate$index.png"),
                const SizedBox(height: 25.06),
                Text(
                  text,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xff009A96)
                  )
                )
              ]
            )
          ),
          const Positioned(
            bottom: 0,
            left: 13,
            right: 12,
            child: MyDownload()
          )
        ]
    )
  );
}