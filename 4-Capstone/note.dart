class Note {
  int id;
  String title;
  String body;
  DateTime createdAt;

  // Constructor
  Note(this.id, this.title, this.body, this.createdAt);

  // SERIALIZACIÓN
  // Convierte una Note en un Map.
  // Luego el Map puede convertirse a JSON con jsonEncode().
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "body": body,
      "createdAt": createdAt.toIso8601String(),
    };
  }

  // DESERIALIZACIÓN
  // Constructor nombrado que reconstruye una Note a partir de un Map.
  Note.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        body = json["body"],
        createdAt = DateTime.parse(json["createdAt"]);
}