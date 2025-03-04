import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart'; 

class DetailScreen extends ConsumerStatefulWidget {
  String imageUrl;
  DetailScreen({super.key, required this.imageUrl});

  @override
  ConsumerState<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
Future<void> setWallpaper() async {
    try {
      int location = WallpaperManager
          .HOME_SCREEN; // or location = WallpaperManager.LOCK_SCREEN;
      var file = await DefaultCacheManager().getSingleFile(widget.imageUrl);
      final bool result =
          await WallpaperManager.setWallpaperFromFile(file.path, location);
      print(result);
    } on PlatformException {}
  }
  Future<void> setWallpaperLock() async {
    try {
      int location = WallpaperManager
          .LOCK_SCREEN; // or location = WallpaperManager.LOCK_SCREEN;
      var file = await DefaultCacheManager().getSingleFile(widget.imageUrl);
      final bool result =
          await WallpaperManager.setWallpaperFromFile(file.path, location);
      print(result);
    } on PlatformException {}
  }
  Future<void> setWallpaperBoth() async {
    try {
      int location = WallpaperManager
          .BOTH_SCREEN; // or location = WallpaperManager.LOCK_SCREEN;
      var file = await DefaultCacheManager().getSingleFile(widget.imageUrl);
      final bool result =
          await WallpaperManager.setWallpaperFromFile(file.path, location);
      print(result);
    } on PlatformException {}
  }


  @override
  Widget build(BuildContext context) {

  var size = MediaQuery.sizeOf(context);
    var Size(:height, :width) = size;
    return Scaffold(
      appBar: AppBar(title: Text("Select WallPaper"),),
      body: Column(
        children: [
          Expanded(child: Container(
            height: height*0.80,
            width: width,
            child: Image.network(widget.imageUrl, fit: BoxFit.fill,),
          )),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               InkWell(
                    onTap: setWallpaperLock,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: height * 0.07,
                        width: width*0.30,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                            child: Text(
                          "Set for Lock Screen",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                   InkWell(
                    onTap: setWallpaper,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: height * 0.07,
                        width: width*0.30,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                            child: Text(
                          "Set for Home Screen",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                    InkWell(
                    onTap: setWallpaperBoth,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: height * 0.07,
                        width: width*0.30,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        
                        child: const Center(
                            child: Text(
                          "Set for Home Screen",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        )),
                      ),
                    ),
                  ),
            ],
           )
        ],
      ),
    );
  }
}