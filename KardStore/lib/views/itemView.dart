import 'package:code/models/cardPack.dart';
import 'package:code/views/detailView.dart';
import 'package:code/views/navigationView.dart';
import 'package:flutter/material.dart';
import 'package:code/utils/globals.dart' as globals;

class ItemPage extends StatelessWidget {
  // function to redirect to details page
  void _redirectToDetails(CardPack pack, BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (builder) {
      return DetailPage(pack.getID(), pack.getSource(), pack.getName(),
          pack.getDescription(), pack.getPrice());
    }));
  }

  // create cards for list
  Widget _createPackList(CardPack pack, BuildContext context) {
    return Card(
      child: ListTile(
        // when the card is tapped
        onTap: () {
          _redirectToDetails(pack, context);
        },
        // the pack image
        leading: Image.asset('assets/${pack.getSource()}'),
        // the text
        title: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                pack.getName(),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                '\$ ${pack.getPrice().toString()}',
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Kard List'),
        ),
        drawer: NavBar(),
        // map packList initialized at global
        body: ListView(
            children: globals.packList
                .map((pack) => _createPackList(pack, context))
                .toList()));
  }
}
