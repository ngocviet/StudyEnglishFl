import '../models/answer.dart';

class AnswerAdminController{

  static Answer getDetail() {

    return Answer(
      Id: 1,
      QuestionId: 1,
      Name: 'Sample answer name',
      IsTrue: 1,
      CreatedBy: 'Sample creator',
      UpdatedBy: 'Sample updater',
      DeletedBy: 'Sample deleter',
      CreatedTime: DateTime.now(),
      UpdatedTime: DateTime.now(),
      DeletedTime: DateTime.now(),
      IsDeleted: false,
    );
  }

  static Answer getDetailById(int id_lesson) {

    return Answer(
      Id: id_lesson,
      QuestionId: 1,
      Name: 'Sample answer name',
      IsTrue: 1,
      CreatedBy: 'Sample creator',
      UpdatedBy: 'Sample updater',
      DeletedBy: 'Sample deleter',
      CreatedTime: DateTime.now(),
      UpdatedTime: DateTime.now(),
      DeletedTime: DateTime.now(),
      IsDeleted: false,
    );
  }
}