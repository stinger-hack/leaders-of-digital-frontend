import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:stinger_web/components/my_circular_indicator.dart';
import 'package:stinger_web/create_project/create_project_page.dart';
import 'package:stinger_web/models/showcase_model.dart';
import 'package:stinger_web/pages/showcase/project_card.dart';
import 'package:stinger_web/requests.dart';
import '../../constants.dart';

/**
 * Заглавный экран витрины
 */
class ShowcasePage extends StatefulWidget {
  const ShowcasePage({Key? key}) : super(key: key);

  @override
  _ShowcasePageState createState() => _ShowcasePageState();
}

class _ShowcasePageState extends State<ShowcasePage> {
  bool isLoading = true;
  var searchController = TextEditingController();
  List<Showcase> showcase = [];
  List<Showcase> showcase2 = [];

  @override
  void initState() {
    HttpRequests().getCategories().then((value) {
      if (value != null) {
        setState(() {
          showcase = value;
          showcase2 = value;
          isLoading = false;
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
        ? Center(child: Indicator.circle)
        : Padding(
      padding: const EdgeInsets.symmetric(horizontal: 110),
      child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: shadow,
                                blurRadius: 1,
                                spreadRadius: 1,
                                offset: const Offset(0, 1),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextField(
                            controller: searchController,
                            onChanged: (text) {
                              if (text.isEmpty) {
                                setState(() {
                                  showcase = showcase2;
                                });
                              }
                              else {
                                showcase = [];
                                for (var i in showcase2) {
                                  if (i.projectName.contains(text)) {
                                    showcase.add(i);
                                  }
                                }
                                setState(() {});
                              }
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: white,
                              labelText: 'Поиск',
                              labelStyle: TextStyle(color: semiGrey),
                              prefixIcon: const Icon(Icons.search),
                              hoverColor: white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 1, color: white),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 1, color: mainGreen),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          )
                      )
                  ),
                  const SizedBox(width: 40),
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                          height: 48,
                          width: 170,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: const [BoxShadow(
                                  offset: Offset(0, 2),
                                  blurRadius: 10,
                                  color: Color.fromRGBO(0, 0, 0, 0.05)
                              )]
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("images/filter.png"),
                                const SizedBox(width: 6),
                                const Text(
                                    "Фильтры",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Color(0xff25222C)
                                    )
                                )
                              ]
                          )
                      )
                  ),
                  const SizedBox(width: 40),
                  OpenContainer(
                    transitionType: ContainerTransitionType.fade,
                    openBuilder: (BuildContext context, VoidCallback _) {
                      return const CreateProjectPage();
                    },
                    closedElevation: 6.0,
                    closedShape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(28.0)
                        )
                    ),
                    closedColor: Theme.of(context).colorScheme.secondary,
                    closedBuilder: (BuildContext context, VoidCallback openContainer) {
                      return Container(
                          height: 48,
                          width: 170,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: const [BoxShadow(
                                  offset: Offset(0, 2),
                                  blurRadius: 10,
                                  color: Color.fromRGBO(0, 0, 0, 0.05)
                              )]
                          ),
                          child: const Text(
                              "Загрузить",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color(0xff25222C)
                              )
                          )
                      );
                    },
                  )
                ]
            ),
            const SizedBox(height: 40),
            Expanded(
                child: AnimationLimiter(
                    child: GridView.builder(
                        itemCount: showcase.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 590/428,
                          crossAxisCount: 2,
                          crossAxisSpacing: 40,
                          mainAxisSpacing: 40,
                        ),
                        itemBuilder: (context, index) => AnimationConfiguration.staggeredGrid(
                            columnCount: 2,
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            child: ScaleAnimation(
                                scale: 0.5,
                                child: FadeInAnimation(
                                    child: ProjectCard(data: showcase[index])
                                )
                            )
                        )
                    )
                )
            )
          ]
      )
    );
  }
}