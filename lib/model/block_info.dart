class BlockInfo {
  BlockInfo({this.value, this.current, this.before, this.myis = true}) {
    this.before = this.before == null ? this.current : this.before;
  }

  int value;
  int current;
  int before;
  bool needMove = false;
  bool needCombine = false;
  bool myis = false;

  void reset() {
    value = 0;
    needMove = false;
    needCombine = false;
    myis = false;
  }
}
