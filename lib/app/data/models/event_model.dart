import 'package:intl/intl.dart';

class EventModel {
  final String imageUrl; 
  final String title;
  final String description; 
  final DateTime date; 
  final String time; 
  final bool pay; 
  final String type; 
  final double price;
  final String localGoogleUrl; 

  EventModel({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.pay,
    required this.type,
    required this.price,
    required this.localGoogleUrl,
  }); 

  String get formattedDate => DateFormat('dd/MM/yyyy').format(date);

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      imageUrl: map['image_url'], 
      title: map['title'], 
      description: map['description'],
      date: DateTime.parse(map['date']),
      time: map['time'],
      pay: map['pay'], 
      type: map['type'],   
      price: map['price'] != null ? map['price'].toDouble() : 0.0,     
      localGoogleUrl: map['localgoogleurl'], 
    );
  }
}
