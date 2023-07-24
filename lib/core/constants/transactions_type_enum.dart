enum TransactionType {
  transfer('Транзакция'),
  refill('Перевод'),
  withdrawal('Пополнение');

  const TransactionType(this.value);
  final String value;
}
