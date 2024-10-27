import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:routertrack/bloc/route_creation/route_item_dto.dart';
import 'package:routertrack/widgets/stepper_timeline.dart';
import '../bloc/route_creation/route_creation_bloc.dart';
import '../bloc/route_creation/route_creation_events.dart';
import '../bloc/search_location_bloc.dart';
import 'CustomElevatedButton.dart';

class RouteBottomSheet extends StatefulWidget {
  const RouteBottomSheet({super.key});

  @override
  State<RouteBottomSheet> createState() => _RouteBottomSheetState();
}

class _RouteBottomSheetState extends State<RouteBottomSheet> {
  final TextEditingController searchAddressController = TextEditingController();
  final FocusNode _searchAddressFocusNode = FocusNode();
  final DraggableScrollableController _draggableScrollableSheetController = DraggableScrollableController();
  bool _isVisible = false;
  late SearchLocationBloc searchLocationBloc;
  List<bool> _selectedTransports = [true, false, false];

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
    _draggableScrollableSheetController.addListener(() {
      if (_isVisible != _draggableScrollableSheetController.size > 0.3){
        setState(() {
          _isVisible = !_isVisible;
        });
      }
    });
    searchLocationBloc = BlocProvider.of<SearchLocationBloc>(context);
  }


  @override
  Widget build(BuildContext context) {
    final RouteCreationBloc _routeCreationBloc = BlocProvider.of<RouteCreationBloc>(context);

    return Stack(
      children: [
        DraggableScrollableSheet(
          controller: _draggableScrollableSheetController,
          snap: true,
          snapSizes: const [0.5],
          expand: false,
          shouldCloseOnMinExtent: false,
          minChildSize: 0.1,
          maxChildSize: 0.8,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 24.0,
                      left: 24.0,
                      right: 24.0,
                      bottom: 12.0
                    ),
                    child: Column(
                      children: [
                        GooglePlaceAutoCompleteTextField(
                          textEditingController: searchAddressController,
                          googleAPIKey:"AIzaSyBSGX8IRUDf0JIDgg2ShwvFMEX-Kn9cbbA",
                          inputDecoration: InputDecoration(
                            hintText: "Search your location",
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 15),
                            icon: Icon(Icons.search),
                            suffixIcon: SizedBox(
                              width: 100,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.my_location_outlined),
                                    onPressed: () {
                                      _routeCreationBloc.add(RouteEntryAdded(
                                          routeItem: RouteItemDTO(
                                            title: "name",
                                            description: "Portugal",
                                            latitude: 1,
                                            longitude: 2,
                                          )
                                      ));
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.qr_code),
                                    onPressed: () {

                                    },
                                  ),

                                ],
                              ),
                            )
                          ),
                          debounceTime: 400,
                          countries: ["pt", "es"],
                          isLatLngRequired: true,
                          getPlaceDetailWithLatLng: (Prediction prediction) {
                            String name = prediction.description?.split(", ").first ?? "";
                            String country = prediction.description ?? "";
                            _routeCreationBloc.add(RouteEntryAdded(
                                routeItem: RouteItemDTO(
                                  title: name,
                                  description: country,
                                  latitude: double.parse(prediction.lat.toString()),
                                  longitude: double.parse(prediction.lng.toString()),
                                )
                            ));

                            searchLocationBloc.add(SearchLocationEvent(LatLng(
                                double.parse(prediction.lat.toString()), double.parse(prediction.lng.toString())
                            )));
                          },

                          itemClick: (Prediction prediction) {
                            searchAddressController.text = prediction.description ?? "";
                            searchAddressController.selection = TextSelection.fromPosition(
                                TextPosition(offset: prediction.description?.length ?? 0));
                          },
                          seperatedBuilder: Divider(),
                          containerHorizontalPadding: 10,


                          // OPTIONAL// If you want to customize list view item builder
                          itemBuilder: (context, index, Prediction prediction) {
                            return Container(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Icon(Icons.location_on),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Expanded(child: Text("${prediction.description ?? ""}"))
                                ],
                              ),
                            );
                          },

                          isCrossBtnShown: true,

                          // default 600 ms ,
                        ),

                        const SizedBox(height: 12),
                        Row(
                          children: [
                            ToggleButtons(
                              onPressed: (int index) {
                                setState(() {
                                  for (int i = 0; i < _selectedTransports.length; i++) {
                                    _selectedTransports[i] = i == index;
                                  }
                                });
                              },
                              borderRadius: const BorderRadius.all(Radius.circular(8)),
                              selectedBorderColor: Colors.blue[700],
                              selectedColor: Colors.white,
                              fillColor: Colors.blue[200],
                              color: Colors.blue[400],
                              isSelected: _selectedTransports,
                              children: [
                                Icon(Icons.directions_car_filled_sharp, color: Colors.black),
                                Icon(Icons.directions_bike_outlined, color: Colors.black),
                                Icon(Icons.directions_walk_outlined, color: Colors.black),
                              ],
                            ),
                            const Spacer(),
                            ElevatedButton.icon(
                              onPressed: () {
                                _routeCreationBloc.add(RouteEntryClear());
                              },
                              icon: const Icon(Icons.delete_rounded),
                              label: const Text('Clear'),
                              iconAlignment: IconAlignment.end,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: const StepperTimeline()
                  ),
                ],
              ),
            );
          }
        ),

        Positioned(
          width: MediaQuery.of(context).size.width,
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Visibility(
              visible: _isVisible,
              child: CustomElevatedButton(
                text: "Optimize",
                onPressed: () {
                  _routeCreationBloc.add(RoutePersisted());
                },
              ),
            ),
          ),
        ),
      ],

    );
  }
}

