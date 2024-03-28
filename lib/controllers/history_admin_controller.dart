import 'package:project4/models/history.dart';

class HistoryAdminController{
  static History GetHistory() {
    return History(
      Id: 1,
      LessonId: 1,
      QuantityCorrect: 5, // Số lượng câu đúng giả lập
      CreatedBy: 'Admin',
      UpdatedBy: 'Admin',
      DeletedBy: '', // Chưa xóa nên để trống
      CreatedTime: DateTime.now(), // Thời gian tạo là thời điểm hiện tại
      UpdatedTime: DateTime.now(), // Thời gian cập nhật là thời điểm hiện tại
      DeletedTime: DateTime.now(), // Thời gian xóa là thời điểm hiện tại
      IsDeleted: false, // Giả lập trạng thái xóa
    );
  }

  static History GetHistoryById(int id) {
    return History(
      Id: id,
      LessonId: 1,
      QuantityCorrect: 5, // Số lượng câu đúng giả lập
      CreatedBy: 'Admin',
      UpdatedBy: 'Admin',
      DeletedBy: '', // Chưa xóa nên để trống
      CreatedTime: DateTime.now(), // Thời gian tạo là thời điểm hiện tại
      UpdatedTime: DateTime.now(), // Thời gian cập nhật là thời điểm hiện tại
      DeletedTime: DateTime.now(), // Thời gian xóa là thời điểm hiện tại
      IsDeleted: false, // Giả lập trạng thái xóa
    );
  }

}