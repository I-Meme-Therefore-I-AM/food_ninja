import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'hide_password_provider.g.dart';

@riverpod
class HidePasswordProvider extends _$HidePasswordProvider {
  @override
  bool build() {
    return true;
  }

  void toggle() {
    state = !state;
  }
}
