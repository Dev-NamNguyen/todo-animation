class SubTaskModel {
  String? id;
  String? title;
  String? description;
  bool? isCompleted;
  String? date;

  SubTaskModel({
    this.id,
    this.title,
    this.description,
    this.isCompleted = false,
    this.date,
  });

  SubTaskModel.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      id = json['id'] as String?;
      title = json['title'] as String?;
      description = json['description'] as String?;
      isCompleted = json['isCompleted'] as bool? ?? false;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
    };
  }
}
