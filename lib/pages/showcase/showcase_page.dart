import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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
        ? Center(child: Indicator.circle)
        : Padding(
      padding: const EdgeInsets.symmetric(horizontal: 110),
      child: Column(
          children: [
            MySearchField(controller: searchController),
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