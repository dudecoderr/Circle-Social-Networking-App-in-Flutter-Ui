import 'package:get/get.dart';

class User {
  final String? name;
  final String? avatar;
  bool isSelected;
  User({this.name, this.avatar, required this.isSelected});
}

List<User> userList = [
  User(name: "Art", avatar: "🎨", isSelected: false),
  User(name: "Cars", avatar: "🚓", isSelected: false),
  User(name: "Photography", avatar: "📷", isSelected: false),
  User(name: "Reading", avatar: "📚", isSelected: false),
  User(name: "Shopping", avatar: "🛒", isSelected: false),
  User(name: "Aquarium", avatar: "🐟", isSelected: false),
  User(name: "Running", avatar: "🏃", isSelected: false),
  User(name: "Coffee", avatar: "☕", isSelected: false),
  User(name: "Start UPs", avatar: "🦄", isSelected: false),
  User(name: "Meditation", avatar: "🧘", isSelected: false),
  User(name: "GYM", avatar: "💪", isSelected: false),
  User(name: "Investing", avatar: "📊", isSelected: false),
  User(name: "Game", avatar: "🎮", isSelected: false),
  User(name: "Burger", avatar: "🍔", isSelected: false),
  User(name: "Podcast", avatar: "🎧", isSelected: false),
  User(name: "Cinema", avatar: "🎞️", isSelected: false),
  User(name: "Nft's", avatar: "💀", isSelected: false),
  User(name: "Party", avatar: "🎉", isSelected: false),
  User(name: "Real Estate", avatar: "🏠", isSelected: false),
  User(name: "Hiking", avatar: "🌎", isSelected: false),
  User(name: "Art galleries", avatar: "🖼️", isSelected: false),
  User(name: "Makeup", avatar: "💄", isSelected: false),
  User(name: "Iced Tes", avatar: "🫖", isSelected: false),
  User(name: "Archery", avatar: "🏹", isSelected: false),
  User(name: "Traveling", avatar: "🧳", isSelected: false),
  User(name: "Music", avatar: "🎵", isSelected: false),
  User(name: "Badminton", avatar: "🏸", isSelected: false),
  User(name: "Swimming", avatar: "🏊‍‍", isSelected: false),
  User(name: "Love", avatar: "❤", isSelected: false),
];
RxList<User> selectedUserList = <User>[].obs;
