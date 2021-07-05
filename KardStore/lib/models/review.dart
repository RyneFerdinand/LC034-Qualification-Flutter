class Review {
  int _packId;
  String _reviewerUsername;
  String _review;

  Review(this._packId, this._reviewerUsername, this._review);

  int getID() {
    return _packId;
  }

  String getUsername() {
    return _reviewerUsername;
  }

  String getReview() {
    return _review;
  }
}
