import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'base/observers/base_bloc_observer.dart';

void main() {
  Bloc.observer = BaseBlocObserver();
  runApp(const CatFactTestApp());
}
