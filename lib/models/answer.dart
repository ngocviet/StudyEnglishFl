class Answer {
  late int Id;
  late int QuestionId;
  late String Name;
  late int IsTrue;
  late String CreatedBy;
  late String UpdatedBy;
  late String DeletedBy;
  late DateTime CreatedTime;
  late DateTime UpdatedTime;
  late DateTime DeletedTime;
  late bool IsDeleted;

  Answer({
    required this.Id,
    required this.QuestionId,
    required this.Name,
    required this.IsTrue,
    required this.CreatedBy,
    required this.UpdatedBy,
    required this.DeletedBy,
    required this.CreatedTime,
    required this.UpdatedTime,
    required this.DeletedTime,
    required this.IsDeleted,
  });
}
