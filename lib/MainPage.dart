import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_app/communication.dart';
import 'package:flutter_blue_app/pages/changer_coordonne.dart';
import 'package:flutter_blue_app/pages/historiques.dart';
import 'package:flutter_blue_app/pages/home.dart';
import 'package:flutter_blue_app/pages/login.dart';
import 'package:flutter_blue_app/pages/static_page.dart';
import 'package:flutter_blue_app/pages/vehicle_page.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import './SelectBondedDevicePage.dart';
import './ChatPage.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => new _MainPage();
}

class Sidenav extends StatelessWidget {
  Sidenav();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Bridgestone tyre match',
              style: TextStyle(fontSize: 21, color: Colors.red),
            ),
          ),
          Divider(color: Colors.grey.shade400),
          ListTile(
            title: Text('Home'),
            leading: Icon(Icons.move_to_inbox),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Home()));
            },
          ),
          Divider(color: Colors.grey.shade400),
          ListTile(
            title: Text('Profil'),
            leading: Icon(Icons.account_circle_outlined),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => ChangerCoordonne()));
            },
          ),
          Divider(color: Colors.grey.shade400),
          ListTile(
            title: Text('History'),
            leading: Icon(Icons.history_edu_outlined),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Historiques()));
            },
          ),
          Divider(color: Colors.grey.shade400),
          ListTile(
            title: Text('Vehicle'),
            leading: Icon(Icons.car_crash),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => VehiclesPage(BL: "no",)));
            },
          ),
          Divider(color: Colors.grey.shade400),
          ListTile(
            title: Text('Static page'),
            leading: Icon(Icons.history_edu_outlined),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Staticpage()));
            },
          ),
          Divider(color: Colors.grey.shade400),
          ListTile(
            title: Text('Log out'),
            leading: Icon(Icons.logout),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (_) => Login()));
            },
          ),
        ],
      ),
    );
  }
}

class _MainPage extends State<MainPage> {
  int selectedIndex = 0;

  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;

  String _address = "...";
  String _name = "...";

  @override
  void initState() {
    super.initState();

    // Get current state
    FlutterBluetoothSerial.instance.state.then((state) {
      setState(() {
        _bluetoothState = state;
      });
    });

    Future.doWhile(() async {
      // Wait if adapter not enabled
      if (await FlutterBluetoothSerial.instance.isEnabled) {
        return false;
      }
      await Future.delayed(Duration(milliseconds: 0xDD));
      return true;
    }).then((_) {
      // Update the address field
      FlutterBluetoothSerial.instance.address.then((address) {
        setState(() {
          _address = address;
        });
      });
    });

    FlutterBluetoothSerial.instance.name.then((name) {
      setState(() {
        _name = name;
      });
    });

    // Listen for futher state changes
    FlutterBluetoothSerial.instance
        .onStateChanged()
        .listen((BluetoothState state) {
      setState(() {
        _bluetoothState = state;
      });
    });
  }

  // This code is just a example if you need to change page and you need to communicate to the raspberry again
  void init() async {
    Communication com = Communication();
    await com.connectBl(_address);
    com.sendMessage("Hello");
    setState(() {});
  }

  @override
  void dispose() {
    FlutterBluetoothSerial.instance.setPairingRequestHandler(null);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bluetooth Serial '),
        /*   actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle_outlined),
            tooltip: 'Show Snackbar',
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => ChangerCoordonne()));
            },
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            tooltip: 'Go to the next page',
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (_) => Login()));
            },
          ),
        ],*/
      ),
      drawer: Sidenav(),
      body: Container(
        child: ListView(
          children: <Widget>[
            Divider(),
            ListTile(title: const Text('General')),
            SwitchListTile(
              title: const Text('Enable Bluetooth'),
              value: _bluetoothState.isEnabled,
              onChanged: (bool value) {
                // Do the request and update with the true value then
                future() async {
                  // async lambda seems to not working
                  if (value)
                    await FlutterBluetoothSerial.instance.requestEnable();
                  else
                    await FlutterBluetoothSerial.instance.requestDisable();
                }

                future().then((_) {
                  setState(() {});
                });
              },
            ),
            ListTile(
              title: const Text('Bluetooth status'),
              subtitle: Text(_bluetoothState.toString()),
              trailing: ElevatedButton(
                child: const Text('Settings'),
                onPressed: () {
                  FlutterBluetoothSerial.instance.openSettings();
                },
              ),
            ),
            ListTile(
              title: const Text('Local adapter address'),
              subtitle: Text(_address),
            ),
            ListTile(
              title: const Text('Local adapter name'),
              subtitle: Text(_name),
              onLongPress: null,
            ),
            Divider(),
            ListTile(title: const Text('Devices discovery and connection')),
            ListTile(
              title: ElevatedButton(
                child: const Text('Connect to paired device to chat'),
                onPressed: () async {
                  final BluetoothDevice selectedDevice =
                      await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return SelectBondedDevicePage(checkAvailability: false);
                      },
                    ),
                  );

                  if (selectedDevice != null) {
                    print('Connect -> selected ' + selectedDevice.address);
                    _startChat(context, selectedDevice);
                  } else {
                    print('Connect -> no device selected');
                  }
                },
              ),
            ),
            SizedBox(height: 70),
            /* Padding(
              padding: const EdgeInsets.all(20.0),
          child: ElevatedButton.icon(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => Login()));
                  },
                  icon: Icon(Icons.exit_to_app),
                  label: Text("Log out")),
            )*/
          ],
        ),
      ),
    );
  }
  // ignore: non_constant_identifier_names

  void _startChat(BuildContext context, BluetoothDevice server) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ChatPage(server: server);
        },
      ),
    );
  }
}
