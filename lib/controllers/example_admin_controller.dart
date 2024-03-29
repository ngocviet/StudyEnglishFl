import '../models/example.dart';

class ExampleAdminController{

  static Example GetExample() {
    return Example(
      Id: 1,
      WordId: 1,
      NameVN: 'Tên tiếng Việt',
      NameLanguage: 'Name in English',
      CreatedBy: 'Admin',
      UpdatedBy: 'Admin',
      DeletedBy: '',
      CreatedTime: DateTime.now(),
      UpdatedTime: DateTime.now(),
      DeletedTime: DateTime.now(),
      IsDeleted: false,
    );
  }

  static Example GetExampleById(int id) {
    return Example(
      Id: id,
      WordId: 1,
      NameVN: 'Tên tiếng Việt',
      NameLanguage: 'Name in English',
      CreatedBy: 'Admin',
      UpdatedBy: 'Admin',
      DeletedBy: '',
      CreatedTime: DateTime.now(),
      UpdatedTime: DateTime.now(),
      DeletedTime: DateTime.now(),
      IsDeleted: false,
    );
  }

}