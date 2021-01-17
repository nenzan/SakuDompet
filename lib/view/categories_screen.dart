import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saku_dompet/model/Category.dart';
import 'package:saku_dompet/service/category_service.dart';
import 'package:saku_dompet/view/home_screen.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  var _categoryNameController = TextEditingController();
  var _categoryDescriptionController = TextEditingController();

  var _category = Category();
  var _categoryService = CategoryService();

  List<Category> _categoryList;

  @override
  void initState() {
    super.initState();
    getAllCategories();
  }

  getAllCategories() async {
    _categoryList;
    var categories = await _categoryService.readCategories();
    categories.forEach((category) {
      setState(() {
        var categoryModel = Category();
        categoryModel.id = category['id'];
        categoryModel.name = category['name'];
        categoryModel.description = category['description'];
        _categoryList.add(categoryModel);
      });
    });
  }

  _showFormDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: [
              FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
                color: Colors.red,
              ),
              FlatButton(
                onPressed: () async {
                  _category.name = _categoryNameController.text;
                  _category.description = _categoryDescriptionController.text;
                  var result = await _categoryService.saveCategory(_category);
                  print(result);
                },
                child: Text('Save'),
                color: Colors.green,
              ),
            ],
            title: Text('Categories Form'),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Write a category',
                      labelText: 'Category',
                    ),
                    controller: _categoryNameController,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Write a description',
                      labelText: 'Description',
                    ),
                    controller: _categoryDescriptionController,
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: RaisedButton(
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomeScreen())),
          elevation: 0.0,
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          color: Colors.blue,
        ),
        title: Text('Categories'),
      ),
      body: ListView.builder(
          itemCount: _categoryList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: 8, left: 16, right: 16),
              child: Card(
                elevation: 2,
                child: ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {},
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_categoryList[index].name),
                      IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {})
                    ],
                  ),
                  subtitle: Text(_categoryList[index].description),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
