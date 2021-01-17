import 'package:saku_dompet/model/Category.dart';
import 'package:saku_dompet/repositories/repository.dart';

class CategoryService {
  Repository _repository;

  CategoryService() {
    _repository = Repository();
  }

  saveCategory(Category category) async {
    return await _repository.insertData('categories', category.categoryMap());
  }
}
