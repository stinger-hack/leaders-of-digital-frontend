import 'package:flutter/material.dart';
import 'package:stinger_web/components/my_circular_indicator.dart';
import 'package:stinger_web/components/my_searchfield.dart';
import 'package:stinger_web/models/favorite_model.dart';
import 'package:stinger_web/models/showcase_model.dart';
import 'package:stinger_web/pages/showcase/project_card.dart';

import '../../constants.dart';
import '../../requests.dart';
import 'favorite_card.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  bool isLoading = true;
  var searchController = TextEditingController();
  List<Favorite> favorite = [];

  @override
  void initState() {
    HttpRequests().getFavorites().then((value) {
      if (value != null) {
        setState(() {
          favorite = value;
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
        body: CustomScrollView(slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(left: 110, right: 110, bottom: 20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                MySearchField(controller: searchController),
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
                      onTap: () {},
                      child: FavoriteCard(data: favorite[index])),
                  childCount: favorite.length),
              //padding: const EdgeInsets.all(15),
            ),
          )
        ]));
  }
}
