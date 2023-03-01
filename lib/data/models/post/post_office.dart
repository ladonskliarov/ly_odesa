class PostOffice {
  PostOffice({
    this.number,
    this.description,
  });

  String? number;
  String? description;

  factory PostOffice.fromJson(Map<String, dynamic> json) {
    return PostOffice(
        description: json['Description'],
        number: json['Number']
    );
  }
}