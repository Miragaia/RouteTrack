import 'package:flutter/material.dart';
import 'CustomElevatedButton.dart';
import 'CustomTextFormField.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

class RouteBottomSheet extends StatefulWidget {
  const RouteBottomSheet({super.key});

  @override
  State<RouteBottomSheet> createState() => _RouteBottomSheetState();
}

class _RouteBottomSheetState extends State<RouteBottomSheet> {
  final TextEditingController searchAddressController = TextEditingController();
  final FocusNode _searchAddressFocusNode = FocusNode();
  final DraggableScrollableController _draggableScrollableSheetController = DraggableScrollableController();

  @override
  void initState() {
    super.initState();
    _searchAddressFocusNode.addListener(() {
      _draggableScrollableSheetController.animateTo(
        0.5,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: _draggableScrollableSheetController,
      snap: true,
      snapSizes: const [0.5],
      expand: false,
      shouldCloseOnMinExtent: false,
      minChildSize: 0.1,
      maxChildSize: 0.8,
      builder: (context, scrollController) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            controller: scrollController,
            child: IntrinsicHeight(
              child: Column(
                children: [
                  CustomTextFormField(
                    onChanged: _handlePressButton,
                    controller: searchAddressController,
                    focusNode: _searchAddressFocusNode,
                    hintText: "Add Address",
                    textInputType: TextInputType.emailAddress,
                    prefix: const Icon(Icons.location_on_outlined),
                    suffix: const Icon(Icons.visibility_outlined),
                    autofocus: false,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.directions_car_filled_sharp, color: Colors.black, size: 40),
                      SizedBox(width: 10),
                      Icon(Icons.directions_bike_outlined, color: Colors.black, size: 40),
                      SizedBox(width: 10),
                      Icon(Icons.directions_walk_outlined, color: Colors.black, size: 40),
                      Spacer(),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.delete_rounded),
                        label: const Text('Clear'),
                        iconAlignment: IconAlignment.end,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {print("CLiCKE");},
                          icon: Icon(Icons.home, color: Colors.black, size: 40,)
                      ),
                      SizedBox(width: 10),
                      Text("HOME", style: TextStyle(fontSize: 20, color: Colors.black45),),
                    ],
                  ),

                  Row(
                    children: [
                      IconButton(
                          onPressed: () {print("CLiCKE");},
                          icon: Icon(Icons.location_on_sharp, color: Colors.black, size: 40,
                          )),
                      SizedBox(width: 10),
                      Text("Final Destination", style: TextStyle(fontSize: 20, color: Colors.black45),),
                    ],
                  ),

                  Text("ce"),Text("ce"),Text("ce"),Text("ce"),Text("ce"),Text("ce"),Text("ce"),Text("ce"),

                  Spacer(),
                  CustomElevatedButton(
                    text: "Create",
                    onPressed: () {

                    },
                  ),

                ],
              ),
            ),
          ),
        );
      }
    );
  }


  Future<void> _handlePressButton(String content) async {
    // show input autocomplete with selected mode
    // then get the Prediction selected
    const API_KEY = "AIzaSyBSGX8IRUDf0JIDgg2ShwvFMEX-Kn9cbbA";
    Prediction? p = await PlacesAutocomplete.show(
        context: context,
        apiKey: API_KEY,
        mode: Mode.fullscreen, // Mode.overlay
        language: "en",
        components: [Component(Component.country, "pk")]);



    if (p != null) {
      GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: API_KEY);
      String placeId = p.placeId ?? "";
      PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(placeId);
      final lat = detail.result.geometry?.location.lat;
      final lng = detail.result.geometry?.location.lng;
      print("lat $lat, lng $lng");
    }


  }
}
