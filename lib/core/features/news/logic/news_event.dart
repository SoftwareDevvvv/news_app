import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable{

  const NewsEvent();
  @override // TODO: implement props
  List<Object?> get props => [];
}

class StartEvent extends NewsEvent{

}
class FetchNewsEvent extends NewsEvent {
  final String category;

  const FetchNewsEvent(this.category);

  @override
  List<Object?> get props => [category];
}