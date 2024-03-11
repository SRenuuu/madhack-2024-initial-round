import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_static_maps_controller/google_static_maps_controller.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Widget buildCompanyLocation(double latitude, double longitude) {
  /// Declare static map controller
  StaticMapController controller = StaticMapController(
    googleApiKey: dotenv.get('GOOGLE_API_KEY', fallback: 'default'),
    width: 400,
    height: 400,
    zoom: 15,
    center: Location(latitude, longitude),
    markers: <Marker>[
      Marker(
        color: Colors.red,
        locations: [
          GeocodedLocation.latLng(latitude, longitude),
        ],
      ),
    ],
  );

  /// Get map image provider from controller.
  /// You can also get image url by accessing
  /// `_controller.url` property.
  ImageProvider image = controller.image;

  return Container(
    height: 200,
    decoration: BoxDecoration(
      color: Colors.blueGrey[100],
      borderRadius: BorderRadius.circular(10),
      image: DecorationImage(
        image: image, // Replace with your image URL
        fit: BoxFit.cover, // Adjust fit as needed (cover, contain, etc.)
      ),
    ),
  );
}
