import 'package:flutter/material.dart';
import 'package:hypertrack_plugin/hypertrack.dart';
import 'package:share/share.dart';
import 'NetworkHelper.dart';

const String publishableKey =
    '1YFl6yTVW1iRksy49YxsG0Okzmz5UL-CEplWNa5NM5mwGOqqf2ylohd-p7X24DM4NhOpyjWxImKx_TEbvJDJHA';

class HyperTrackQuickStart extends StatefulWidget {
  HyperTrackQuickStart({Key key}) : super(key: key);

  @override
  _HyperTrackQuickStartState createState() => _HyperTrackQuickStartState();
}

class _HyperTrackQuickStartState extends State<HyperTrackQuickStart> {
  HyperTrack sdk;
  String deviceId;
  NetworkHelper helper;
  String result = '';
  bool isLink = false;
  bool isLoading = false;
  String shareUrl;

  @override
  void initState() {
    super.initState();
    initializeSdk();
  }

  Future<void> initializeSdk() async {
    sdk = await HyperTrack.initialize(publishableKey);
    deviceId = await sdk.getDeviceId();
    sdk.setDeviceName('KamalRohra');
    helper = NetworkHelper(
      'https://v3.api.hypertrack.com',
      'Basic MnhsRDN4MDludXVNTVFjdjdaMldZa0VmRFV3OlpzN0Q0X2RXV2hpSlE4SHNOcDBCS3Vsb0l2bTdZMzNRQXVMTjNmSEgzenFBOVVhQm5DQ0Nadw==',
      deviceId,
    );
    print(deviceId);
  }

  void shareLink() async {
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
    Share.share(data['views']['share_url'], subject: 'USER NAME\'s Location');
    shareUrl = data['views']['share_url'];
  }

  void startTracking() async {
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

  void endTracking() async {
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

// then build method, we already implented it

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 0.0,
            width: double.infinity,
          ),
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isLoading ? CircularProgressIndicator() : Text(''),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  result,
                  style: TextStyle(
                      color: isLink ? Colors.blue[900] : Colors.red[900],
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          FlatButton(
            child: Text(
              'Start Tracking my Location',
            ),
            onPressed: startTracking,
          ),
          FlatButton(
            child: Text('Share my Location'),
            onPressed: shareLink,
          ),
          FlatButton(
            child: Text('End Tracking my Location'),
            onPressed: endTracking,
          ),
        ],
      ),
    );
  }
}
