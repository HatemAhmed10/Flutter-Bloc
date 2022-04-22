class PostModel {
  List<Post>? post;

  PostModel({this.post});

  PostModel.fromJson(Map<String, dynamic> json) {
    if (json['post'] != null) {
      post = <Post>[];
      json['post'].forEach((v) {
        post!.add(new Post.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.post != null) {
      data['post'] = this.post!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Post {
  String? sId;
  String? imgurl;
  String? description;
  int? numberLike;
  List<Null>? comments;
  int? iV;

  Post(
      {this.sId,
        this.imgurl,
        this.description,
        this.numberLike,
        this.comments,
        this.iV});

  Post.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    imgurl = json['imgurl'];
    description = json['description'];
    numberLike = json['NumberLike'];
    // if (json['Comments'] != null) {
    //   comments = <Null>[];
    //   json['Comments'].forEach((v) {
    //     comments!.add(new Null.fromJson(v));
    //   }
    //   );
    // }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['imgurl'] = this.imgurl;
    data['description'] = this.description;
    data['NumberLike'] = this.numberLike;
    // if (this.comments != null) {
    //   data['Comments'] = this.comments!.map((v) => v.toJson()).toList();
    // }
    data['__v'] = this.iV;
    return data;
  }
}