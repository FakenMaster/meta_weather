import 'package:json_annotation/json_annotation.dart';
part 'source.g.dart';

@JsonSerializable()
class Source {
  String title;
  String slug;
  String url;
  @JsonKey(name: 'crawl_rate')
  int crawlRate;

  Source({
    this.title,
    this.slug,
    this.url,
    this.crawlRate,
  });

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
  Map<String, dynamic> toJson() => _$SourceToJson(this);
}
