
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../REPOSITRY/API/imdb_api.dart';
import '../REPOSITRY/MODELCLASS/Imdbmodel.dart';

part 'imdb_event.dart';
part 'imdb_state.dart';

class ImdbBloc extends Bloc<ImdbEvent, ImdbState> {
  late Imdbmodel imdbmodel;
  Imdbapi ottApi=Imdbapi();
  ImdbBloc() : super(ImdbInitial()) {

    on<ImdbEvent>((event, emit)async {
      emit(ImdbLoading());
      try{

        imdbmodel = await ottApi.getimdbmodel();
        emit(ImdbLoaded());
      } catch(e){
        print(e);
        emit(ImdbLoaded());}
    });

  }
}
