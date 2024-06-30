import 'dart:convert';
import 'package:flutter/material.dart';

class FoodUploadPage extends StatefulWidget {
  const FoodUploadPage({Key? key}) : super(key: key);

  @override
  _FoodUploadPageState createState() => _FoodUploadPageState();
}

class _FoodUploadPageState extends State<FoodUploadPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController foodNameController = TextEditingController();
  final TextEditingController foodPriceController = TextEditingController();
  final TextEditingController foodCategoryController = TextEditingController();
  final TextEditingController foodDescriptionController = TextEditingController();
  final TextEditingController foodPictureController = TextEditingController();

  String foodName = "";
  double foodPrice = 0.0;
  String foodCategory = "";
  String foodDescription = "";
  String foodPicture = "";

  void _formSubmitController(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        foodName = foodNameController.text;
        foodPrice = double.parse(foodPriceController.text);
        foodCategory = foodCategoryController.text;
        foodDescription = foodDescriptionController.text;
        foodPicture = foodPictureController.text;
      });
       /* ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Food uploaded successfully')),
        );*/
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Food'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Food Name',
                  border: OutlineInputBorder(),
                ),
                controller: foodNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'food name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Food Price',
                  border: OutlineInputBorder(),
                ),
                controller: foodPriceController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'food price';
                  }
                  if (double.tryParse(value) == null) {
                    return 'enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Food Category',
                  border: OutlineInputBorder(),
                ),
                controller: foodCategoryController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'food category';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Food Description',
                  border: OutlineInputBorder(),
                ),
                controller: foodDescriptionController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'food description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Food Picture URL',
                  border: OutlineInputBorder(),
                ),
                controller: foodPictureController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'food picture URL';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () => _formSubmitController(context),
                child: const Text('Upload Food'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
