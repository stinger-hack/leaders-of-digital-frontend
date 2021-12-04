import 'package:flutter/material.dart';

/**
 * Поиск на карте
 */
class MapSearch extends StatefulWidget {
  const MapSearch({Key? key}) : super(key: key);


  @override
  State<MapSearch> createState() => _MapSearchState();
}

class _MapSearchState extends State<MapSearch> {
  TextEditingController? _controller;

  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();

    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
      height: 48,
      width: 438,
      padding: const EdgeInsets.only(
          top: 12,
          left: 16,
          bottom: 12,
          right: 17.5
      ),
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 10,
              color: Color.fromRGBO(0, 0, 0, 0.2)
          )]
      ),
      child: Row(
          children: [
            Expanded(
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Поиск",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Color(0xffD3D3D5)
                        )
                    )
                )
            ),
            GestureDetector(
              onTap: () => _focusNode.requestFocus(),
              child: const Icon(Icons.search)
            ),
            const SizedBox(width: 20.25),
            const Divider(),
            const SizedBox(width: 26),
            GestureDetector(
              onTap: () => setState(() => _controller!.text = ""),
              child: Image.asset("images/delete2.png")
            ),
            const SizedBox(width: 17.5)
          ]
      )
  );
}