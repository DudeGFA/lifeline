import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final emergencyProfileState = ChangeNotifierProvider<EmergencyProfileState>(
    (ref) => EmergencyProfileState());

class EmergencyProfileState extends ChangeNotifier {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController phoneNumerController = TextEditingController();
  
  final TextEditingController homeAddressController = TextEditingController();
  final TextEditingController prefferedAddressController =
      TextEditingController();

      
  final TextEditingController conditonController = TextEditingController();
  final TextEditingController medicalNameController = TextEditingController();
  final TextEditingController medicalDosageController = TextEditingController();
  final TextEditingController medicalStartDateController =
      TextEditingController();
       final TextEditingController infoController = TextEditingController();
}
