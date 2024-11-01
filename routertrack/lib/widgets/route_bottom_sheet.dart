import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:routertrack/dto/route_item_dto.dart';
import 'package:routertrack/mycolors/colors.dart';
import 'package:routertrack/widgets/qr_code_scanner_dialog.dart';
import 'package:routertrack/widgets/stepper_timeline.dart';
import '../bloc/route_creation/route_creation_bloc.dart';
import '../bloc/route_creation/route_creation_events.dart';
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
  bool _isVisible = true;
  final List<bool> _selectedTransports = [true, false, false];
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;


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
  }


  @override
  Widget build(BuildContext context) {
    final RouteCreationBloc routeCreationBloc = BlocProvider.of<RouteCreationBloc>(context);

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
                                    icon: const Icon(Icons.qr_code),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return const QrViewDialog();
                                        },
                                      );
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
                            routeCreationBloc.add(RouteEntryAdded(
                                routeItem: RouteItemDTO(
                                  title: name,
                                  description: country,
                                  latitude: double.parse(prediction.lat.toString()),
                                  longitude: double.parse(prediction.lng.toString()),
                                )
                            ));
                          },

                          itemClick: (Prediction prediction) {
                            searchAddressController.text = prediction.description ?? "";
                            searchAddressController.selection = TextSelection.fromPosition(
                                TextPosition(offset: prediction.description?.length ?? 0));
                          },
                          seperatedBuilder: const Divider(),
                          containerHorizontalPadding: 10,


                          itemBuilder: (context, index, Prediction prediction) {
                            return Container(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  const Icon(Icons.location_on),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Expanded(child: Text(prediction.description ?? ""))
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
                              borderColor: MyColorPalette.darkGreen,
                              borderWidth: 0.2,
                              borderRadius: const BorderRadius.all(Radius.circular(8)),
                              selectedBorderColor: MyColorPalette.darkGreen,
                              fillColor: MyColorPalette.darkGreen,
                              isSelected: _selectedTransports,
                              children: [
                                Icon(Icons.directions_car_filled_sharp, color: _selectedTransports[0] == true ? Colors.white : Colors.black),
                                Icon(Icons.directions_bike_outlined, color: _selectedTransports[1] == true ? Colors.white : Colors.black),
                                Icon(Icons.directions_walk_outlined, color: _selectedTransports[2] == true ? Colors.white : Colors.black),
                              ],
                            ),
                            const Spacer(),
                            ElevatedButton.icon(
                              onPressed: () {
                                routeCreationBloc.add(RouteEntryClear());
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 13
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                side: const BorderSide(
                                  color: Color.fromARGB(255, 0, 128, 0),
                                  width: 0.2,
                                ),
                                iconColor: Colors.black,
                              ),
                              icon: const Icon(Icons.delete_rounded, size: 22),
                              label: const Padding(
                                padding: EdgeInsets.only(
                                  left: 5,
                                ),
                                child: Text('Clear', style: TextStyle(
                                  color: Colors.black
                                )),
                              ),
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
                buttonTextStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                buttonStyle: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 13
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  side: const BorderSide(
                    color: Color.fromARGB(255, 0, 128, 0),
                    width: 0.2,
                  ),
                  iconColor: Colors.black,
                ),
                text: "Create Route",
                onPressed: () {
                  routeCreationBloc.add(RoutePersisted());
                },
              ),
            ),
          ),
        ),
      ],

    );
  }
}

