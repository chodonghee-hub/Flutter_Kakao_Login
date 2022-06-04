import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:kakao_tutorial/kakao_login.dart';
import 'package:kakao_tutorial/main_view_model.dart';

void main() {
  KakaoSdk.init(nativeAppKey: '22278c5ad7d4076ff846626b882b58a9');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final viewModel = MainViewModel(KakaoLogin());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(viewModel.user?.kakaoAccount?.profile?.profileImageUrl ?? ''),
            Text(
              '${viewModel.isLogined}',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
                onPressed: () async {
                  await viewModel.login();
                  setState(() {});
                },
                child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: () async {
                await viewModel.logout();
                setState((){});
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
