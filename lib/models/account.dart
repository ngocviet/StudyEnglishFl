class Account {
  late int ID;
  late String UserName;
  late String PassWord;
  late String Name;
  late String Avata;
  late String CreateBy;
  late String UpdateBy;
  late String DeleteBy;
  late DateTime CreateTime;
  late DateTime UpdateTime;
  late DateTime DeleteTime;
  late bool IsDeleted;

  Account({
    required this.ID,
    required this.UserName,
    required this.PassWord,
    required this.Name,
    required this.Avata,
    required this.CreateBy,
    required this.UpdateBy,
    required this.DeleteBy,
    required this.DeleteTime,
    required this.UpdateTime,
    required this.CreateTime,
    required this.IsDeleted,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      ID: json['ID'] ?? 0, // Giá trị mặc định là 0 nếu không có giá trị ID
      UserName: json['UserName'] ?? '',
      PassWord: json['PassWord'] ?? '',
      Name: json['Name'] ?? '',
      Avata: json['Avata'] ?? '',
      CreateBy: json['CreateBy'] ?? '',
      UpdateBy: json['UpdateBy'] ?? '',
      DeleteBy: json['DeleteBy'] ?? '',
      CreateTime: json['CreateTime'] != null ? DateTime.parse(json['CreateTime']) : DateTime.now(),
      UpdateTime: json['UpdateTime'] != null ? DateTime.parse(json['UpdateTime']) : DateTime.now(),
      DeleteTime: json['DeleteTime'] != null ? DateTime.parse(json['DeleteTime']) : DateTime.now(),
      IsDeleted: json['IsDeleted'] ?? false, // Giá trị mặc định là false nếu không có giá trị IsDeleted
    );
  }

}
