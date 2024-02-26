import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:login/Contact/ContactPage.dart';
import 'package:login/Home/HomePage.dart';
import 'package:login/ActivePage/Main_Wrapper.dart';
import 'package:login/Profile/ProfilePage.dart';

class AppNavigation {
  AppNavigation._();

  static String initR = '/Home';

  //Private navigatiors keys
  static final _rootNavigatiorKey = GlobalKey<NavigatorState>();
  static final _rootNavigatiorHome = GlobalKey<NavigatorState>(debugLabel: 'ShelHome');
  static final _rootNavigatiorAddContact = GlobalKey<NavigatorState>(debugLabel: 'ShelAddCT');
  static final _rootNavigatiorProfile = GlobalKey<NavigatorState>(debugLabel: 'ShelProfile');



  //go router configuration


  static final GoRouter router = GoRouter(
    initialLocation: initR,
    navigatorKey:_rootNavigatiorKey,
    routes: <RouteBase>[

      //Mainwrapper router
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => MainWrapper(navigationShell: navigationShell),
          branches: <StatefulShellBranch>[


            //branch home
            StatefulShellBranch(
              navigatorKey: _rootNavigatiorHome,
              routes: [
                GoRoute(
                  path: '/Home',
                  name: 'Hompage',
                  parentNavigatorKey: _rootNavigatiorHome,
                  builder: (context, state){
                    return HomePage(
                      key: state.pageKey,
                    );
                  }
                )
              ],
            ),
            //branch add contact
            //brach home
            StatefulShellBranch(
              navigatorKey: _rootNavigatiorAddContact,
              routes: [
                GoRoute(
                    path: '/Contact',
                    name: 'AddContact',
                    builder: (context, state){
                      return ContactPage(
                        key: state.pageKey,
                      );
                    }
                )
              ],
            ),


            //brach AddContact
            StatefulShellBranch(
              navigatorKey: _rootNavigatiorProfile,
              routes: [
                GoRoute(
                    path: '/Profile',
                    name: 'Profile',
                    builder: (context, state){
                      return Profile(
                        key: state.pageKey,
                      );
                    }
                )
              ],
            )
          ],
      )
      

    ],
  );
}