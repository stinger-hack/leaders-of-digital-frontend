import 'package:flutter/material.dart';

class DemoDay extends StatelessWidget {
  const DemoDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    height: 396,
    width: 438,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 20,
            right: 16,
            bottom: 20
          ),
          child: Row(
            children: [
              const Text(
                "Demo day: Метрополитен",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Color(0xff25222C)
                )
              ),
              const Spacer(),
              Image.asset("assets/images/share.png")
            ]
          )
        ),
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(width: 16),
                Image.asset("images/demo_day1.png"),
                const SizedBox(width: 14),
                Image.asset("images/demo_day2.png")
              ]
          )
        ),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
              "В этой, тринадцатой статье из серии «Менеджмент цифрового мира» я продолжу рассмотрение схемы скрам и буду говорить про завершение спринта – Демо, оно же Sprint Review и Ретроспективу.",
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff66646B)
              )
          )
        ),
        const SizedBox(height: 20),
        Container(
          height: 44,
          width: 196,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: const [BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 20,
              color: Color.fromRGBO(0, 0, 0, 0.1)
            )]
          ),
          child: const Text(
            "Присоединиться",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Color(0xff25222C)
            )
          )
        )
      ]
    )
  );
}