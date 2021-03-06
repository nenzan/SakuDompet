import 'package:saku_dompet/model/Category.dart';
import 'package:saku_dompet/repositories/repository.dart';

class CategoryService {
  Repository _repository;

  CategoryService() {
    _repository = Repository();
  }

  // create data
  saveCategory(Category category) async {
    return await _repository.insertData('categories', category.categoryMap());
  }

  // read data
  readCategories() async {
    return await _repository.readData('categories');
  }

  // read data by id
  readCategoryById(categoryId) async {
    return await _repository.readDataById('categories', categoryId);
  }

  //update data from table
  updateCategory(Category category) async {
    return await _repository.updateData('categories', category.categoryMap());
  }
}
