import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';

class Fullscreen extends StatefulWidget {
  const Fullscreen({super.key, required this.imageurl});
  final String imageurl;

  @override
  State<Fullscreen> createState() => _FullscreenState();
}

class _FullscreenState extends State<Fullscreen> {

  Future<void> setwallpaper() async {
    int location = WallpaperManagerFlutter.HOME_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(widget.imageurl);
    final String result =
        await WallpaperManager.setWallpaperFromFile(file.path, location);
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Expanded(
            child: Container(
              child: Image.network(widget.imageurl),
            ),
          ),
          InkWell(
            onTap: () {
              
            },
            child: Container(
              height: 60,
              width: double.infinity,
              color: Colors.black,
              child: Center(
                child: Text('Set Wallpaper',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
          )
        ],
      )),
    );
  }
}

class WallpaperManager {
  static setWallpaperFromFile(String path, int location) {}
}