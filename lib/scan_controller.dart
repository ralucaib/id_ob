import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:tflite_v2/tflite_v2.dart';

class ScanController extends GetxController{
  final RxBool _isInitialized = RxBool(false);
  late CameraController _cameraController;
  late List<CameraDescription> _cameras;
  int imgCount = 0;

  bool get isInitialized => _isInitialized.value;
  CameraController get cameraController => _cameraController;

  @override
  void dispose() {
    _isInitialized.value=false;
    _cameraController.dispose();
    super.dispose();
    Tflite.close();
  }

  Future<void> _initTflite() async{
    String? res = await Tflite.loadModel(
        model: "assets/model.tflite",
        labels: "assets/etichete.txt",
        numThreads: 1, // defaults to 1
        isAsset: true, // defaults to true, set to false to load resources outside assets
        useGpuDelegate: false // defaults to false, set to true to use GPU delegate
    );
  }

  Future<void> initCamera() async{
    _cameras = await availableCameras();
    _cameraController = CameraController(_cameras[0], ResolutionPreset.max);
    _cameraController.initialize().then((value) {
      _isInitialized.value=true;
      cameraController.startImageStream((image) {
        imgCount++;
        if (imgCount % 10 == 0){
          imgCount = 0;
          objectRecognition(image);
        }
      });
      _isInitialized.refresh();
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
          print('Ati refuzat accesul aplicatiei la camera');
            break;
          default:
          print('Erori neclasificate');
            break;
        }
      }
    });
  }

  Future<void> objectRecognition(CameraImage img) async{
    var recognitions = await Tflite.runModelOnFrame(
        bytesList: img.planes.map((plane) {return plane.bytes;}).toList(),// required
        imageHeight: img.height,
        imageWidth: img.width,
        imageMean: 127.5,   // defaults to 127.5
        imageStd: 127.5,    // defaults to 127.5
        rotation: 90,       // defaults to 90, Android only
        numResults: 2,      // defaults to 5
        threshold: 0.1,     // defaults to 0.1
        asynch: true        // defaults to true
    );

    print(recognitions);
  }

  @override
  void onInit() {
    initCamera();
    _initTflite();
    super.onInit();
  }

}