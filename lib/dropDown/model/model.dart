class DropDownModel {
  int? classCode;
  String? className;

  DropDownModel({this.classCode, this.className});

  DropDownModel.fromJson(Map<String, dynamic> json) {
    classCode = json['ClassCode'];
    className = json['ClassName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ClassCode'] = this.classCode;
    data['ClassName'] = this.className;
    return data;
  }
}