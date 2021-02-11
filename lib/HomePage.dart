import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hypertrack_plugin/hypertrack.dart';
import 'package:sms_maintained/sms.dart';
import 'package:safety_net/FirebaseMethods.dart';
import 'package:safety_net/SafePlace.dart';

import 'NetworkHelper.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int state = 0;
  int pageNum;
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  Map contactNumbers;
  HyperTrack sdk;
  String deviceId;
  NetworkHelper helper;
  String result = '';
  bool isLink = false;
  bool isLoading = false;
  String shareUrl;
  bool sharing = false;

  @override
  void initState() {
    super.initState();
    initializeSdk();
  }

  Future<void> initializeSdk() async {
    sdk = await HyperTrack.initialize(publishableKey);
    deviceId = await sdk.getDeviceId();
    sdk.setDeviceName('User');
    helper = NetworkHelper(
      'https://v3.api.hypertrack.com',
      'Basic MnhsRDN4MDludXVNTVFjdjdaMldZa0VmRFV3OlpzN0Q0X2RXV2hpSlE4SHNOcDBCS3Vsb0l2bTdZMzNRQXVMTjNmSEgzenFBOVVhQm5DQ0Nadw==',
      deviceId,
    );
    print(deviceId);
  }

  Future<void> shareLink() async {
    setState(() {
      isLoading = true;
      result = '';
    });
    var data = await helper.getData();
    setState(() {
      print("OVER HEREEEEEEEEEEEE");
      print(data.toString());
      result = data['views']['share_url'];
      isLink = true;
      isLoading = false;
    });
    shareUrl = data['views']['share_url'];
  }

  Future<void> startTracking() async {
    setState(() {
      isLoading = true;
      result = '';
    });
    var startTrack = await helper.startTracing();
    setState(() {
      result = (startTrack['message']);
      print("RESULTTTTTTTTTTTTTTTTTTTT");
      print(result);
      isLink = false;
      isLoading = false;
    });
  }

  Future<void> endTracking() async {
    setState(() {
      isLoading = true;
      result = '';
    });
    var endTrack = await helper.endTracing();
    setState(() {
      result = (endTrack['message']);
      isLink = false;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 400,
                width: 250,
                child: FlatButton(
                  onPressed: () async {
                    sharing = true;
                    await startTracking();
                    await shareLink();
                    contactNumbers = await getContacts();
                    if (noContacts(contactNumbers)) {
                      for (int i = 1; i <= 4; i++) {
                        sendSms(contactNumbers['contact$i'], shareUrl);
                      }
                    } else {
                      _showNoContactsDialog();
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/help-button.png'),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Press to send alert",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink),
                      )
                    ],
                  ),
                ),
              ),

            SizedBox(
              height: 10,
            ),
            Container(
              child: FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/contacts');
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.pink),
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add Contacts',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.quick_contacts_dialer),
                    ],
                  ),
                ),
              ),
            )
          ]),
    );
  }

  sendSms(int number, String link) {
    SmsSender sender = new SmsSender();
    String msg;
    msg = "Help Me! I am in danger.\nMy location is $link";
    sender.sendSms(new SmsMessage(number.toString(), msg));
  }

  Future<void> _showNoContactsDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('No Emergency Contacts'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Please add contacts!'),
                // Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  bool noContacts(contact) {
    for (int i = 0; i < contact.length; i++) {
      if (contact[i] != 0) {
        return false;
      }
    }
    return true;
  }
}


// class ShowButton extends StatefulWidget {
//   @override
//   _ShowButtonState createState() => _ShowButtonState();
// }

// class _ShowButtonState extends State<ShowButton> {
//   bool sharing = false;
//   Widget show;
//   @override
//   Widget build(BuildContext context) {
//     if(!sharing){
//       show =
//     }
//     return Container();
//   }
// }
