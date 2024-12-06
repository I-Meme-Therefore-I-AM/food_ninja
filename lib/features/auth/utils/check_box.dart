import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'check_box.g.dart';

@riverpod
class CheckBox extends _$CheckBox {
  @override
  bool build() {
    return false;
  }

  void toggleBox() {
    state = !state;
  }
}
