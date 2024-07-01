
class Food {
  final int foodId;
  final String foodName;
  final String foodPrice;
  final String foodCategory;
  final bool foodInstock;
  final String foodDescription;
  final String foodPicture;
  final int? foodReview; 
  final int foodProviderId;

  Food({
    required this.foodId,
    required this.foodName,
    required this.foodPrice,
    required this.foodCategory,
    required this.foodInstock,
    required this.foodDescription,
    required this.foodPicture,
    this.foodReview,
    required this.foodProviderId,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      foodId: json['food_id'],
      foodName: json['food_name'],
      foodPrice: json['food_price'],
      foodCategory: json['food_category'],
      foodInstock: json['food_instock'],
      foodDescription: json['food_description'],
      foodPicture: json['food_picture'],
      foodReview: json['food_review'],
      foodProviderId: json['food_provider_id'],
    );
  }  
    Map<String, dynamic> toJson() {
    return {
      'food_name': foodName,
      'food_price': foodPrice,
      'food_category': foodCategory,
      'food_instock': foodInstock,
      'food_description': foodDescription,
      'food_picture': foodPicture,
    };
  }

}


class UploadFood {
  final String foodName;
  final String foodPrice;
  final String foodCategory;
  final String foodDescription;
  final String foodPicture;

  UploadFood({
    required this.foodName,
    required this.foodPrice,
    required this.foodCategory,
    required this.foodDescription,
    required this.foodPicture,
  });

  factory UploadFood.fromJson(Map<String, dynamic> json) {
    return UploadFood(
      foodName: json['food_name'],
      foodPrice: json['food_price'],
      foodCategory: json['food_category'],
      foodDescription: json['food_description'],
      foodPicture: json['food_picture'],
    );
  }  

    Map<String, dynamic> toJson() {
    return {
      'food_name': foodName,
      'food_price': foodPrice.toString(),
      'food_category': foodCategory,
      'food_description': foodDescription,
      'food_picture': foodPicture,
    };
    
  }


}

class UpdateFood{
  final int foodId;
  final String foodName;
  final String foodPrice;
  final String foodCategory;
  final bool foodInstock;
  final String foodDescription;
  final String foodPicture;
  final int? foodReview; 

  UpdateFood({
    required this.foodId,
    required this.foodName,
    required this.foodPrice,
    required this.foodCategory,
    required this.foodInstock,
    required this.foodDescription,
    required this.foodPicture,
    this.foodReview,
  });
  Map<String, dynamic> toJson() {
    return {
      'food_name': foodName,
      'food_price': foodPrice,
      'food_category': foodCategory,
      'food_instock': foodInstock,
      'food_description': foodDescription,
      'food_picture': foodPicture,
    };
  }

}