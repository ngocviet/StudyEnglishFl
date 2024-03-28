import '../models/categories.dart';

class CategoriesAdminController{

  static Categories GetCategories() {
    return Categories(
      Id: 1,
      Name: 'Category ',
      CreateBy: 'Admin',
      UpdateBy: 'Admin',
      DeleteBy: '', // Chưa xóa nên để trống
      CreateTime: DateTime.now(), // Thời gian tạo là thời điểm hiện tại
      UpdateTime: DateTime.now(), // Thời gian cập nhật là thời điểm hiện tại
      DeleteTime: DateTime.now(), // Thời gian xóa là thời điểm hiện tại
      IsDeleted: false, // Giả lập trạng thái xóa
    );
  }

  static Categories GetCategoriesById(int id) {
    return Categories(
      Id: 1,
      Name: 'Category ',
      CreateBy: 'Admin',
      UpdateBy: 'Admin',
      DeleteBy: '', // Chưa xóa nên để trống
      CreateTime: DateTime.now(), // Thời gian tạo là thời điểm hiện tại
      UpdateTime: DateTime.now(), // Thời gian cập nhật là thời điểm hiện tại
      DeleteTime: DateTime.now(), // Thời gian xóa là thời điểm hiện tại
      IsDeleted: false, // Giả lập trạng thái xóa
    );
  }
}