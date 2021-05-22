import 'package:flutter/material.dart';
import 'package:sbsc_todo_app/util/locationList.dart';
import 'package:sbsc_todo_app/screens/weather_result.dart';

class AddLocation extends StatefulWidget {
  @override
  _AddLocationState createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  // This will be displayed below the autocomplete field
  String selectedLocation;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/city_background.jpeg'),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              SizedBox(height: 20),
              Center(
                  child: Text(
                'Search Weather Location',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              )),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Autocomplete(
                      optionsBuilder: (TextEditingValue value) {
                        // When the field is empty
                        if (value.text.isEmpty) {
                          return [''];
                        }

                        // The logic to find out which ones should appear
                        return countryList.where((suggestion) => suggestion
                            .toLowerCase()
                            .contains(value.text.toLowerCase()));
                      },
                      onSelected: (value) {
                        setState(() {
                          selectedLocation = value;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WeatherResult(
                                      location: selectedLocation,
                                    )),
                          );
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
