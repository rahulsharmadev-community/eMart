// ignore_for_file: constant_identifier_names

enum State {
  INAP("Andhra Pradesh"),
  INAR("Arunachal Pradesh"),
  INAS("Assam"),
  INBR("Bihar"),
  INCT("Chhattisgarh"),
  INGA("Goa"),
  INGJ("Gujarat"),
  INHR("Haryana"),
  INHP("Himachal Pradesh"),
  INJH("Jharkhand"),
  INKA("Karnataka"),
  INKL("Kerala"),
  INMP("Madhya Pradesh"),
  INMH("Maharashtra"),
  INMN("Manipur"),
  INML("Meghalaya"),
  INMZ("Mizoram"),
  INNL("Nagaland"),
  INOR("Odisha"),
  INPB("Punjab"),
  INRJ("Rajasthan"),
  INSK("Sikkim"),
  INTN("Tamil Nadu"),
  INTG("Telangana"),
  INTR("Tripura"),
  INUP("Uttar Pradesh"),
  INUT("Uttarakhand"),
  INWB("West Bengal"),
  INCH("Chandigarh"),
  INLD("Lakshadweep"),
  INDL("Delhi"),
  INPY("Puducherry");

  const State(this.fullName);
  final String fullName;
}
