
import 'package:flutter_http_fetch_data/ui/pages/index.dart';
import 'package:go_router/go_router.dart';

final mainRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage()
    ),
  ]
);