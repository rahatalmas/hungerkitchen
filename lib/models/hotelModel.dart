class HotelLoginRequest {
  final String hotelName;
  final String hotelPassword;

  HotelLoginRequest({
    required this.hotelName,
    required this.hotelPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'hotel_name': hotelName,
      'hotel_password': hotelPassword,
    };
  }
}



class HotelLoginResponse {
  final String message;
  final int hotelId;

  HotelLoginResponse({
    required this.message,
    required this.hotelId,
  });

  factory HotelLoginResponse.formJson(Map<String, dynamic> json) {
    return HotelLoginResponse(
      message: json['message'],
      hotelId: json['hotelId'],
    );
  }
}

