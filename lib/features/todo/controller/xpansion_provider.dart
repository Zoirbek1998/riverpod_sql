import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'xpansion_provider.g.dart';

@riverpod
class XpansionState extends _$XpansionState{
  @override
  bool build(){
    return false;
  }

  void setState(bool newState){
    state = newState;
  }
}