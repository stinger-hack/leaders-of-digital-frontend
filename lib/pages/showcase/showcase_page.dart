import 'package:flutter/material.dart';
import 'package:stinger_web/components/my_appbar.dart';
import 'package:stinger_web/components/my_circular_indicator.dart';
import 'package:stinger_web/components/my_searchfield.dart';
import 'package:stinger_web/models/showcase_model.dart';
import 'package:stinger_web/pages/showcase/project_card.dart';
import 'package:stinger_web/requests.dart';

import '../../constants.dart';

class ShowcasePage extends StatefulWidget {
  const ShowcasePage({Key? key}) : super(key: key);

  @override
  _ShowcasePageState createState() => _ShowcasePageState();
}

class _ShowcasePageState extends State<ShowcasePage> {
  bool isLoading = true;
  var searchController = TextEditingController();
  List<Showcase> showcase = [];

  @override
  void initState() {
    HttpRequests().getCategories().then((value) {
      if (value != null) {
        print("фвфы $value");
        setState(() {
          showcase = value;
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
        ? Scaffold(body: Center(child: Indicator.circle))
        : Scaffold(
            backgroundColor: background,
            body: CustomScrollView(slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 40),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    const MyAppBar(selectedPage: 0),
                    const SizedBox(height: 21),
                    MySearchField(controller: searchController),
                    const SizedBox(height: 20),
                  ]),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 110),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.5,
                    crossAxisCount: 2,
                    crossAxisSpacing: 40,
                    mainAxisSpacing: 40,
                  ),
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) => GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ProjectCard(data: showcase[index]))),
                          child: ProjectCard(data: showcase[index])),
                      childCount: showcase.length),
                  //padding: const EdgeInsets.all(15),
                ),
              )
            ]));
  }
}
