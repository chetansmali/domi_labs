import 'package:assigment/gen/assets.gen.dart';
import 'package:assigment/presentation/screens/rang.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DomiIdEarnScreen extends StatefulWidget {
  const DomiIdEarnScreen({super.key});

  @override
  _DomiIdEarnScreenState createState() => _DomiIdEarnScreenState();
}

class _DomiIdEarnScreenState extends State<DomiIdEarnScreen> {
  GoogleMapController? mapController;
  final LatLng _center = const LatLng(27.9506, -82.4572);
  double _scrollProgress = 0.0;
  int _currentEarnings = 250;
  final int _maxEarnings = 500;

  void _onScroll(double progress) {
    setState(() {
      _scrollProgress = progress;
      _currentEarnings = (250 + (250 * progress)).round();
    });
  }// Tampa coordinates

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _setMapStyle(controller);
  }

  void _setMapStyle(GoogleMapController controller) async {
    String style = '''
    [
      {
        "elementType": "geometry",
        "stylers": [
          {
            "color": "#f5f5f5"
          }
        ]
      },
      {
        "elementType": "labels.icon",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      },
      {
        "elementType": "labels.text.fill",
        "stylers": [
          {
            "color": "#616161"
          }
        ]
      },
      {
        "elementType": "labels.text.stroke",
        "stylers": [
          {
            "color": "#f5f5f5"
          }
        ]
      },
      {
        "featureType": "road",
        "elementType": "geometry",
        "stylers": [
          {
            "color": "#ffffff"
          }
        ]
      }
    ]
    ''';
    controller.setMapStyle(style);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 14,
            ),
            zoomControlsEnabled: false,
          ),

          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      '3A Street, Tampa, Florida',
                      style: TextStyle(color: Colors.white,fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      '\$150/mo',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Assets.pngs.domiLogo.image(height: 32,width: 32),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     GestureDetector(
                       onTap: () => Navigator.pop(context),
                       child: const Icon(Icons.arrow_back, color: Colors.black),
                     ),
                     const Text(
                       '2/4',
                       style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Color(0XFF0000E5)),
                     ),
                   ],
                 ),
                     const SizedBox(height: 20,),
                     const Text(
                      'Earn with your Domi ID',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Open mails and earn money.',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0XFF666666),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Row(
                      children: [
                        Text(
                          'Your Home Value:',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          ' \$2.76M (Est.)',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  DomiIdCustomRangeSelector(
                    initialValue: 250,
                    minValue: 100,
                    maxValue: 400,
                    onChanged: (value) {
                    },
                  ),
                    const SizedBox(height: 8),
                    const Text(
                      'Opening 60 direct digital mails.',
                      style: TextStyle(
                        color: Color(0XFF0000E5),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: const Color(0XFF0000E5),
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        // Handle address claim
                      },
                      child: const Text('Claim This Address',style: TextStyle(fontSize: 16),),
                    ),
                  ],

              ),
            ),
          ),
        ],
      ),
    );
  }
}

