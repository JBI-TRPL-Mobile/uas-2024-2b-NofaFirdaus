class Message {
  final String name;
  final String email;
  final String message;

  Message({
    required this.name,
    required this.email,
    required this.message,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      name: json['name'],
      email: json['email'],
      message: json['message'],
    );
  }
}
