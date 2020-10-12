import 'package:auth/screens/home/home_v.dart';
import 'package:auth/screens/sign_in/sign_in_view.dart';
import 'package:auto_route/auto_route_annotations.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(path: "/homePageViewRoute", page: HomePageView),
  MaterialRoute(
    path: "signUpViewRoute",
    page: SignPageView,
  )
]
// routes: <AutoRoute>[
//   // initial route is named "/"
//   MaterialRoute(
//       page: HomePageView, initial: false, name: "homePageViewRoute"),
//   MaterialRoute(page: SignPageView, initial: false, name: "signUpViewRoute"),
// ],
    )
class $Router {
  // HomePageView homePageViewRoute;
  // SignPageView signUpViewRoute;
}
