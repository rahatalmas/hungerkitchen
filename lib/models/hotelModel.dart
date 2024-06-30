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


class HotelRegisterRequest {
  final String hotelName;
  final String hotelPassword;
  final String hotelDescription;
  final String hotelPicture;

  HotelRegisterRequest({
    required this.hotelName,
    required this.hotelPassword,
    required this.hotelDescription,
    required this.hotelPicture
  });

  Map<String, dynamic> toJson() {
    return {
      'hotel_name': hotelName,
      'hotel_password': hotelPassword,
      'hotel_description': hotelDescription,
      'hotel_picture':hotelPicture
    };
  }
}

class HotelRegisterResponse {
  final String message;
  final int hotelId;

  HotelRegisterResponse({
    required this.message,
    required this.hotelId,
  });

  factory HotelRegisterResponse.formJson(Map<String, dynamic> json) {
    return HotelRegisterResponse(
      message: json['message'],
      hotelId: json['hotelId'],
    );
  }
}


class Hotel {
  final int hotelId;
  final String hotelName;
  final String? hotelContact;
  final String hotelPassword;
  final String hotelDescription;
  final String hotelPicture;

  Hotel({
    required this.hotelId,
    required this.hotelName,
    required this.hotelContact,
    required this.hotelPassword,
    required this.hotelDescription,
    required this.hotelPicture,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      hotelId: json['hotel_id'] as int,
      hotelName: json['hotel_name'] as String,
      hotelContact: json['hotel_contact'] as String?,
      hotelPassword: json['hotel_password'] as String,
      hotelDescription: json['hotel_description'] as String,
      hotelPicture: json['hotel_picture'] as String,
    );
  }
}
