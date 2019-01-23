import 'package:fluro/fluro.dart';

class App {
  static Router router;

  App(){
    App.router = this.initRoutes();
  }

  Router initRoutes() {
    final Router router = new Router();
    return router;
  }

}