import 'package:fluro/fluro.dart';

import 'package:vertical_landing_app/routes/handlers.dart';

class Routes {

  static final fluroRouter = FluroRouter();

  static void configureRoutes() {
    //* Page Not Found
    fluroRouter.notFoundHandler = homeHandler;

    //* Routes
    fluroRouter.define('/:page', handler: homeHandler);
  }

}