import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallpaperapp/apiservice/apiservice.dart';
import 'package:wallpaperapp/apistates/apistates.dart';
import 'package:wallpaperapp/models/modelclass.dart';


var apiProvider= NotifierProvider<ApiProvider,Apistates>(ApiProvider.new);
class ApiProvider extends Notifier<Apistates>{
  int currentPage=1;
  List<Photos> allphotos=[];
  @override
  Apistates build() {
  return  state= ApiLoadingStates();
  }

  WallpaperApiService wallpaperApiService= WallpaperApiService();

  void loadData()async{
    state= ApiLoadingStates();
    try {
     var data= await wallpaperApiService.fetchData(page: currentPage);
     allphotos=data.photos;
     state=ApiLoadedState(wallpaper: data);

      
    } catch (e) {
      state=ApiErrorState(error: "error is ${e.toString()}");
      
    }

  }

  void loadMore()async{
    try {
      currentPage++;
    var data = await  wallpaperApiService.fetchData(page: currentPage);
    allphotos=data.photos;
    state=ApiLoadedState(wallpaper: Wallpaper(page: data.page, per_page: data.per_page, next_page: data.next_page, photos: allphotos));
      
    } catch (e) {
      state= ApiErrorState(error: e.toString());
      
    }

  }
  
}