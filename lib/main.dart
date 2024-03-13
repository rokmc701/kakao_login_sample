import 'package:flutter/material.dart';
import 'package:kakao_login_sample/screens/login_page.dart';
import 'package:kakao_login_sample/screens/logout_page.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import 'package:kakao_login_sample/provider/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  // 웹 환경에서 카카오 로그인을 정상적으로 완료하려면 runApp() 호출 전 아래 메서드 호출 필요
  WidgetsFlutterBinding.ensureInitialized();

  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: 'db660e6f5e9d223fd4f65951360bb32c', // 앱키 설정
    javaScriptAppKey: '3a9b1545257d92dc03250523f85f3c17', // 자바스크립트 앱키 설정
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/logout': (context) => const LogoutPage(),
      },
    );
  }
}
