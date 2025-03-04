import 'dart:convert';

import 'package:http/http.dart';
import 'package:wallpaperapp/models/modelclass.dart';

abstract class Apiservice {
  var BASE_URL="https://api.pexels.com/v1/curated";
  var API_KEY="m1rjQBxPZ8XE9LCoQsNsZRIhjKxhC2t8ZXvgFmV2Cyl5E9GBLECX3qPl";

  fetch({int ?page}) async{
   var response = await get(Uri.parse("$BASE_URL?per_page=80&page=$page"), headers:{'Authorization':'$API_KEY'} );
   if (response.statusCode==200) {
     var data = jsonDecode(response.body);
     print(data);
     return data;
   }else{
    print("error");
   }

  }
}

class WallpaperApiService extends Apiservice{

 

    Future<Wallpaper> fetchData({int? page}) async {
    var data = await fetch(page: page);
    return Wallpaper.fromMap(data); 
  }
  }




