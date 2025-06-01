import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerService {
  static Future<bool> requestLocationPermission() async {
    final status = await Permission.location.status;
    
    if (status.isDenied) {
      final result = await Permission.location.request();
      return result.isGranted;
    }
    
    return status.isGranted;
  }
}