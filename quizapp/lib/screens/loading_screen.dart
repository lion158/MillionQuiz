// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_blue/flutter_blue.dart';

// class loading_screen extends StatefulWidget {
//   const loading_screen({Key? key}) : super(key: key);

//   @override
//   _loading_screenState createState() => _loading_screenState();
// }

// class _loading_screenState extends State<loading_screen> {
//   FlutterBlue flutterBlue = FlutterBlue.instance;
//   late BluetoothDevice device;
//   late BluetoothState state;
//   late BluetoothDeviceState deviceState;

//   void scanForDevices() async {
//     var scanSubscription = flutterBlue.scan().listen((scanResult) async {
//       if (scanResult.device.name == "your_device_name") {
//         print("found device");
//         //Assigning bluetooth device
//         device = scanResult.device;
//         //After that we stop the scanning for device
//         stopScanning();
//       }
//     });
//   }

//   void stopScanning() {
//     flutterBlue.stopScan();
//     //scanSubscription.cancel; może być błąd
//     /// https://medium.com/flutter-community/flutter-for-bluetooth-devices-5594f105b146
//     /// https://pub.dev/packages/flutter_blue
//   }

//   connectToDevice() async {
//     //flutter_blue makes our life easier
//     await device.connect();
//   }

//   sendTransparentData(String dataString) async {
//     //Encoding the string
//     List<int> data = utf8.encode(dataString);
//     if (deviceState == BluetoothDeviceState.connected) {
//       await c.write(data); // dokończ!!!
//     }
//   }

//   @override
//   void initState() {
//     super.initState();

//     ///Initialisation and listening to device state
//     //checks bluetooth current state
//     FlutterBlue.instance.state.listen((state) {
//       if (state == BluetoothState.off) {
//         //Alert user to turn on bluetooth.
//       } else if (state == BluetoothState.on) {
//         //if bluetooth is enabled then go ahead.
//         //Make sure user's device gps is on.
//         scanForDevices();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(child: Text('lose')),
//     );
//   }
// }
