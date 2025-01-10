import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konfio_challenge/di/di.dart';
import 'package:konfio_challenge/presentation/home/home_cubit.dart';
import 'package:konfio_challenge/presentation/home/home_page.dart';

part 'theme.dart';

class KonfioApp extends StatelessWidget {
  const KonfioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _theme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
      ],
      home: BlocProvider(
        create: (context) => sl<HomeCubit>()..fetchDogs(),
        child: const HomePage(),
      ),
    );
  }
}
