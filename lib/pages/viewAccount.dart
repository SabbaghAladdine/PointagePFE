import 'package:FaceNetAuthentication/pages/changeUserInfo.dart';
import 'package:FaceNetAuthentication/pages/widgets/auth-action-button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ViewAccount extends StatelessWidget {
  ViewAccount(this.u);

  User u;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'User :' + u.user,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'CIN :' + u.cin.toString(),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Status :' + u.status,
              style: TextStyle(fontSize: 20),
            ),
            TextButton(
                onPressed: ()async{
                  u = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChangePass(u)
              ),

            );
                  Navigator.pop(context,u);
            }, child: Text('Change Password'),),

          ],
        ),
      ),
    ));
  }
}
