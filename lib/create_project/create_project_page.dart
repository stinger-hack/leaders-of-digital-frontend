import 'package:flutter/material.dart';

import '../constants.dart';

class CreateProjectPage extends StatefulWidget {
  const CreateProjectPage({Key? key}) : super(key: key);

  @override
  _CreateProjectPageState createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset('assets/images/backAuth.png',
                fit: BoxFit.cover, width: double.infinity, height: 1300),
            Column(
              children: [
                SizedBox(
                  height: 1000,
                  width: double.infinity,
                  child: Center(
                    child: ClipRRect(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          boxShadow: [BoxShadow(color: shadow, blurRadius: 20)],
                          color: white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.all(30),
                        height: 800,
                        width: 800,
                        child: Container(
                          child: Column(
                            children: [
                              const Text(
                                'Загрузка проекта',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600),
                              ),
                              textArea(
                                  'Наименование команды/организации',
                                  'Введите название команды',
                                  true,
                                  nameController),
                              textArea(
                                  'Наименование команды/организации',
                                  'Введите название команды',
                                  true,
                                  nameController),textArea(
                                  'Наименование команды/организации',
                                  'Введите название команды',
                                  true,
                                  nameController),textArea(
                                  'Наименование команды/организации',
                                  'Введите название команды',
                                  true,
                                  nameController),textArea(
                                  'Наименование команды/организации',
                                  'Введите название команды',
                                  true,
                                  nameController),




                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  textArea(String title, String tip, bool required,
          TextEditingController controller) =>
      Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Container(
                    child: FittedBox(
                        child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ))),
                required
                    ? const Text(
                        '*',
                        style: TextStyle(color: Colors.red, fontSize: 18),
                      )
                    : Container()
              ],
            ),
            const SizedBox(height: 12),
            Container(
                decoration: BoxDecoration(
                    color: textField, borderRadius: BorderRadius.circular(12)),
                child: TextFormField(
                    controller: controller,
                    cursorColor: text,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        border: InputBorder.none,
                        hintText: tip,
                        hintStyle: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: semiText)))),
          ]));
}
