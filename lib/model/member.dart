// To parse this JSON data, do
//
//     final members = membersFromJson(jsonString);

import 'dart:convert';

Members membersFromJson(String str) => Members.fromJson(json.decode(str));

String membersToJson(Members data) => json.encode(data.toJson());

class Members {
  Members({
    this.code,
    this.msg,
    this.data,
  });

  int code;
  String msg;
  Data data;

  factory Members.fromJson(Map<String, dynamic> json) => Members(
        code: json["code"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.list,
    this.summarytier,
    this.summary,
    this.total,
  });

  List<ListElement> list;
  List<Summarytier> summarytier;
  Summary summary;
  int total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
        summarytier: List<Summarytier>.from(
            json["summarytier"].map((x) => Summarytier.fromJson(x))),
        summary: Summary.fromJson(json["summary"]),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "summarytier": List<dynamic>.from(summarytier.map((x) => x.toJson())),
        "summary": summary.toJson(),
        "total": total,
      };
}

class ListElement {
  ListElement({
    this.customername,
    this.customertier,
    this.customerphone,
    this.totaltransaction,
    this.totalamount,
    this.totalreward,
    this.remainingpoint,
  });

  String customername;
  String customertier;
  String customerphone;
  int totaltransaction;
  int totalamount;
  int totalreward;
  int remainingpoint;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        customername: json["customername"],
        customertier: json["customertier"],
        customerphone: json["customerphone"],
        totaltransaction: json["totaltransaction"],
        totalamount: json["totalamount"],
        totalreward: json["totalreward"],
        remainingpoint: json["remainingpoint"],
      );

  Map<String, dynamic> toJson() => {
        "customername": customername,
        "customertier": customertier,
        "customerphone": customerphone,
        "totaltransaction": totaltransaction,
        "totalamount": totalamount,
        "totalreward": totalreward,
        "remainingpoint": remainingpoint,
      };
}

class Summary {
  Summary({
    this.totaltransaction,
    this.totalpoint,
    this.remainingpoint,
    this.lifetimevalue,
  });

  int totaltransaction;
  int totalpoint;
  int remainingpoint;
  int lifetimevalue;

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        totaltransaction: json["totaltransaction"],
        totalpoint: json["totalpoint"],
        remainingpoint: json["remainingpoint"],
        lifetimevalue: json["lifetimevalue"],
      );

  Map<String, dynamic> toJson() => {
        "totaltransaction": totaltransaction,
        "totalpoint": totalpoint,
        "remainingpoint": remainingpoint,
        "lifetimevalue": lifetimevalue,
      };
}

class Summarytier {
  Summarytier({
    this.totalMembers,
    this.totalAmount,
    this.tierName,
  });

  int totalMembers;
  int totalAmount;
  String tierName;

  factory Summarytier.fromJson(Map<String, dynamic> json) => Summarytier(
        totalMembers: json["total_members"],
        totalAmount: json["total_amount"],
        tierName: json["tier_name"],
      );

  Map<String, dynamic> toJson() => {
        "total_members": totalMembers,
        "total_amount": totalAmount,
        "tier_name": tierName,
      };
}
