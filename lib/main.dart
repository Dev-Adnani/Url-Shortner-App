import 'package:flutter/material.dart';
import 'package:urlshortner/app/routes/app.routes.dart';
import 'package:urlshortner/custom_bloc_provider.dart';
import 'web_url/configure_nonweb.dart'
    if (dart.library.html) 'web_url/configure_web.dart';

void main() {
  configureApp();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Core());
}

class Lava extends StatelessWidget {
  const Lava({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRouter.deciderRoute,
    );
  }
}
