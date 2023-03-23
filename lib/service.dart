import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';


part 'service.g.dart';

@RestApi(baseUrl: "https://api.spacexdata.com/v4/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/rockets")
  Future<List<Rockets>> getRockets();
}


@JsonSerializable()
class Rockets {
  List<String>? flickr_images;
  String? name;
  String? type;
  String? first_flight;
  String? country;
  String? company;
  String? wikipedia;
  String? description;
  String? id;

  Rockets(
      {this.flickr_images,
        this.name,
        this.type,
        this.first_flight,
        this.country,
        this.company,
        this.wikipedia,
        this.description,
        this.id});


  factory Rockets.fromJson(Map<String, dynamic> json) => _$RocketsFromJson(json);
  Map<String, dynamic> toJson() => _$RocketsToJson(this);
}
