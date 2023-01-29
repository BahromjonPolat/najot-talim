import 'package:flutter/services.dart';

class PicToBytes {
  static picToBytes() async {
    List<dynamic> picByte;
    var imageData =
        await rootBundle.load('packages/uz.mirrikh.nt/assets/images/humo.jpg');
    // var imageData2 = await rootBundle
    //     .load('packages/uz.mirrikh.nt/assets/images/uzcard.png');

    picByte = imageData.buffer.asUint8List();
    print(picByte);
    return picByte;
  }
}
