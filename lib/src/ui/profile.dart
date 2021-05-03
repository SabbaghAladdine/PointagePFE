import 'file:///E:/PointagePFE/lib/src/ui/Presence.dart';
import 'file:///E:/PointagePFE/lib/src/ui/viewAccount.dart';
import 'file:///E:/PointagePFE/lib/src/ui/check.dart';
import 'file:///E:/PointagePFE/lib/src/ressources/api_provider.dart';
import 'file:///E:/PointagePFE/lib/src/ressources/auth-action-button.dart';
import 'package:FaceNetAuthentication/src/models/User.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class Profile extends StatelessWidget {
   Profile({Key key, @required this.username, @required this.fp}) : super(key: key);

  FichePresence fp;
  User username;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome back, ' + username.user + '!'),
        leading: Container(),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            RaisedButton(
              child: Text('Logout'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage()
                  ),
                );
              },
            ),
            RaisedButton(
              child: Text('Presence'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Presence(fp)
                  ),
                );
              },
            ),
            RaisedButton(
                child: Text('IN/OUT'),
                onPressed: () async{
                 fp = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Check(fp: fp,user: username)
                    ),
                  );
                 fp = await ApiService().loadPresence(username.cin);
                }

            ),
            RaisedButton(
                child: Text('Account settings'
                    ''),
                onPressed: () async{
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewAccount(username)
                    ),
                  );
                }

            )
            ,]

    ),
    )
    );
  }
}