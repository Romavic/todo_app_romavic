class TaskResponse {
  String? idUser;
  String? title;
  String? details;
  DateTime? time;

  TaskResponse({
    this.idUser,
    this.title,
    this.details,
    this.time,
  });

  factory TaskResponse.fromJson(Map<String, dynamic> json) => TaskResponse(
        idUser: json["idUser"],
        title: json["title"],
        details: json["details"],
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
      );

  Map<String, dynamic> toJson() => {
        "idUser": idUser,
        "title": title,
        "details": details,
        "time":
            "${time!.year.toString().padLeft(4, '0')}-${time!.month.toString().padLeft(2, '0')}-${time!.day.toString().padLeft(2, '0')}",
      };
}
