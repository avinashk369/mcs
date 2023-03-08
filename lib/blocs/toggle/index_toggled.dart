import 'package:freezed_annotation/freezed_annotation.dart';
part 'index_toggled.freezed.dart';

@freezed
class IndexToggled with _$IndexToggled {
  const factory IndexToggled.toggle(
      {required int index, required bool isSelected}) = Toggled;
}
