import 'package:ly_odesa/data/models/post/post_office.dart';

class PostOfficeAPI {
  PostOfficeAPI({
    this.postOffices,
  });

  List<PostOffice>? postOffices;

  factory PostOfficeAPI.fromJson(Map<String, dynamic> json) {
    return PostOfficeAPI(
        postOffices: (json['data'] as List)
            .map((dynamic e) => PostOffice.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}