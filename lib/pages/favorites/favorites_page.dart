import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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
        ? Center(child: Indicator.circle)
        : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 110),
        child: Column(
            children: [
              MySearchField(controller: searchController, isFavorite: true),
              const SizedBox(height: 40),
              Expanded(
                  child: AnimationLimiter(
                      child: GridView.builder(
                          itemCount: favorite.length,
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
                                      child: FavoriteCard(data: favorite[index])
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
