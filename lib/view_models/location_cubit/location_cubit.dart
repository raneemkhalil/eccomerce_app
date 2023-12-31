import 'package:ecommerce/models/location_model.dart';
import 'package:ecommerce/models/product_item_model.dart';
import 'package:ecommerce/view_models/payment_cubit/payment_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());
  
  void getLocationsList(){
    emit(LocationLoading());
    Future.delayed(const Duration(seconds:2), (){
      List<LocationModel> locations = listOfLocations;
      emit(LocationLoaded(locations: locations));
    });
  }

  void selectLocation(int index){
    LocationModel location = listOfLocations[index];
    bool selected = true;
    emit(LocationSelected(location: location, selected: selected));
  }

  LocationModel unselectLocation(int index){
    LocationModel location = listOfLocations[index];
    bool selected = false;
    emit(LocationSelected(location: location, selected: selected));
    return location;
  }
}
