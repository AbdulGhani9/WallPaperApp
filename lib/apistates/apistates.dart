import 'package:wallpaperapp/models/modelclass.dart';

sealed class Apistates {}

class ApiInitialState extends Apistates{}

class ApiLoadingStates extends Apistates{}

class ApiLoadedState extends Apistates{
  final Wallpaper wallpaper;
  ApiLoadedState({required this.wallpaper});
}

class ApiErrorState extends Apistates{
  String error;
  ApiErrorState({required this.error});
}
