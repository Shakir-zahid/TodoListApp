import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/Provider/AppState.dart';
import 'package:todo_list_app/Utils/AppConst.dart';

import 'Model/Todo.dart';
import 'Screens/HomePage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(TodoAdapter());
  runApp(MyApp());
}

Future _initHive() async {
    final documentPath = await getApplicationDocumentsDirectory();
  Hive.init(documentPath.path);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => FutureBuilder(
                future: _initHive(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.error != null) {
                      print(snapshot.error);
                      return Scaffold(
                        body: Center(
                          child: Text('Error initializing hive data store.'),
                        ),
                      );
                    } else {
                      return HomePage();
                    }
                  } else {
                    return Scaffold();
                  }
                },
              ),
          '/AddContactScreen': (context) => Container(),
        },
      ),
    );
  }
}


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//      providers: [ChangeNotifierProvider.value(value: AppState())],
//           child: MaterialApp(
//             debugShowCheckedModeBanner: false,
//         title: appName,
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: HomePage(),
//       ),
//     );
//   }
// }
