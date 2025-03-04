import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallpaperapp/apicontroller/notifierprovider.dart';
import 'package:wallpaperapp/apiservice/apiservice.dart';
import 'package:wallpaperapp/apistates/apistates.dart';
import 'package:wallpaperapp/screens/DetailScreen.dart';

class WallpaperUI extends ConsumerStatefulWidget {
  const WallpaperUI({super.key});

  @override
  ConsumerState<WallpaperUI> createState() => _WallpaperUIState();
}

class _WallpaperUIState extends ConsumerState<WallpaperUI> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      ref.read(apiProvider.notifier).loadData();
    });
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    var state = ref.watch(apiProvider);
    var size = MediaQuery.sizeOf(context);
    var Size(:height, :width) = size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: const Icon(
            Icons.wallpaper,
            color: Colors.white,
          ),
          title: Text(
            "Select your wallpaper you want ",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Builder(
          builder: (context) {
            if (state is ApiLoadingStates) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ApiLoadedState) {
              return Column(
                children: [
                  Expanded(
                      child: Container(
                    child: GridView.builder(
                      itemCount: state.wallpaper.photos.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 2,
                              childAspectRatio: 2 / 3,
                              mainAxisSpacing: 2),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(context, PageRouteBuilder(
                              
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: ScaleTransition(
                                    scale: animation,
                                    child: DetailScreen(
                                        imageUrl: state
                                            .wallpaper.photos[index].src.large2x),
                                  ),
                                );
                              },
                              transitionDuration: const Duration(milliseconds: 500),
                              reverseTransitionDuration: const  Duration(milliseconds: 500)
                            ));
                          },
                          child: Container(
                              color: Colors.white,
                              child: Image.network(
                                state.wallpaper.photos[index].src.tiny,
                                fit: BoxFit.fill,
                              )),
                        );
                      },
                    ),
                  )),
                  InkWell(
                    onTap: () {
                      ref.read(apiProvider.notifier).loadMore();
                    },
                    child: Container(
                      height: height * 0.09,
                      width: width,
                      color: Colors.black,
                      child: const Center(
                          child: Text(
                        "Load More",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                    ),
                  )
                ],
              );
            } else if (state is ApiErrorState) {
              return Text("Try again ${state.error}");
            } else {
              return Text("");
            }
          },
        ));
  }
}
