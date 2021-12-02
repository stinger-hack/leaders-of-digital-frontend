import 'package:flutter/material.dart';
import 'package:stinger_web/requests.dart';

class ProjectCard extends StatefulWidget {
  final String id;
  final String title;

  const ProjectCard({
    Key? key,
    required this.id,
    required this.title,
  }) : super(key: key);

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isLoading = true;

  // List<ProductsCatalog>? productList;

  @override
  void initState() {
    // HttpRequests().getProductsCategories().then((value) {
    //   if (value != null) {
    //     setState(() {
    //       productList = value;
    //       isLoading = false;
    //     });
    //   } else {
    //     var snackBar = const SnackBar(content: Text("Что-то пошло не так"));
    //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //   }
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      width: double.infinity,
      height: double.infinity,
      child: GestureDetector(
        onTap: onClick,
        child: Text('ллололололо'),
      ),
    );
  }

  onClick() {
    print('lolol');
  }
}
