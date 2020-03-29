class Copper {
  double _copperOre = 0;
  double _copperVein = 0;
  double _copperYield = 1;
  double _copperIngot = 0;

  get copperValue => _copperOre;

  get copperYield => _copperYield;

  get copperIngot => _copperIngot;

  get copperVein => _copperVein;

  setCopperValue(double amount) {
    _copperVein = _copperVein + (amount * copperYield);
  }

  clear() {
    _copperOre = 0;
    _copperYield = 0;
    _copperIngot = 0;
    _copperVein = 0;
  }
}
