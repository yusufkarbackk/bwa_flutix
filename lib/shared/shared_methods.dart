part of 'shared.dart';

Future<File> getImage() async {
  var image = await ImagePicker.pickImage(source: ImageSource.gallery);
  return image;
}

Future<String> uploadImage(File image) async {
  String fileName = basename(image.path); //mengambil nama file gambar

  StorageReference ref = FirebaseStorage.instance.ref().child(
      fileName); //mengarahkan objek yang ada di firebase dengan nama fileName

  StorageUploadTask task =
      ref.putFile(image); // memberikan tugas kepada ref untuk upload file nya

  StorageTaskSnapshot snapshot =
      await task.onComplete; //mendapatkan hasil snapshot dari task

  return await snapshot.ref.getDownloadURL(); //download URL 
}
