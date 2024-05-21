class MessageModel {
  late final String message;
  late final String id;

  MessageModel(this.message, this.id);

  factory MessageModel.fromJson(json) {
    return MessageModel(
      json['message'] ?? "",
      json['id'] ?? "",
    );
  }
}
