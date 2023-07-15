import 'dart:convert';
import 'package:uuid/uuid.dart';


// ignore_for_file: public_member_api_docs, sort_constructors_first
class ChatModel {
  final String id = const Uuid().v4();
  final String message;
  final bool isMe;
  final bool isImage;
  ChatModel({
    required this.message,
    required this.isMe,
    required this.isImage,
  });

  ChatModel copyWith({
    String? message,
    bool? isMe,
    bool? isImage,
  }) {
    return ChatModel(
      message: message ?? this.message,
      isMe: isMe ?? this.isMe,
      isImage: isImage ?? this.isImage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'isMe': isMe,
      'isImage': isImage,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      message: map['message'] as String,
      isMe: map['isMe'] as bool,
      isImage: map['isImage'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) => ChatModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ChatModel(message: $message, isMe: $isMe, isImage: $isImage)';

  @override
  bool operator ==(covariant ChatModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.message == message &&
      other.isMe == isMe &&
      other.isImage == isImage;
  }

  @override
  int get hashCode => message.hashCode ^ isMe.hashCode ^ isImage.hashCode;
}
