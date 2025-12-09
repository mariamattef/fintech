import 'package:fintech/features/home/domain/enteties/topgainer_entity.dart';

abstract class TopgainersState{
  
}

class TopgainersInitial extends TopgainersState {}

class TopgainersLoading extends TopgainersState {}

class TopgainersSuccess extends TopgainersState {
  final List<TopgainerEntity> topGainersEntity;

  TopgainersSuccess(this.topGainersEntity);
}

class TopgainersFailure extends TopgainersState {
  final String message;

  TopgainersFailure(this.message);

}