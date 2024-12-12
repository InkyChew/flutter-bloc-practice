class Ticker {
  const Ticker();
  Stream<int> tick({required int ticks}) {
    return Stream.periodic(const Duration(seconds: 1), (idx) => ticks - idx - 1)
        .take(ticks);
  }
}
