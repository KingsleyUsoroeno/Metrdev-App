class Bots {
  final String name;
  final bool isActive;
  final String distributionChannel;

  Bots({required this.name, required this.isActive, this.distributionChannel = "Distribution Bot"});
}

final List<Bots> bots = [
  Bots(name: "EMA Cross 50  200 + ADX (Long)", isActive: true),
  Bots(name: "EMA Cross 50  200 + ADX (Long)", isActive: false),
  Bots(name: "EMA Cross 50  200 + ADX (Long)", isActive: true),
];
