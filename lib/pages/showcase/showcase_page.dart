import 'package:flutter/material.dart';
import 'package:stinger_web/components/my_circular_indicator.dart';
import 'package:stinger_web/components/my_searchfield.dart';
import 'package:stinger_web/models/showcase_model.dart';
import 'package:stinger_web/pages/showcase/project_card.dart';
import 'package:stinger_web/requests.dart';

class ShowcasePage extends StatefulWidget {
  const ShowcasePage({Key? key}) : super(key: key);

  @override
  _ShowcasePageState createState() => _ShowcasePageState();
}

class _ShowcasePageState extends State<ShowcasePage> {
  bool isLoading = true;
  var searchController = TextEditingController();
  List<ProjectsModel>? projectList;

  @override
  void initState() {
    HttpRequests().getCategories().then((value) {
      if (value != null) {
        setState(() {
          // categoriesList = value;
          // isLoading = false;
        });
      } else {
        var snackBar = const SnackBar(content: Text("Что-то пошло не так"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(body: Center(child: Indicator.circle))
        : Scaffold(
            backgroundColor: Colors.white,
            body: CustomScrollView(slivers: [
              const SliverAppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  centerTitle: true,
                  title: Text("лол",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 30,
                          color: Color(0xff333333)))),
              SliverList(
                delegate: SliverChildListDelegate([
                  Stack(
                    children: [
                      Container(
                          width: double.infinity,
                          height: 217,
                          margin: const EdgeInsets.only(
                              top: 28, left: 16, right: 16, bottom: 37),
                          padding: const EdgeInsets.only(
                              top: 12, left: 19, right: 19),
                          decoration: BoxDecoration(
                              color: const Color(0xffDDF1CD),
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(children: const [
                            Text("Сезонная скидка",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24,
                                    color: Color(0xff333333))),
                            Text("на ягоды",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24,
                                    color: Color(0xff333333)))
                          ])),
                      Positioned(
                        top: 102,
                        left: 0,
                        right: 0,
                        child: Image.asset("images/discount.png", height: 180),
                      )
                    ],
                  ),
                  const Align(
                      alignment: Alignment.center,
                      child: Text("В разделе фрукты и овощи",
                          style: TextStyle(
                              fontSize: 12, color: Color(0xffAAAAAA)))),
                  const SizedBox(height: 21),
                  MySearchField(controller: searchController),
                  const SizedBox(height: 20),
                ]),
              ),
              // SliverPadding(
              //   padding: const EdgeInsets.symmetric(horizontal: 16),
              //   sliver: SliverGrid(
              //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //         childAspectRatio: 0.75, crossAxisCount: 2),
              //     delegate: SliverChildBuilderDelegate(
              //         (BuildContext context, int index) => GestureDetector(
              //             onTap: () => Navigator.of(context).push(
              //                 MaterialPageRoute(
              //                     builder: (BuildContext context) =>
              //                         ProjectCard(
              //                           id: projectList![index].categories,
              //                           title: projectList![index].title,
              //                         ))),
              //             child: Image.network(projectList![index].imgUrl)),
              //         childCount: projectList!.length),
              //     //padding: const EdgeInsets.all(15),
              //   ),
              // )
            ]));
  }
}
