class CardPack {
  int _packId;
  String _packSrc;
  String _packName;
  int _packPrice;
  String _packDesc;

  CardPack(this._packId, this._packSrc, this._packName, this._packDesc,
      this._packPrice);

  int getID() {
    return _packId;
  }

  String getSource() {
    return _packSrc;
  }

  String getName() {
    return _packName;
  }

  int getPrice() {
    return _packPrice;
  }

  String getDescription() {
    return _packDesc;
  }
}
