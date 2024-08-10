enum MovieRequestType {
  wacthlist,
  favorite
}

class MovieRequestModel {
  String? mediaType;
  int? mediaId;
  bool? value;
  final MovieRequestType type;


  MovieRequestModel({this.mediaType, this.mediaId, this.value, required this.type});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['media_type'] = "movie";
    data['media_id'] = mediaId;

    if(type == MovieRequestType.favorite) {
      data['favorite'] = value;
    } else {
      data['watchlist'] = value;
    }
    
    return data;
  }
}