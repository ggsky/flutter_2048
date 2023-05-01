/// Description: 方块信息
/// Time       : 05/01/2023 Monday
/// Author     : liuyuqi.gov@msn.cn
class BlockInfo {
  /// 构造函数
  /// value: 值
  /// current: 当前位置
  /// before: 上一个位置
  /// myis: 是否是自己
  BlockInfo(
      {required this.value,
      required this.current,
      this.before,
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

  /// 重置
  void reset() {
    value = 0;
    needMove = false;
    needCombine = false;
    myis = false;
  }
}
