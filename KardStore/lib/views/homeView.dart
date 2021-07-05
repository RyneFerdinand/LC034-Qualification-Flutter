import 'package:carousel_slider/carousel_slider.dart';
import 'package:code/models/cardPack.dart';
import 'package:code/views/navigationView.dart';
import 'package:flutter/material.dart';
import 'package:code/utils/globals.dart' as globals;

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  // for pop up menu
  var popUp = ['Toggle Theme'];

  // method for creating card for list
  Widget _createPackList(CardPack pack) {
    return Card(
      child: ListTile(
        leading: Image.asset('assets/${pack.getSource()}'),
        title: Column(
          children: [
            Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  pack.getName(),
                  style: TextStyle(fontSize: 20),
                )),
            Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '\$ ${pack.getPrice().toString()}',
                  style: TextStyle(fontSize: 20),
                )),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Kard Store'),
          actions: [
            // for pop up menu (toggle theme)
            PopupMenuButton(itemBuilder: (context) {
              return popUp.map((e) {
                return PopupMenuItem(
                    child: TextButton(
                  child: Text('Toggle Theme'),
                  onPressed: (() {
                    // call the currTheme at globals to change theme
                    globals.currTheme.changeTheme();
                  }),
                ));
              }).toList();
            })
          ],
        ),
        // drawer for navigation bar
        drawer: NavBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // The title Text
              Container(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                  'Featured Deck Banners',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              // the Carousel
              CarouselSlider(
                  // Take data from globals and then map to make slider
                  items: globals.carouselList
                      .map((e) => Image(image: AssetImage(e)))
                      .toList(),
                  options: CarouselOptions(
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 2),
                  )),
              // for the week's card highlights
              Column(
                children: [
                  // the title text
                  Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(
                        'This Week\'s Card Highlights',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      )),
                  // the card images (data taken from globals)
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 40, 0, 30),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 27),
                          child: Image(
                            image: AssetImage(globals.cardList[0]),
                            height: 120,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 25),
                          child: Image(
                            image: AssetImage(globals.cardList[1]),
                            height: 120,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 27),
                          child: Image(
                            image: AssetImage(globals.cardList[2]),
                            height: 120,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Best Selling Packs Section
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 30),
                alignment: Alignment.centerLeft,
                // the title text
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    'Best Selling Packs',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // the list
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Column(
                  children: globals.tempPackList
                      .map((pack) => _createPackList(pack))
                      .toList(),
                ),
              ),
            ],
          ),
        ));
  }
}
