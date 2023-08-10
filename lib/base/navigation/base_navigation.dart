import 'package:cattest/base/repositories/fact_repository.dart';
import 'package:cattest/pages/1_home/bloc/home_bloc.dart';
import 'package:cattest/pages/1_home/home_page.dart';
import 'package:cattest/pages/2_history/bloc/history_bloc.dart';
import 'package:cattest/pages/2_history/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FactsAppRouter {
  static const homePath = '/';
  static const historyPath = '/history';

  static final routes = {
    homePath: (context) => BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(
            repository: FactsRepository.i,
          ),
          child: const HomePage(),
        ),
    historyPath: (context) => BlocProvider<HistoryBloc>(
          create: (context) => HistoryBloc(
            repository: FactsRepository.i,
          ),
          child: const HistoryPage(),
        ),
  };
}
