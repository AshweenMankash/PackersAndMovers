import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shyft_packers_and_movers/BLoc/ShyftBloc.dart';
import 'package:shyft_packers_and_movers/BlocProvider/LoginBLocProvider.dart';
import 'package:shyft_packers_and_movers/Widgets/ConstantWidgets.dart';
import 'package:shyft_packers_and_movers/Widgets/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ShyftBLocProvider(
      child: MaterialApp(
        title: 'shyft',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ShyftBLoc _bloc;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _bloc = ShyftBLocProvider.of(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
        stream: _bloc.loginBloc.getAuthState,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.uid != null) {
              return Scaffold(
                appBar: ConstantWidgets.appbarWithProfile(
                    SignOut: _bloc.loginBloc.signOut),
                body: SafeArea(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: HomePageWidget(),
                  ),
                ),
                resizeToAvoidBottomPadding: false,
              );
            } else {
              _bloc.loginBloc.signIn();
              return loadingWidget();
            }
          } else {
            _bloc.loginBloc.signIn();
            return loadingWidget();
          }
        });
  }

  Widget loadingWidget() {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(),
              ),
              Text("Logging In")
            ],
          ),
        ),
      ),
    );
  }
}
