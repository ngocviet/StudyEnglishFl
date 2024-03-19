class Topic{
  late int Id;
  late int UserId;
  late String Name;
  late String Description;
  late String Avata;
  late String CreateBy;
  late String UpdateBy;
  late String DeleteBy;
  late DateTime CreateTime;
  late DateTime UpdateTime;
  late DateTime DeleteTime;
  late bool IsDeleted;

  Topic({
   required this.Id,
   required this.UserId,
    required this.Name,
    required this.Description,
    required this.Avata,
    required this.CreateBy,
    required this.UpdateBy,
    required this.DeleteBy,
    required this.DeleteTime,
    required this.UpdateTime,
    required this.CreateTime,
    required this.IsDeleted,});
}