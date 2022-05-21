// To parse this JSON data, do
//
//     final actoresMovieResponse = actoresMovieResponseFromMap(jsonString);

import 'dart:convert';

class ActoresMovieResponse {
    ActoresMovieResponse({
        required this.id,
        required this.cast        
    });

    int id;
    List<Actor> cast;
    

    factory ActoresMovieResponse.fromJson(String str) => ActoresMovieResponse.fromMap(json.decode(str));


    factory ActoresMovieResponse.fromMap(Map<String, dynamic> json) => ActoresMovieResponse(
        id: json["id"],
        cast: List<Actor>.from(json["cast"].map((x) => Actor.fromMap(x))),
    
    );
  
  
}

class Actor {
    Actor({
        required this.adult,
        required this.gender,
        required this.id,
        required this.knownForDepartment,
        required this.name,
        required this.originalName,
        required this.popularity,
        this.profilePath,
        this.castId,
        this.character,
        this.creditId,
        this.order,
        this.department,
        this.job,
    });

    bool adult;
    int gender;
    int id;
    String knownForDepartment;
    String name;
    String originalName;
    double popularity;
    String? profilePath;
    int? castId;
    String? character;
    String? creditId;
    int? order;
    String? department;
    String? job;

    get fullProfilePath{
      if(this.profilePath != null){
      return 'https://image.tmdb.org/t/p/w500${this.profilePath}';
      }else{
        return 'https://t4.ftcdn.net/jpg/04/70/29/97/360_F_470299797_UD0eoVMMSUbHCcNJCdv2t8B2g1GVqYgs.jpg';
      }
    }

    factory Actor.fromJson(String str) => Actor.fromMap(json.decode(str));    

    factory Actor.fromMap(Map<String, dynamic> json) => Actor(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        originalName: json["original_name"],
        popularity: json["popularity"].toDouble(),
        profilePath: json["profile_path"] == null ? null : json["profile_path"],
        castId: json["cast_id"] == null ? null : json["cast_id"],
        character: json["character"] == null ? null : json["character"],
        creditId: json["credit_id"],
        order: json["order"] == null ? null : json["order"],
        department: json["department"] == null ? null : json["department"],
        job: json["job"] == null ? null : json["job"],
    );
}
