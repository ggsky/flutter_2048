class BlockInfo {
  BlockInfo(
      {required this.value,
      required this.current,
      this.before ,
      this.myis = true}) {
    if (this.before == null) {
      this.before = this.current;
    } else {
      this.before = this.before;
    }
  }

  int value;
  int current;
  int? before;
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
