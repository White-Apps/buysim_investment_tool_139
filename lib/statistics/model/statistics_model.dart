class StatisticsModel {
  final String image;
  final String nameCompany;
  final String dec;

  StatisticsModel({
    required this.image,
    required this.nameCompany,
    required this.dec,
  });
}

List<StatisticsModel> statisticsList = [
  StatisticsModel(
    image: 'assets/company_logo/1.png',
    nameCompany: 'MSFT',
    dec: 'Microsoft Corporation',
  ),
  StatisticsModel(
    image: 'assets/company_logo/2.png',
    nameCompany: 'AMZN',
    dec: 'Amazon.com Incorporated',
  ),
  StatisticsModel(
    image: 'assets/company_logo/3.png',
    nameCompany: 'GOOGL',
    dec: 'Alphabet Incorporated',
  ),
  StatisticsModel(
    image: 'assets/company_logo/4.png',
    nameCompany: 'FB',
    dec: 'Facebook Incorporated',
  ),
  StatisticsModel(
    image: 'assets/company_logo/5.png',
    nameCompany: 'TSLA',
    dec: 'Tesla Corporation',
  ),
  StatisticsModel(
    image: 'assets/company_logo/6.png',
    nameCompany: 'JNJ',
    dec: 'Johnson & Johnson',
  ),
  StatisticsModel(
    image: 'assets/company_logo/7.png',
    nameCompany: 'KO',
    dec: 'The Coca-Cola Company',
  ),
  StatisticsModel(
    image: 'assets/company_logo/8.png',
    nameCompany: 'PG',
    dec: 'Procter & Gamble Company',
  ),
  StatisticsModel(
    image: 'assets/company_logo/9.png',
    nameCompany: 'WMT',
    dec: 'Walmart Incorporated',
  ),
  StatisticsModel(
    image: 'assets/company_logo/10.png',
    nameCompany: 'V',
    dec: 'Visa Incorporated',
  ),
  StatisticsModel(
    image: 'assets/company_logo/11.png',
    nameCompany: 'JPM',
    dec: 'JPMorgan Chase & Co.',
  ),
];
