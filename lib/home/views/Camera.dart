import 'package:flutter/material.dart';
import 'package:camera/camera.dart';


class CameraView extends StatefulWidget {

  List<CameraDescription> cameras;

  CameraView(this.cameras);

  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  CameraController _camaraControler;

  @override
  void initState() {
    super.initState();
    _camaraControler =
        CameraController(widget.cameras[0], ResolutionPreset.medium);
    _camaraControler.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }


  @override
  void dispose() {
    _camaraControler?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _camaraControler.value.isInitialized?CameraPreview(_camaraControler):Container();
  }
}

