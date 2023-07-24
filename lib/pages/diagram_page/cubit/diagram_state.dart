part of 'diagram_cubit.dart';

@freezed
class DiagramState with _$DiagramState {
  const factory DiagramState.initial() = _Initial;
  const factory DiagramState.loading() = _Loading;
  const factory DiagramState.loaded(
    List<TransactionModel> transactions, {
    required int? transfer,
    required int? refill,
    required int? withdrawal,
  }) = _Loaded;
  const factory DiagramState.error(String message) = _Error;
}
