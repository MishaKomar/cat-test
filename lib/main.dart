import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'base/observers/base_bloc_observer.dart';
import 'base/storages/provider/hive_storage_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveStorageProvider.init();
  Bloc.observer = BaseBlocObserver();
  runApp(const CatFactTestApp());
}
