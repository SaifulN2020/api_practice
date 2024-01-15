class ApiTestData {
  int? userId;
  int? id;
  String? title;
  String? body;

  ApiTestData({this.userId, this.id, this.title, this.body});

  ApiTestData.fromJson(Map<dynamic ,dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = Map<dynamic, dynamic>();
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
