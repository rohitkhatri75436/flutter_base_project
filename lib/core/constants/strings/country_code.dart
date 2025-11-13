class CountryCode {
  Map<String, String> dialingToCountryCode = {
    '61': 'AU', // Australia
    '1': 'US', // United States
    '44': 'GB', // United Kingdom
    '91': 'IN', // India
    '64': 'NZ', // New Zealand
    '86': 'CN', // China
    '49': 'DE', // Germany
    '33': 'FR', // France
    '81': 'JP', // Japan
    '82': 'KR', // South Korea
    '7': 'RU', // Russia
    '55': 'BR', // Brazil
    '34': 'ES', // Spain
    '39': 'IT', // Italy
    '52': 'MX', // Mexico
    '20': 'EG', // Egypt
    '27': 'ZA', // South Africa
    '62': 'ID', // Indonesia
    '30': 'GR', // Greece
    '47': 'NO', // Norway
    '48': 'PL', // Poland
    '41': 'CH', // Switzerland
    '63': 'PH', // Philippines
    '45': 'DK', // Denmark
    '353': 'IE', // Ireland
    '964': 'IQ', // Iraq
    '251': 'ET', // Ethiopia
    '254': 'KE', // Kenya
    '92': 'PK', // Pakistan
    '971': 'AE', // United Arab Emirates
    '970': 'PS', // Palestine
    '233': 'GH', // Ghana
    '256': 'UG', // Uganda
    '973': 'BH', // Bahrain
    '963': 'SY', // Syria
    '595': 'PY', // Paraguay
    '58': 'VE', // Venezuela
    '995': 'GE', // Georgia
    '266': 'LS', // Lesotho
    '376': 'AD', // Andorra
    '351': 'PT', // Portugal
    '382': 'ME', // Montenegro
    '354': 'IS', // Iceland
    '212': 'MA', // Morocco
    '225': 'CI', // Ivory Coast (Côte d'Ivoire)
    '226': 'BF', // Burkina Faso
    '232': 'SL', // Sierra Leone
    '221': 'SN', // Senegal
    '235': 'NE', // Niger
    '241': 'GA', // Gabon
    '249': 'SD', // Sudan
    '253': 'DJ', // Djibouti
    '218': 'LY', // Libya
    '996': 'KG', // Kyrgyzstan
    '350': 'GI', // Gibraltar
    '593': 'EC', // Ecuador
    '974': 'QA', // Qatar
    '267': 'BW', // Botswana
    '968': 'OM', // Oman
    '380': 'UA', // Ukraine
    '54': 'AR', // Argentina
    '51': 'PE', // Peru
    '98': 'IR', // Iran
    '355': 'AL', // Albania
    '43': 'AT', // Austria
    '359': 'BG', // Bulgaria
    '421': 'SK', // Slovakia
    '420': 'CZ', // Czech Republic
    '370': 'LT', // Lithuania
    '352': 'LU', // Luxembourg
    '853': 'MO', // Macau
    '379': 'SM', // San Marino
    '876': 'JM', // Jamaica
    '1809': 'DO', // Dominican Republic
    '90': 'TR', // Turkey
    '965': 'KW', // Kuwait
    '389': 'MK', // North Macedonia
    '992': 'TJ', // Tajikistan
    '260': 'ZM', // Zambia
    '60': 'MY', // Malaysia
    '213': 'DZ', // Algeria
    '244': 'AO', // Angola
    '672': 'AQ', // Antarctica
    '374': 'AM', // Armenia
    '297': 'AW', // Aruba
    '994': 'AZ', // Azerbaijan
    '880': 'BD', // Bangladesh
    '246': 'BB', // Barbados
    '375': 'BY', // Belarus
    '32': 'BE', // Belgium
    '501': 'BZ', // Belize
    '229': 'BJ', // Benin
    '975': 'BT', // Bhutan
    '591': 'BO', // Bolivia
    '387': 'BA', // Bosnia and Herzegovina
    '673': 'BN', // Brunei
    '257': 'BI', // Burundi
    '855': 'KH', // Cambodia
    '237': 'CM', // Cameroon
    '238': 'CV', // Cape Verde
    '236': 'CF', // Central African Republic
    '56': 'CL', // Chile
    '57': 'CO', // Colombia
    '269': 'KM', // Comoros
    '242': 'CG', // Congo
    '682': 'CK', // Cook Islands
    '506': 'CR', // Costa Rica
    '385': 'HR', // Croatia
    '53': 'CU', // Cuba
    '357': 'CY', // Cyprus
    '243': 'CD', // Democratic Republic of the Congo
    '1767': 'DM', // Dominica
    '503': 'SV', // El Salvador
    '240': 'GQ', // Equatorial Guinea
    '291': 'ER', // Eritrea
    '372': 'EE', // Estonia
    '679': 'FJ', // Fiji
    '358': 'FI', // Finland
    '594': 'GF', // French Guiana
    '689': 'PF', // French Polynesia
    '220': 'GM',
    '299': 'GL', // Greenland
    '1473': 'GD', // Grenada
    '590': 'GP', // Guadeloupe
    '502': 'GT', // Guatemala
    '224': 'GN', // Guinea
    '245': 'GW', // Guinea-Bissau
    '592': 'GY', // Guyana
    '509': 'HT', // Haiti
    '504': 'HN', // Honduras
    '852': 'HK', // Hong Kong
    '36': 'HU',
    '972': 'IL', // Israel
    '1876': 'JM', // Jamaica
    '962': 'JO', // Jordan
    '686': 'KI', // Kiribati
    '371': 'LV', // Latvia
    '961': 'LB', // Lebanon
    '231': 'LR', // Liberia
    '423': 'LI',
    '261': 'MG', // Madagascar
    '265': 'MW', // Malawi
    '960': 'MV', // Maldives
    '223': 'ML', // Mali
    '356': 'MT', // Malta
    '692': 'MH', // Marshall Islands
    '222': 'MR', // Mauritania
    '230': 'MU', // Mauritius
    '691': 'FM', // Micronesia
    '373': 'MD', // Moldova
    '377': 'MC', // Monaco
    '976': 'MN', // Mongolia
    '1664': 'MS', // Montserrat
    '258': 'MZ', // Mozambique
    '95': 'MM', // Myanmar (Burma)
    '264': 'NA', // Namibia
    '674': 'NR', // Nauru
    '977': 'NP', // Nepal
    '31': 'NL', // Netherlands
    '687': 'NC', // New Caledonia
    '505': 'NI', // Nicaragua
    '227': 'NE', // Niger
    '234': 'NG', // Nigeria
    '683': 'NU', // Niue
    '850': 'KP',
    '680': 'PW', // Palau
    '507': 'PA', // Panama
    '675': 'PG',
    '1787': 'PR', // Puerto Rico
    '40': 'RO', // Romania
    '250': 'RW', // Rwanda
    '1869': 'KN', // Saint Kitts and Nevis
    '1758': 'LC', // Saint Lucia
    '1784': 'VC', // Saint Vincent and the Grenadines
    '685': 'WS', // Samoa
    '378': 'SM', // San Marino
    '239': 'ST', // São Tomé and Príncipe
    '966': 'SA', // Saudi Arabia
    '381': 'RS', // Serbia
    '248': 'SC', // Seychelles
    '65': 'SG', // Singapore
    '386': 'SI', // Slovenia
    '677': 'SB', // Solomon Islands
    '252': 'SO', // Somalia
    '211': 'SS', // South Sudan
    '94': 'LK', // Sri Lanka
    '597': 'SR', // Suriname
    '268': 'SZ', // Eswatini (Swaziland)
    '46': 'SE', // Sweden
    '886': 'TW', // Taiwan
    '255': 'TZ', // Tanzania
    '66': 'TH', // Thailand
    '228': 'TG', // Togo
    '676': 'TO', // Tonga
    '1868': 'TT', // Trinidad and Tobago
    '216': 'TN', // Tunisia
    '993': 'TM', // Turkmenistan
    '1649': 'TC', // Turks and Caicos Islands
    '688': 'TV', // Tuvalu
    '598': 'UY', // Uruguay
    '998': 'UZ', // Uzbekistan
    '678': 'VU', // Vanuatu
    '84': 'VN', // Vietnam
    '1284': 'VG', // British Virgin Islands
    '1340': 'VI', // U.S. Virgin Islands
    '681': 'WF', // Wallis and Futuna
    '967': 'YE', // Yemen
    '263': 'ZW', // Zimbabwe
  };
}
