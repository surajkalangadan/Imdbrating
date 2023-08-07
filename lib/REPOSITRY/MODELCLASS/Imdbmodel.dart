class Imdbmodel {
  Imdbmodel({
      this.status, 
      this.message, 
      this.timestamp, 
      this.data,});

  Imdbmodel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    timestamp = json['timestamp'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  bool? status;
  String? message;
  int? timestamp;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['timestamp'] = timestamp;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.qid, 
      this.title, 
      this.year, 
      this.stars, 
      this.q, 
      this.image,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    qid = json['qid'];
    title = json['title'];
    year = json['year'];
    stars = json['stars'];
    q = json['q'];
    image = json['image'];
  }
  String? id;
  String? qid;
  String? title;
  int? year;
  String? stars;
  String? q;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['qid'] = qid;
    map['title'] = title;
    map['year'] = year;
    map['stars'] = stars;
    map['q'] = q;
    map['image'] = image;
    return map;
  }

}