class BonusCard {
  BonusCard({required this.numberOfBonusCard, required this.balance});
  final int numberOfBonusCard;
  final int balance;

  factory BonusCard.fromJson(Map<String, dynamic> json){
    return BonusCard(
        numberOfBonusCard: json['numberOfBonusCard'],
        balance: json['balance']
    );
  }

  Map<String, Object?> toJson() => {
    'numberOfBonusCard': numberOfBonusCard,
    'balance': balance
  };
}