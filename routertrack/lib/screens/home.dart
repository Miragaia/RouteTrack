import 'package:flutter/material.dart';
import 'package:routertrack/screens/map.dart';
import 'package:routertrack/widgets/stores_map.dart'; // Assuming StoresMap is your map screen

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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        // Navigate to StoresMap page
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
                          padding: EdgeInsets.all(24.0), // Increase padding
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.add_circle_outline,
                                size: 100, // Bigger icon
                                color: Colors.blue,
                              ),
                              SizedBox(height: 20), // More spacing between icon and text
                              Text(
                                'CREATE TRIP',
                                style: TextStyle(
                                  fontSize: 26, // Bigger text
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
              SizedBox(height: 40), // More space between the cards
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
                        padding: EdgeInsets.all(24.0), // Increase padding
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.map,
                              size: 100, // Bigger icon
                              color: Colors.green,
                            ),
                            SizedBox(height: 20), // More spacing between icon and text
                            Text(
                              'SHOW TRIPS',
                              style: TextStyle(
                                fontSize: 26, // Bigger text
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
            ],
          ),
        ),
      ),
    );
  }
}
