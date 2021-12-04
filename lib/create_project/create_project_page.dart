import 'package:flutter/material.dart';
import 'package:stinger_web/components/my_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:stinger_web/components/my_snackbar.dart';
import 'package:stinger_web/requests.dart';
import '../constants.dart';

/**
 * Форма добавления\импорта проекта
 */
class CreateProjectPage extends StatefulWidget {
  const CreateProjectPage({Key? key}) : super(key: key);

  @override
  _CreateProjectPageState createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController stageController = TextEditingController();
  TextEditingController descrController = TextEditingController();
  TextEditingController usefulController = TextEditingController();
  TextEditingController intrestingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    PlatformFile objFile = PlatformFile(name: 'upload_file', size: 0);
    Future<bool> chooseFileUsingFilePicker() async {

      var result = await FilePicker.platform.pickFiles(withReadStream: true);
      if (result != null) {
        setState(() {
          objFile = result.files.single;
          HttpRequests().uploadSelectedFile(objFile).then((value) {
            Navigator.of(context).pop();
            return true;
          });
        });
      }
      return false;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset('assets/images/backAuth.png',
                fit: BoxFit.cover, width: double.infinity, height: 1300),
            Container(
              alignment: Alignment.center,
              child: ClipRRect(
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: shadow, blurRadius: 10, spreadRadius: 1)
                    ],
                    color: white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(30),
                  margin: const EdgeInsets.all(10),
                  width: 800,
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      const Text(
                        'Загрузка проекта',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                      textArea('Наименование команды/организации',
                          'Введите название команды', true, nameController),
                      textArea('Стадия готовности продукта',
                          'Идея / прототип / продукт', true, stageController),
                      textArea(
                          'Краткое описание продукта',
                          'Кратко опишите что делает ваш продукт',
                          true,
                          descrController),
                      textArea(
                          'Польза продукта',
                          'В чем заключается польза продукта?',
                          true,
                          usefulController),
                      textArea(
                          'Организация Московского транспорта, интересная в первую очередь',
                          'Напишите организацию, которая вам интересна',
                          true,
                          intrestingController),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: MyButton(
                                onTap: () {
                                  Navigator.of(context).pop();
                                  MySnackbar.show(context, 'Форма отправлена');
                                },
                                txt: 'Отправить'),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              'или',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Expanded(
                            child: MyButton(
                                onTap: () {
                                  chooseFileUsingFilePicker().then((value) {
                                    MySnackbar.show(context, 'Файл успешно загружен');
                                  });
                                },
                                txt: 'Загрузить из файла'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  textArea(String title, String tip, bool required,
          TextEditingController controller) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  child: FittedBox(
                      child: Text(title,
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500))),
                ),
                required
                    ? const Text('*',
                        style: TextStyle(color: Colors.red, fontSize: 18))
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
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  border: InputBorder.none,
                  hintText: tip,
                  hintStyle: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: semiText,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
