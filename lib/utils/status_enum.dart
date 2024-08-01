enum StatusEnum {
  initial,
  loading,
  success,
  failure;

  const StatusEnum();

  bool get isInitial => this == StatusEnum.initial;
  bool get isLoading => this == StatusEnum.loading;
  bool get isSuccess => this == StatusEnum.success;
  bool get isFailure => this == StatusEnum.failure;
}
