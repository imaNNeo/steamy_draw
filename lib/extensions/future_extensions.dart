extension FutureExtensions <T> on Future<T> {
  Future<T?> getOrNull() async {
    try {
      return await this;
    } catch(e) {
      return null;
    }
  }
}
