import 'package:flutter/material.dart';
import 'package:flutterChallenge/blocs/map/location_bloc.dart';
import 'package:flutterChallenge/blocs/map/location_event.dart';
import 'package:flutterChallenge/blocs/map/location_state.dart';
import 'package:flutterChallenge/blocs/map/random_location_bloc.dart';
import 'package:flutterChallenge/blocs/map/random_location_event.dart';
import 'package:flutterChallenge/blocs/map/random_location_state.dart';
import 'package:flutterChallenge/ui/widgets/loading_widget.dart';
import 'package:flutterChallenge/ui/widgets/map_banner_widget.dart';
import 'package:flutterChallenge/ui/widgets/main_button_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mapbox_navigation/library.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  MapBoxNavigationViewController _controller;
  MapBoxNavigation _directions;
  LocationBloc locationBloc;
  RandomLocationBloc randomLocationBloc;

  @override
  void initState() {
    locationBloc = BlocProvider.of<LocationBloc>(context);
    locationBloc.add(GetLocationEvent());
    randomLocationBloc = BlocProvider.of<RandomLocationBloc>(context);
    _directions = MapBoxNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Maps'),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Image.asset(
                "assets/image/navigation.png",
                height: 30.0,
              ),
            ),
          ],
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            child: BlocBuilder<LocationBloc, LocationState>(
              builder: (context, state) {
                if (state is LocationInitialState) {
                  return Text("Get location ran");
                } else if (state is LocationLoadingState) {
                  return Center(child: LoadingWidget());
                } else if (state is LocationLoadedState) {
                  return Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        color: Colors.grey,
                        child: MapBoxNavigationView(
                            options: state.options,
                            onCreated: (MapBoxNavigationViewController
                                controller) async {
                              _controller = controller;
                              controller.initialize();
                            }),
                      ),
                      Positioned(
                        bottom: 60.0,
                        right: 10.0,
                        child: BlocBuilder<RandomLocationBloc,
                            RandomLocationState>(
                          builder: (context, state) {
                            if (state is RandomLocationLoadingState) {
                              return Container(
                                width: 150.0,
                                child: Center(
                                  child: SizedBox(
                                    height: 25.0,
                                    width: 25.0,
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              );
                            } else if (state is RandomLocationLoadedState) {
                              _controller.buildRoute(
                                  wayPoints: state.wayPoints);
                              return Row(
                                children: [
                                  Container(
                                    child: GestureDetector(
                                      onTap: () async {
                                        randomLocationBloc
                                            .add(GetRandomLocationEvent());
                                      },
                                      child: MainButtonWidget(
                                          title: "Next 10KM Route",
                                          width: 150.0,
                                          height: 40.0),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      await _directions.startNavigation(
                                          wayPoints: state.wayPoints,
                                          options: MapBoxOptions(
                                              zoom: 20.0,
                                              mode: MapBoxNavigationMode
                                                  .drivingWithTraffic,
                                              simulateRoute: true,
                                              language: "en",
                                              isOptimized: true,
                                              units: VoiceUnits.metric));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: MainButtonWidget(
                                          height: 40,
                                          width: 50,
                                          title: "Start"),
                                    ),
                                  ),
                                ],
                              );
                            }
                            return Container(
                              child: GestureDetector(
                                  onTap: () {
                                    randomLocationBloc
                                        .add(GetRandomLocationEvent());
                                  },
                                  child: MainButtonWidget(
                                    width: 150.0,
                                    height: 40.0,
                                    title: "Start Routing 10KM",
                                  )),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else if (state is LocationErrorState) {
                  return Text("Error: ${state.message}");
                }
                return Text("Error $state");
              },
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: MapBannerWidget(),
          ),
        ],
      ),
    );
  }
}
