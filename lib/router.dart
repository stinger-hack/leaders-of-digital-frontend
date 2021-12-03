import 'package:fluro/fluro.dart';
import 'package:fluro/fluro.dart' as fluro;
import 'package:stinger_web/pages/auth/login.dart';
import 'package:stinger_web/pages/favorites/favorites_page.dart';
import 'package:stinger_web/pages/showcase/showcase_page.dart';

class FluroRouterClass {
  static final router = fluro.FluroRouter();

  static final _homeHandler = Handler(
    handlerFunc: (context, parameters) {
      return const LogIn();
    },
  );
  static final _showcaseHandler = Handler(
    handlerFunc: (context, parameters) {
      return const ShowcasePage();
    },
  );
  static final _favoritesHandler = Handler(
    handlerFunc: (context, parameters) {
      return const FavoritesPage();
    },
  );

  static void setupRouter() {
    router.define(
      '/',
      handler: _homeHandler,
    );
    router.define(
      '/:showcase',
      handler: _showcaseHandler,
    );
    router.define(
      '/:favorites',
      handler: _favoritesHandler,
    );
  }
}