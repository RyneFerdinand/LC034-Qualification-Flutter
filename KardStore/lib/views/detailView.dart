import 'package:code/models/review.dart';
import 'package:flutter/material.dart';
import 'package:code/utils/globals.dart' as globals;

class DetailPage extends StatefulWidget {
  int packId;
  String packSrc;
  String packName;
  String packDescription;
  int packPrice;

  DetailPage(this.packId, this.packSrc, this.packName, this.packDescription,
      this.packPrice);

  @override
  State<StatefulWidget> createState() {
    return DetailPageState(
        packId, packSrc, packName, packDescription, packPrice);
  }
}

class DetailPageState extends State<DetailPage> {
  int packId;
  String packSrc;
  String packName;
  String packDescription;
  int packPrice;
  var reviewControl = TextEditingController();
  var currReviews = [];

  DetailPageState(this.packId, this.packSrc, this.packName,
      this.packDescription, this.packPrice);

  // initialize by filtering reviews from globals
  void initReviews() {
    if (currReviews.isEmpty) {
      for (Review rev in globals.reviewList) {
        if (rev.getID() == packId) {
          currReviews.add(rev);
        }
      }
    }
  }

  // validate review
  void validateReview(BuildContext context) {
    // review String
    String review = reviewControl.text.trim();
    // check if review is empty
    if (review.isEmpty) {
      // show snackbar
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Review can\'t be empty !')));
    } else {
      // if it's not empty, set the textfield to empty, clear currReviews, and add the new review to globals' reviewList
      reviewControl.text = '';
      Review newRev = new Review(this.packId, globals.username, review.trim());
      currReviews.clear();
      setState(() {
        globals.reviewList.add(newRev);
      });
    }
  }

  Widget _createReviewList(Review rev) {
    // create review lists' card
    return Card(
      child: ListTile(
        title: Column(
          children: [
            Row(
              children: [
                // the person icon
                Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 20, 10),
                    child: Icon(Icons.person)),
                // the reviewer's name
                Container(
                    child: Text(
                  rev.getUsername(),
                  style: TextStyle(fontSize: 20),
                )),
              ],
            ),
            // the review
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 45),
                child: Text(
                  rev.getReview(),
                  style: TextStyle(fontSize: 20),
                )),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // initialize review
    initReviews();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // creating tabs
        appBar: AppBar(
          title: Text(packName),
          bottom: TabBar(tabs: [
            Tab(icon: Icon(Icons.info)),
            Tab(icon: Icon(Icons.reviews))
          ]),
        ),
        // creating the view below the tabs
        body: TabBarView(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // the pack image
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  child: Image(
                    image: AssetImage(
                      'assets/${this.packSrc}',
                    ),
                    height: 300,
                  ),
                ),
                // the pack's name
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    this.packName,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                // the pack's price
                Text(
                  '\$${this.packPrice.toString()}',
                  style: TextStyle(fontSize: 35),
                ),
                // the pack's description
                Container(
                  margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Text(
                    this.packDescription,
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.justify,
                  ),
                ),
                // the 'write a review' text
                Container(
                    margin: EdgeInsets.fromLTRB(15, 30, 15, 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Write a Review:',
                      style: TextStyle(fontSize: 25),
                    )),
                // the textfield
                Container(
                  margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: TextField(
                    maxLines: 8,
                    decoration: InputDecoration(
                      hintText: 'Write your Review !',
                      border: OutlineInputBorder(),
                    ),
                    controller: reviewControl,
                  ),
                ),
                // the submit review button
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      // validate review on press
                      validateReview(context);
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // the reviews
          Container(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
            // create review cards
            child: ListView(
                children: currReviews
                    .map((review) => _createReviewList(review))
                    .toList()),
          ),
        ]),
      ),
    );
  }
}
