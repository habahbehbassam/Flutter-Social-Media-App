import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_media_app/features/change_language/presentation/bloc/selected_language_bloc.dart';
import 'package:flutter_social_media_app/features/change_language/presentation/bloc/selected_language_events.dart';

import 'features/change_language/presentation/bloc/selected_language_state.dart';
import 'features/users_list/presentation/pages/users_list_page.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return serviceLocator<SelectedLanguageBloc>()
          ..add(GetSelectedLanguageEvent());
      },
      child: BlocBuilder<SelectedLanguageBloc, SelectedLanguageState>(
        builder: (context, state) {
          if (state is Loaded) {
            return getMaterialApp(state.selectedLanguage);
          }
          if (state is NewLanguageSelected) {
            return getMaterialApp(state.selectedLanguage);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget getMaterialApp(Locale selectedLanguage) {
    return MaterialApp(
      onGenerateTitle: (context) {
        return AppLocalizations.of(context)?.appTitle ?? '';
      },
      locale: selectedLanguage,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        primaryColor: Colors.blueAccent.shade700,
        backgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Colors.blueAccent.shade400),
      ),
      home: const UserListPage(),
    );
  }
}
