import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:maps_app/helpers/location_helper.dart';
import 'package:maps_app/screens/map_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationInput extends StatefulWidget {
  final Function onSelectPlace;
  LocationInput(this.onSelectPlace);
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;
  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(lat: locData.latitude!, long: locData.longitude!);
    print(locData.latitude);
    print(locData.longitude);
    setState(() {
      _previewImageUrl=staticMapImageUrl;
    });
    widget.onSelectPlace(locData.latitude,locData.longitude);
  }

  Future<void> _selectOnMap() async{
    final selectedLocation = await Navigator.of(context).push<LatLng>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx)=> MapScreen(
          isSelecting: true,
        )
      )
    );
    if(selectedLocation==null){
      return;
    }
    widget.onSelectPlace(selectedLocation.latitude,selectedLocation.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.blueAccent),
          ),
          child: _previewImageUrl == null
              ? Text(
                  'No location chosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: TextButton.icon(
                icon: Icon(
                  Icons.location_on,
                ),
                label: Text(
                  'Current location',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith(
                      (state) => Colors.orange),
                ),
                onPressed: _getCurrentUserLocation,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: TextButton.icon(
                    icon: Icon(
                      Icons.map,
                    ),
                    label: Text(
                      'Select On Map',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.resolveWith(
                          (state) => Colors.orange),
                    ),
                    onPressed: _selectOnMap,
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
