class GroupTaskModel {
  String? groupTask;
  String? color;

  GroupTaskModel({this.groupTask, this.color});

  GroupTaskModel.fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      groupTask = json['groupTask'];
      color = json['color'];
    }
  }
}
