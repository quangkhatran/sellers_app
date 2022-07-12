import 'package:flutter/material.dart';

import '../widgets/my_drawer.dart';
import '../widgets/text_widget.dart';
import '../global/global.dart';
import '../model/menus.dart';
import '../uploadScreens/menus_upload_screen.dart';
import '../uploadScreens/items_upload_screen.dart';

class ItemsScreen extends StatefulWidget {
  final Menus? model;
  ItemsScreen({this.model});

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.cyan,
                Colors.amber,
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        title: Text(
          sharedPreferences!.getString('name')!,
          style: const TextStyle(
            fontSize: 30,
            fontFamily: 'Lobster',
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.library_add,
              color: Colors.cyan,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (c) => ItemsUploadScreen(model: widget.model)));
            },
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: CustomScrollView(slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: TextWidgetHeader(
              title: 'My ' + widget.model!.menuTitle.toString() + '\'s Items'),
        ),
      ]),
    );
  }
}
