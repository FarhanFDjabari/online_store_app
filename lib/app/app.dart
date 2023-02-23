import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_order_app/app/routes/router.dart';
import 'package:online_order_app/app/styles/theme.dart';
import 'package:online_order_app/app/widgets/remove_focus_node.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(680, 1780),
      builder: (context, child) => GestureDetector(
        onTap: () => removeFocusNode(context),
        child: MaterialApp.router(
          title: 'Online Store',
          debugShowCheckedModeBanner: false,
          theme: getAppTheme(),
          darkTheme: getAppTheme(isDarkMode: true),
          themeMode: ThemeMode.system,
          routerConfig: router,
          builder: (context, child) {
            return ScrollConfiguration(
              behavior: const CupertinoScrollBehavior(),
              child: child ?? Container(),
            );
          },
        ),
      ),
    );
  }
}
