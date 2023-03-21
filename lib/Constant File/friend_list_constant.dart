/*List<Listtile> Listtilelist = [
  Listtile(img: "assets/profile_1.png", description: "Abil Le Roy"),
  Listtile(img: "assets/profile_2.png", description: "Anastasya Kokfasih"),
  Listtile(img: "assets/profile_3.png", description: "Aaroon Davies"),
  Listtile(img: "assets/profile_4.png", description: "Alexander Arnold"),
  Listtile(img: "assets/profile_5.png", description: "Bima Sakti Banget"),
  Listtile(img: "assets/profile_6.png", description: "Bartolomeo Kuma"),
  Listtile(img: "assets/profile_3.png", description: "Christine Caroline"),
  Listtile(img: "assets/profile_1.png", description: "Abil Le patel"),
  Listtile(img: "assets/profile_2.png", description: "Anastasya Kokfasih"),
  Listtile(img: "assets/profile_3.png", description: "Aaroon Davies"),
  Listtile(img: "assets/profile_4.png", description: "Alexander Arnold"),
  Listtile(img: "assets/profile_5.png", description: "Bima Sakti Banget"),
  Listtile(img: "assets/profile_6.png", description: "Bartolomeo Kuma"),
  Listtile(img: "assets/profile_3.png", description: "Christine Caroline"),
];

class Listtile {
  final String? img;
  final String? description;
  final bool? isSelected;

  Listtile({required this.img, this.description, this.isSelected});
}*/

class ContactModel {
  String img;
  String description;
  bool isSelected;

  ContactModel(this.img, this.description, this.isSelected);
}

List<ContactModel> contacts = [
  ContactModel("assets/profile_1.png", "Abil Le Roy", false),
  ContactModel("assets/profile_2.png", "Anastasya Kokfasih", false),
  ContactModel("assets/profile_3.png", "Aaroon Davies", false),
  ContactModel("assets/profile_4.png", "Alexander Arnold", false),
  ContactModel("assets/profile_5.png", "Bima Sakti Banget", false),
  ContactModel("assets/profile_6.png", "Bartolomeo Kuma", false),
  ContactModel("assets/profile_3.png", "Christine Caroline", false),
  ContactModel("assets/profile_1.png", "Abil Le Roy", false),
  ContactModel("assets/profile_2.png", "Anastasya Kokfasih", false),
  ContactModel("assets/profile_3.png", "Aaroon Davies", false),
  ContactModel("assets/profile_4.png", "Alexander Arnold", false),
  ContactModel("assets/profile_5.png", "Bima Sakti Banget", false),
  ContactModel("assets/profile_6.png", "Bartolomeo Kuma", false),
  ContactModel("assets/profile_3.png", "Christine Caroline", false),
];

List<ContactModel> selectedContacts = [];
