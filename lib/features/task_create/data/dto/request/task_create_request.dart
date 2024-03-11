enum FrequencyRequest {
  WEEKLY,
  DAILY,
}

class TaskCreateRequest {
  String? idUser;
  String? title;
  String? details;
  FrequencyRequest? typeOfTask;
  bool? isTaskComplete;
  DateTime? initDate;
  DateTime? endDate;
  List<Streak>? streaks;

  TaskCreateRequest({
    this.idUser,
    this.title,
    this.details,
    this.typeOfTask,
    this.isTaskComplete,
    this.initDate,
    this.endDate,
    this.streaks,
  });

  factory TaskCreateRequest.fromJson(Map<String, dynamic> json) =>
      TaskCreateRequest(
        idUser: json["idUser"],
        title: json["title"],
        details: json["details"],
        typeOfTask: json["typeOfTask"],
        isTaskComplete: json["isTaskComplete"],
        initDate:
            json["initDate"] == null ? null : DateTime.parse(json["initDate"]),
        endDate:
            json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        streaks: json["streaks"] == null
            ? []
            : List<Streak>.from(
                json["streaks"]!.map((x) => Streak.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "idUser": idUser,
        "title": title,
        "details": details,
        "typeOfTask": typeOfTask,
        "isTaskComplete": isTaskComplete,
        "initDate":
            "${initDate!.year.toString().padLeft(4, '0')}-${initDate!.month.toString().padLeft(2, '0')}-${initDate!.day.toString().padLeft(2, '0')}",
        "endDate":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "streaks": streaks == null
            ? []
            : List<dynamic>.from(streaks!.map((x) => x.toJson())),
      };
}

class Streak {
  DateTime? initDate;
  DateTime? endDate;

  Streak({
    this.initDate,
    this.endDate,
  });

  factory Streak.fromJson(Map<String, dynamic> json) => Streak(
        initDate:
            json["initDate"] == null ? null : DateTime.parse(json["initDate"]),
        endDate:
            json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
      );

  Map<String, dynamic> toJson() => {
        "initDate":
            "${initDate!.year.toString().padLeft(4, '0')}-${initDate!.month.toString().padLeft(2, '0')}-${initDate!.day.toString().padLeft(2, '0')}",
        "endDate":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
      };
}
