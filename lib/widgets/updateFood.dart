import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hungerkitchen/apiCalls/foodUpdateApi.dart';
import 'package:hungerkitchen/apiCalls/foodUploadApi.dart';
import 'package:hungerkitchen/models/foodModel.dart';

class updateFoodPage extends StatefulWidget {
  const updateFoodPage({super.key,required this.foodId});
  final int foodId;
  @override
  _updateFoodPageState createState() => _updateFoodPageState();
}

class _updateFoodPageState extends State<updateFoodPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController foodNameController = TextEditingController();
  final TextEditingController foodPriceController = TextEditingController();
  final TextEditingController foodCategoryController = TextEditingController();
  final TextEditingController foodDescriptionController = TextEditingController();
  final TextEditingController foodPictureController = TextEditingController();
  final TextEditingController foodInstockController = TextEditingController();

  String foodName = "";
  double foodPrice = 0.0;
  String foodCategory = "";
  String foodDescription = "";
  String foodPicture = "";
  bool foodInstock = true;

  void foodUpload() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        foodName = foodNameController.text;
        foodPrice = double.parse(foodPriceController.text);
        foodCategory = foodCategoryController.text;
        foodDescription = foodDescriptionController.text;
        foodPicture = foodPictureController.text;
        foodInstock = foodInstockController.text.isNotEmpty ? true : false; 
      });
      UpdateFood food = UpdateFood(
        foodId: widget.foodId, 
        foodName: foodName,
        foodPrice: foodPrice.toString(),
        foodCategory: foodCategory,
        foodDescription: foodDescription,
        foodPicture: foodPicture,
        foodInstock: foodInstock,  
      );
      updateFoodFunc(food, widget.foodId);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Food updated successfully')),
      );
    }
    print("uploader ...");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        title: const Text('Update Food'),
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
                    return 'Please enter food name';
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
                    return 'Please enter food price';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
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
                    return 'Please enter food category';
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
                    return 'Please enter food description';
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
                    return 'Please enter food picture URL';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'In Stock (Optional)',
                  border: OutlineInputBorder(),
                ),
                controller: foodInstockController,
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  foodUpload();
                },
                child: const Text('Update Food'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}