import 'package:crm_flutter/app_config.dart';
import 'package:crm_flutter/core/app.dart';
import 'package:crm_flutter/logic/bloc/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppConfig.setUp();
  AppConfig.dependencySetup();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt.get<AuthBloc>()),
        BlocProvider.value(value: getIt.get<UserBloc>()),
        BlocProvider.value(value: getIt.get<AdminGroupManagementBloc>()),
        BlocProvider.value(value: getIt.get<AdminUserManagementBloc>()),
      ],
      child: const App(),
    ),
  );
}
