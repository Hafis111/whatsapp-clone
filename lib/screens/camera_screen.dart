import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/camera_screen.dart';

List<CameraDescription> cameras = [];

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  Future<void>? camera_value;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(cameras[1], ResolutionPreset.high);
    camera_value = _cameraController.initialize();
  }

  Widget build(BuildContext context) {
    return 
      
      FutureBuilder(
        future: camera_value,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_cameraController);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      );
  }
}
