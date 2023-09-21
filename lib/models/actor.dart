class Actor {
  String fullName;
  String firstName;
  String lastName;
  String image;
  String role;

  Actor({
    this.fullName = "",
    this.firstName = "",
    this.lastName = "",
    this.image = "",
    this.role = "",
  });
  factory Actor.fromJson(Map<String, dynamic> json) {
    var fname = json['name'] ?? "";
    List<String> nameParts = fname.split(" ");
    String first = "";
    String last = "";

    if (nameParts.isNotEmpty) {
      first = nameParts[0];
      if (nameParts.length > 1) {
        last = nameParts.sublist(1).join(" ");
      }
    }

    return Actor(
      fullName: fname,
      firstName: first,
      lastName: last,
      role: json["character"] ?? "",
      image: json["profile_path"]??"",
    );
  }
}
