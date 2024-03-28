class NwModel {
  final String image;
  final String name;
  final String company;
  final String subTitle;
  final String questions;
  final String answer;
  final List<String> listAnsw;

  NwModel({
    required this.image,
    required this.name,
    required this.company,
    required this.subTitle,
    required this.questions,
    required this.answer,
    required this.listAnsw,
  });
}

List<NwModel> listNews = [
  NwModel(
    image: '',
    name: 'MSFT',
    company: 'Microsoft Corporation',
    subTitle:
        '''Microsoft Introduces New Version of Windows with Enhanced Security
Microsoft Acquires Leading Artificial Intelligence Company
Microsoft Develops Cloud Service for Hospital Management''',
    questions:
        'The company that owns the platforms Facebook, Instagram, and WhatsApp is...',
    answer: 'Facebook Inc. (FB)',
    listAnsw: [
      'Facebook Inc. (FB)',
      'Tesla Inc. (TSLA)',
      'Johnson & Johnson (JNJ)',
      'The Coca-Cola Company (KO)',
    ],
  ),
  NwModel(
    image: '',
    name: 'AMZN',
    company: 'Amazon.com Inc.',
    subTitle: '''Amazon Expands Drone Delivery Network to New Regions
Amazon Prime Day Sets New Single-Day Sales Record
Amazon Launches Training Program for Its Employees''',
    questions:
        'Which of the companies is a well-known producer of electric cars?',
    answer: 'Tesla Inc. (TSLA)',
    listAnsw: [
      'Tesla Inc. (TSLA)',
      'Walmart Inc. (WMT)',
      'Procter & Gamble Company (PG)',
      'Visa Inc. (V)',
    ],
  ),
  NwModel(
    image: '',
    name: 'GOOGL',
    company: 'Alphabet Inc.',
    subTitle:
        '''Alphabet Unveils New Project for Smart City Technology Development
Google, Alphabet's Subsidiary, Releases New Smartphone with AI Features
Alphabet Invests in Quantum Computing Research''',
    questions:
        'The company specializing in producing medical products and medications such as Tylenol is...',
    answer: 'Johnson & Johnson (JNJ)',
    listAnsw: [
      'Johnson & Johnson (JNJ)',
      'The Coca-Cola Company (KO)',
      'Procter & Gamble Company (PG)',
      'Visa Inc. (V)',
    ],
  ),
  NwModel(
    image: '',
    name: 'FB',
    company: 'Facebook Inc.',
    subTitle:
        '''Facebook Rolls Out New Video Call Feature with Enhanced Encryption
Facebook Announces Developer Event with New API Capabilities
Instagram, Owned by Facebook, Introduces New Tools for Businesses''',
    questions: 'The company producing beverages like Coca-Cola belongs to...',
    answer: 'The Coca-Cola Company (KO)',
    listAnsw: [
      'The Coca-Cola Company (KO)',
      'Walmart Inc. (WMT)',
      'Visa Inc. (V)',
      'JPMorgan Chase & Co. (JPM)',
    ],
  ),
  NwModel(
    image: '',
    name: 'TSLA',
    company: 'Tesla Inc.',
    subTitle: '''Tesla Announces New Electric Car Model with Extended Range
Tesla Begins Production of Electric Trucks for Cargo Delivery
Elon Musk, Tesla's CEO, Reveals Company's Plans for Autonomous Taxis''',
    questions:
        'The company known for its household care and personal hygiene products is...',
    answer: 'Procter & Gamble Company (PG)',
    listAnsw: [
      'Procter & Gamble Company (PG)',
      'Walmart Inc. (WMT)',
      'Visa Inc. (V)',
      'JPMorgan Chase & Co. (JPM)',
    ],
  ),
  NwModel(
    image: '',
    name: 'JNJ',
    company: 'Johnson & Johnson',
    subTitle:
        '''Johnson & Johnson Releases New Medication for Chronic Conditions
J&J Launches Campaign to Combat Pandemic Through Vaccination in Developing Countries
Johnson & Johnson's New Research Center Focuses on Oncology Studies''',
    questions: 'Which company is the worlds largest retailer?',
    answer: 'Walmart Inc. (WMT)',
    listAnsw: [
      'Visa Inc. (V)',
      'Walmart Inc. (WMT)',
      'JPMorgan Chase & Co. (JPM)',
      'Alphabet Inc. (GOOGL)',
    ],
  ),
  NwModel(
    image: '',
    name: 'KO',
    company: 'The Coca-Cola Company',
    subTitle: '''Coca-Cola Introduces New Soda Flavor as Part of Summer Campaign
Coca-Cola Transitions to Plastic-Free Packaging in Environmental Sustainability Effort
Coca-Cola Company Signs Collaboration Agreement with Local Farmers to Improve Ingredient Quality''',
    questions:
        'The company providing financial services and issuing credit cards is...',
    answer: 'Visa Inc. (V)',
    listAnsw: [
      'JPMorgan Chase & Co. (JPM)',
      'Tesla Inc. (TSLA)',
      'Visa Inc. (V)',
      'Facebook Inc. (FB)',
    ],
  ),
  NwModel(
    image: '',
    name: 'PG',
    company: 'Procter & Gamble Company',
    subTitle:
        '''P&G Releases Eco-Friendly Home Products as Part of Sustainability Initiative
Procter & Gamble Introduces New Skin Care Products with Innovative Formulas
P&G Launches Campaign to Fight Poverty by Providing Free Hygiene Products to Those in Need''',
    questions:
        'Which bank is considered the largest American bank with a wide range of financial services?',
    answer: 'JPMorgan Chase & Co. (JPM)',
    listAnsw: [
      'Johnson & Johnson (JNJ)',
      'Alphabet Inc. (GOOGL)',
      'Microsoft Corporation (MSFT)',
      'JPMorgan Chase & Co. (JPM)',
    ],
  ),
];
