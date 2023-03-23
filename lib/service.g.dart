// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rockets _$RocketsFromJson(Map<String, dynamic> json) => Rockets(
      flickr_images: (json['flickr_images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      name: json['name'] as String?,
      type: json['type'] as String?,
      first_flight: json['first_flight'] as String?,
      country: json['country'] as String?,
      company: json['company'] as String?,
      wikipedia: json['wikipedia'] as String?,
      description: json['description'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$RocketsToJson(Rockets instance) => <String, dynamic>{
      'flickr_images': instance.flickr_images,
      'name': instance.name,
      'type': instance.type,
      'first_flight': instance.first_flight,
      'country': instance.country,
      'company': instance.company,
      'wikipedia': instance.wikipedia,
      'description': instance.description,
      'id': instance.id,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RestClient implements RestClient {
  _RestClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://api.spacexdata.com/v4/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Rockets>> getRockets() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result =
        await _dio.fetch<List<dynamic>>(_setStreamType<List<Rockets>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/rockets',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Rockets.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
