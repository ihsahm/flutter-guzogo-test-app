import 'package:equatable/equatable.dart';

class User {
  const User({
    required this.email,
    required this.name,
  });

  final String name;
  final String email;
}
