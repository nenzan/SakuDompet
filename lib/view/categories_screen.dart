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
                onPressed: () {
                  _category.name = _categoryNameController.text;
                  _category.description = _categoryDescriptionController.text;
                  _categoryService.saveCategory(_category);
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
      body: Center(child: Text('Categories Screen')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
