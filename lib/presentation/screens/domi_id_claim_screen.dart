import 'package:assigment/presentation/screens/domi_id_earn_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../gen/assets.gen.dart';

class DomiIdClaimScreen extends StatefulWidget {
  const DomiIdClaimScreen({super.key});

  @override
  _DomiIdClaimScreenState createState() => _DomiIdClaimScreenState();
}

class _DomiIdClaimScreenState extends State<DomiIdClaimScreen> {
  final TextEditingController _addressController = TextEditingController();
  List<String> _suggestions = [];
  bool _showSuggestions = false;
  bool _hasAddressValue = false;

  final List<String> _mockAddresses = [
    '3A Street, Tampa, FL',
    '3A Avenue, Tampa, FL',
    '3A Boulevard, Tampa, FL',
  ];

  @override
  void initState() {
    super.initState();
    _addressController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      _hasAddressValue = _addressController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _addressController.removeListener(_updateButtonState);
    _addressController.dispose();
    super.dispose();
  }

  void _onAddressChanged(String value) {
    setState(() {
      if (value.isNotEmpty) {
        _suggestions = _mockAddresses
            .where((address) => address.toLowerCase().contains(value.toLowerCase()))
            .toList();
        _showSuggestions = true;
      } else {
        _showSuggestions = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(27.6648, 81.5158), // Tampa coordinates
              zoom: 13,
            ),
            mapType: MapType.normal,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
          ),
          SafeArea(
            child: Column(
              children: [
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const Icon(
                                  Icons.arrow_back, color: Colors.black),
                              onPressed: () {
                                // Handle back button press
                              },
                            ),
                            const Text(
                              '1/4',
                              style: TextStyle(
                                color: Color(0XFF0000E5),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(top: Radius
                              .circular(20),),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Claim your Domi ID',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Open mails and earn money.',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0XFF666666),
                              ),
                            ),
                            const SizedBox(height: 24),
                            const Text(
                              'Complete Address',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextField(
                              controller: _addressController,
                              onChanged: _onAddressChanged,
                              decoration: InputDecoration(
                                hintText: '3A Street',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                prefixIcon: const Icon(
                                    Icons.location_on, color: Colors.blue),
                                suffixIcon:const Icon(
                                    Icons.my_location_sharp, color: Colors.red),
                              ),
                            ),
                            if (_showSuggestions)
                              Container(
                                margin: const EdgeInsets.only(top: 8),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: _suggestions.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      leading: const Icon(Icons.location_on,
                                          color: Colors.blue),
                                      title: Text(_suggestions[index]),
                                      onTap: () {
                                        setState(() {
                                          _addressController.text =
                                          _suggestions[index];
                                          _showSuggestions = false;
                                        });
                                      },
                                    );
                                  },
                                ),
                              ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _hasAddressValue ? const Color(0XFF0000E5) : Colors.grey[300],
                                minimumSize: const Size(double.infinity, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const DomiIdEarnScreen()),
                                );
                              },
                              child: Text(
                                'Claim Your Address',
                                style: TextStyle(
                                  color: _hasAddressValue ? Colors.white : Colors.grey[600],
                                ),
                              ),

                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}




