class User {
  final int userId;
  final String userName;
  final String userContact;
  final String userLocation;

  User({
    required this.userId,
    required this.userName,
    required this.userContact,
    required this.userLocation
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'] as int,
      userName: json['user_name'] as String,
      userContact: json['user_contact'] as String,
      userLocation: json['user_location'] as String
    );
  }
}

class Food {
  final int foodId;
  final String foodName;
  final double foodPrice;
  final String foodCategory;
  final bool foodInStock;
  final String foodDescription;
  final String foodPicture;
  final int? foodReview;
  final int foodProviderId;

  Food({
    required this.foodId,
    required this.foodName,
    required this.foodPrice,
    required this.foodCategory,
    required this.foodInStock,
    required this.foodDescription,
    required this.foodPicture,
    this.foodReview,
    required this.foodProviderId,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      foodId: json['food_id'] as int,
      foodName: json['food_name'] as String,
      foodPrice: double.parse(json['food_price'].toString()),
      foodCategory: json['food_category'] as String,
      foodInStock: json['food_instock'] as bool,
      foodDescription: json['food_description'] as String,
      foodPicture: json['food_picture'] as String,
      foodReview: json['food_review'] as int?,
      foodProviderId: json['food_provider_id'] as int,
    );
  }
}

class Order {
  final int orderId;
  final int orderedUserId;
  final int orderedFoodId;
  final int quantity;
  final String deliveryLocation;
  final bool orderStatus;
  final DateTime orderTime;
  final User userInfo;
  final Food foodInfo;

  Order({
    required this.orderId,
    required this.orderedUserId,
    required this.orderedFoodId,
    required this.quantity,
    required this.deliveryLocation,
    required this.orderStatus,
    required this.orderTime,
    required this.userInfo,
    required this.foodInfo,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderId: json['order_id'] as int,
      orderedUserId: json['ordered_user_id'] as int,
      orderedFoodId: json['ordered_food_id'] as int,
      quantity: json['quantity'] as int,
      deliveryLocation: json['delivery_location'] as String,
      orderStatus: json['order_status'] as bool,
      orderTime: DateTime.parse(json['order_time'] as String),
      userInfo: User.fromJson(json['user_info'] as Map<String, dynamic>),
      foodInfo: Food.fromJson(json['food_info'] as Map<String, dynamic>),
    );
  }
}
