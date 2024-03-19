class Categories{
  late int Id;
  late String Name;
  late String CreateBy;
  late String UpdateBy;
  late String DeleteBy;
  late DateTime CreateTime;
  late DateTime UpdateTime;
  late DateTime DeleteTime;
  late bool IsDeleted;

  Categories({required this.Id,
    required this.Name,
    required this.CreateBy,
    required this.UpdateBy,
    required this.DeleteBy,
    required this.DeleteTime,
    required this.UpdateTime,
    required this.CreateTime,
    required this.IsDeleted,});
}