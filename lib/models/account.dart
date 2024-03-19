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

  Account({required this.ID,
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
    required this.IsDeleted,});
}