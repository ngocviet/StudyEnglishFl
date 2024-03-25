import '../models/account.dart';

class AccountController {

  static Account getAccountId(int id_account){
    //from id_lesson => get detail of lesson
    return Account(
      ID: id_account,
      UserName: '1',
      PassWord: 'c4ca4238a0b923820dcc509a6f75849b',
      Name: 'Name',
      Avata: 'abc1.jpg',
      CreateBy: 'system',
      UpdateBy: 'system',
      DeleteBy: '',
      CreateTime: DateTime.now(),
      UpdateTime: DateTime.now(),
      DeleteTime: DateTime.now(),
      IsDeleted: false,
    );
  }

  static Account getAccountInfo() {
    return Account(
      ID: 1,
      UserName: '1',
      PassWord: 'c4ca4238a0b923820dcc509a6f75849b',
      Name: 'Name',
      Avata: 'abc1.jpg',
      CreateBy: 'system',
      UpdateBy: 'system',
      DeleteBy: '',
      CreateTime: DateTime.now(),
      UpdateTime: DateTime.now(),
      DeleteTime: DateTime.now(),
      IsDeleted: false,
    );
  }
}