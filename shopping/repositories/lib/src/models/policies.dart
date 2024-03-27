import 'package:json_annotation/json_annotation.dart';
import 'package:shared/models.dart';

part 'policies.g.dart';

@JsonSerializable()
class Policies {
  final String? aboutUs;
  final String? contactUs;
  final String? privacyPolicy;
  final String? termsOfUse;
  final String? affiliatePolicy;
  final String? infringementPolicy;
  final String? refundPolicy;
  final String? cancellationPolicy;

  Policies({
    this.aboutUs,
    this.contactUs,
    this.privacyPolicy,
    this.termsOfUse,
    this.affiliatePolicy,
    this.infringementPolicy,
    this.refundPolicy,
    this.cancellationPolicy,
  });

  factory Policies.fromJson(JSON json) => _$PoliciesFromJson(json);

  JSON toJson() => _$PoliciesToJson(this);
}
