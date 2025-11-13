import 'dart:developer';

import '../../router/export.dart';

enum ImageType { camera, gallery }

mixin ImageMixin {
  final ImagePicker _imagePicker = ImagePicker();

  void showImagePickerBottomSheet(BuildContext context, Function(File file, String mimeType) onImageSelected) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text(AppStrings.txtGallery),
                onTap: () async {
                  Navigator.of(context).pop();
                  await handleImageSelection(context, ImageType.gallery, onImageSelected);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text(AppStrings.txtCamera),
                onTap: () async {
                  Navigator.of(context).pop();
                  await handleImageSelection(context, ImageType.camera, onImageSelected);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> handleImageSelection(
      BuildContext context, ImageType type, Function(File file, String mimeType) onImageSelected) async {
    final file = await getImage(context, type);
    if (file != null) {
      final mimeType = lookupMimeType(file.path);
      if (mimeType == 'image/jpeg' || mimeType == 'image/png') {
        onImageSelected(file, mimeType!);
      } else {
        showSnackBar(AppValidationMsg.onlyImageAllowed, SnackType.failed);
      }
    }
  }

  Future<File?> getImage(BuildContext context, ImageType getImageType) async {
    try {
      return (getImageType == ImageType.camera) ? await getImageFromCamera() : await getImageFromGallery();
    } catch (e) {
      log('Image Picker error: ${e.toString()}', name: 'Image Picker');
      return null;
    }
  }

  Future<File?> _compressImage(File file) async {
    final dir = await getTemporaryDirectory();
    final targetPath = '${dir.path}/${DateTime.now().millisecondsSinceEpoch}_compressed.jpg';
    final result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 70,
      minWidth: 1080,
      minHeight: 1080,
      format: CompressFormat.jpeg,
    );
    if (result != null) {
      return File(result.path);
    }
    return file;
  }

  Future<File?> getImageFromCamera() async {
    try {
      final pickedFile = await _imagePicker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        final file = File(pickedFile.path);
        // if (await file.length() > 10 * 1024 * 1024) {
        //   showSnackBar(AppValidationMsg.imageLessThanTen, SnackType.failed);
        //   return null;
        // }
        final compressed = await _compressImage(file);
        return compressed;
      }
      return null;
    } catch (e) {
      log('Image Picker error: ${e.toString()}', name: 'Image Picker');
      return null;
    }
  }

  Future<File?> getImageFromGallery() async {
    try {
      final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final file = File(pickedFile.path);
        // if (await file.length() > 20 * 1024 * 1024) {
        //   showSnackBar(AppValidationMsg.imageLessThanTen, SnackType.failed);
        //   return null;
        // }
        final compressed = await _compressImage(file);
        return compressed;
      }
      return null;
    } catch (e) {
      log('Image Picker error: ${e.toString()}', name: 'Image Picker');
      return null;
    }
  }
}
