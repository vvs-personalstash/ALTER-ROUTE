import 'dart:convert';
import 'package:http/http.dart';

const GOOGLE_API_KEY = 'AIzaSyAyVtndCvM3jSC9VQqT19j7dDHIJAbDGOc';

class LocationHelper {
  static String generateLocationPreviewImage({required double lat,required double long}){
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$long&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$lat,$long&key=$GOOGLE_API_KEY';
  }
  static Future<String> getPlaceAddress ({required double lat,required double long}) async{
    final url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$long&key=$GOOGLE_API_KEY';
    final response = await get(Uri.parse(url));
    print(response.body);
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}