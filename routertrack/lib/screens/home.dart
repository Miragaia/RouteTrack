import 'package:flutter/material.dart';
import 'package:routertrack/screens/map.dart';
import 'package:routertrack/screens/BluetoothConnectionPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0), // Reduced padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MapScreen(),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(20.0), // Reduced padding
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.add_circle_outline,
                                size: 80, // Reduced icon size
                                color: Colors.blue,
                              ),
                              SizedBox(height: 16), // Reduced spacing
                              Text(
                                'CREATE TRIP',
                                style: TextStyle(
                                  fontSize: 24, // Slightly smaller text
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20), // Reduced space between cards
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(20.0), // Reduced padding
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.map,
                              size: 80, // Reduced icon size
                              color: Colors.green,
                            ),
                            SizedBox(height: 16), // Reduced spacing
                            Text(
                              'SHOW TRIPS',
                              style: TextStyle(
                                fontSize: 24, // Slightly smaller text
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20), // Reduced space for smaller card alignment
              Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BluetoothConnectionPage(),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0), // Slightly reduced padding
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.watch,
                            size: 50, // Reduced icon size
                            color: Colors.orange,
                          ),
                          SizedBox(height: 8), // Reduced spacing
                          Text(
                            'CONNECT TO SMARTWATCH',
                            style: TextStyle(
                              fontSize: 16, // Slightly smaller text
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
