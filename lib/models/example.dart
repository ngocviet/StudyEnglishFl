class Example {
    late int Id;
    late int WordId;
    late String NameVN;
    late String NameLanguage;
    late String CreatedBy;
    late String UpdatedBy;
    late String DeletedBy;
    late DateTime CreatedTime;
    late DateTime UpdatedTime;
    late DateTime DeletedTime;
    late bool IsDeleted;

    Example({
      required this.Id,
      required this.WordId,
      required this.NameVN,
      required this.NameLanguage,
      required this.CreatedBy,
      required this.UpdatedBy,
      required this.DeletedBy,
      required this.CreatedTime,
      required this.UpdatedTime,
      required this.DeletedTime,
      required this.IsDeleted,
    });

  }