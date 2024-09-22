import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/authentication_services.dart';

final signUpEmail = StateProvider.autoDispose<TextEditingController>(
    (ref) => TextEditingController());
final signUpPassword = StateProvider.autoDispose<TextEditingController>(
    (ref) => TextEditingController());
final confirmPassword = StateProvider.autoDispose<TextEditingController>(
    (ref) => TextEditingController());
final formKeySignUp =
    StateProvider<GlobalKey<FormState>>((ref) => GlobalKey<FormState>());

final signInPhone = StateProvider.autoDispose<TextEditingController>(
    (ref) => TextEditingController());
final signInPassword = StateProvider.autoDispose<TextEditingController>(
    (ref) => TextEditingController());
final formKeySignIn =
    StateProvider<GlobalKey<FormState>>((ref) => GlobalKey<FormState>());

final authenticationProvider = Provider((ref) => AuthenticationServices());
