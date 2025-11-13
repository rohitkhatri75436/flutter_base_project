//import '../../router/export.dart';

// class PermissionUtil {
//   PermissionUtil._();

//   //permission handling
//   static Future<PermissionStatus?> getPermission(Permission permissionType) async {
//     final PermissionStatus permission = await permissionType.status;
//     if (permission == PermissionStatus.permanentlyDenied) {
//       return permission;
//     }
//     if (permission != PermissionStatus.granted || permission == PermissionStatus.denied) {
//       final Map<Permission, PermissionStatus> permissionStatus = await [permissionType].request();
//       return permissionStatus[permissionType];
//     } else {
//       return permission;
//     }
//   }
// }
