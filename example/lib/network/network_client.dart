abstract class NetworkClient<T> {
  final bool isRecording;
  final bool isMockMode;
  NetworkClient({required this.isRecording, required this.isMockMode});
  Future<T> get(String url);
  Future<T> post(String url, dynamic data);
}
