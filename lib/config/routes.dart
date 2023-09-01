import 'package:flutter/material.dart';
import 'package:flutter_project/bloc/auth_bloc.dart';
import 'package:flutter_project/components/navbar.dart';
import 'package:flutter_project/cubits/cubits.dart';

List<Page> onGenerateAppViewPages(AuthStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AuthStatus.authenticated:
      return [NavBar.page()];
    case AuthStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
