class History {
  late int Id;
  late int LessonId;
  late int QuantityCorrect;
  late String CreatedBy;
  late String UpdatedBy;
  late String DeletedBy;
  late DateTime CreatedTime;
  late DateTime UpdatedTime;
  late DateTime DeletedTime;
  late bool IsDeleted;

  History({
    required this.Id,
    required this.LessonId,
    required this.QuantityCorrect,
    required this.CreatedBy,
    required this.UpdatedBy,
    required this.DeletedBy,
    required this.CreatedTime,
    required this.UpdatedTime,
    required this.DeletedTime,
    required this.IsDeleted,
  });

}