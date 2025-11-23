class Destination {
  final String id;
  final String city;
  final String country;
  final String continent;
  final String imagePath;
  final String flagPath;
  final double rating;
  final int reviewCount;
  final String shortDescription;
  final String longDescription;
  final String heroTag;

  const Destination({
    required this.id,
    required this.city,
    required this.country,
    required this.continent,
    required this.imagePath,
    required this.flagPath,
    required this.rating,
    required this.reviewCount,
    required this.shortDescription,
    required this.longDescription,
    required this.heroTag,
  });
}

const List<Destination> destinations = [
  Destination(
    id: 'rio',
    city: 'Rio de Janeiro',
    country: 'Brazil',
    continent: 'South America',
    imagePath: 'images/villes/brazil.jpg',
    flagPath: 'images/Pays/brazilFlag.png',
    rating: 5.0,
    reviewCount: 143,
    heroTag: 'hero_rio',
    shortDescription:
        "Rio de Janeiro est célèbre pour ses plages iconiques, son énergie festive, "
        "le mont du Pain de Sucre et le Christ Rédempteur. Une ville où la nature et la culture brésilienne se rencontrent.",
    longDescription:
        "Entre les plages mythiques de Copacabana et d’Ipanema, les vues panoramiques du Pain de Sucre et la statue du Christ Rédempteur, "
        "Rio de Janeiro offre un mélange unique de paysages spectaculaires et d’ambiance urbaine. "
        "La ville vibre au rythme de la samba, de son carnaval mondialement connu et de sa vie nocturne animée. "
        "C’est une destination idéale pour ceux qui recherchent à la fois détente, culture locale et expériences inoubliables.",
  ),

  Destination(
    id: 'bali',
    city: 'Bali',
    country: 'Indonesia',
    continent: 'Asia',
    imagePath: 'images/villes/bali1.jpg',
    flagPath: 'images/Pays/indonesiaFlag.png',
    rating: 4.8,
    reviewCount: 210,
    heroTag: 'hero_bali',
    shortDescription:
        "Bali est une île tropicale apaisante connue pour ses plages dorées, ses temples authentiques et ses paysages verdoyants.",
    longDescription:
        "Bali est un paradis tropical où rizières en terrasses, falaises surplombant l’océan et temples traditionnels se côtoient. "
        "Des villages d’Ubud à la vie nocturne de Seminyak, l’île mélange spiritualité, bien-être et exploration. "
        "C’est une destination parfaite pour pratiquer le yoga, profiter de spas, découvrir la cuisine locale et admirer des couchers de soleil spectaculaires.",
  ),

  Destination(
    id: 'paris',
    city: 'Paris',
    country: 'France',
    continent: 'Europe',
    imagePath: 'images/villes/france.jpg',
    flagPath: 'images/Pays/franceFlag.png',
    rating: 4.9,
    reviewCount: 320,
    heroTag: 'hero_paris',
    shortDescription:
        "Paris, la ville lumière, séduit par son architecture élégante, ses musées emblématiques et son ambiance romantique.",
    longDescription:
        "Entre la tour Eiffel, le Louvre, Notre-Dame et les quais de Seine, Paris offre une richesse culturelle incomparable. "
        "La ville est connue pour ses cafés animés, ses pâtisseries, ses boutiques de mode et ses quartiers emblématiques comme Montmartre ou le Marais. "
        "C’est une destination idéale pour les amoureux d’art, d’histoire, de gastronomie et de balades en ville.",
  ),

  Destination(
    id: 'assinie',
    city: 'Assinie',
    country: "Côte d’Ivoire",
    continent: 'Africa',
    imagePath: 'images/villes/assinie1.jpg',
    flagPath: 'images/Pays/civFlag.png',
    rating: 4.7,
    reviewCount: 98,
    heroTag: 'hero_assinie',
    shortDescription:
        "Assinie est une station balnéaire paisible offrant plages de sable fin, lagunes calmes et hôtels en bord de mer.",
    longDescription:
        "Située sur la côte ivoirienne, Assinie est appréciée pour ses plages tranquilles, ses lagunes et ses hébergements en bord de l’eau. "
        "On y trouve un mélange d’authenticité locale et de confort moderne, parfait pour se détendre le week-end ou passer des vacances au calme. "
        "Entre balades en bateau, fruits de mer frais et soirées en terrasse, Assinie est une destination chaleureuse à découvrir.",
  ),

  Destination(
    id: 'new_york',
    city: 'New York',
    country: 'United States',
    continent: 'North America',
    imagePath: 'images/villes/NY2.jpg',
    flagPath: 'images/Pays/usaFlag.png',
    rating: 4.8,
    reviewCount: 450,
    heroTag: 'hero_newyork',
    shortDescription:
        "New York est une métropole dynamique connue pour ses gratte-ciel, ses quartiers vibrants et son énergie inépuisable.",
    longDescription:
        "De Times Square à Central Park, en passant par Brooklyn et la Statue de la Liberté, New York mélange cultures, cuisines et expériences variées. "
        "La ville ne dort jamais et propose spectacles, musées, shopping et gastronomie à toute heure. "
        "Que ce soit pour un séjour culturel, professionnel ou simplement pour ressentir l’énergie unique de la ville, New York marque les esprits.",
  ),

  Destination(
    id: 'tokyo',
    city: 'Tokyo',
    country: 'Japan',
    continent: 'Asia',
    imagePath: 'images/villes/tokyo2.jpg',
    flagPath: 'images/Pays/japanFlag.png',
    rating: 4.9,
    reviewCount: 380,
    heroTag: 'hero_tokyo',
    shortDescription:
        "Tokyo est une ville où technologies futuristes, traditions japonaises et culture pop se rencontrent.",
    longDescription:
        "Tokyo offre un contraste fascinant entre gratte-ciel lumineux, temples anciens, jardins zen et quartiers animés comme Shibuya ou Akihabara. "
        "On y découvre une culture riche, une cuisine variée (ramen, sushi, street food) et un sens du détail unique. "
        "C’est une destination idéale pour les passionnés de technologie, de culture japonaise et d’expériences insolites.",
  ),

  Destination(
    id: 'cape_town',
    city: 'Cape Town',
    country: 'South Africa',
    continent: 'Africa',
    imagePath: 'images/villes/capetown2.jpg',
    flagPath: 'images/Pays/southafricaFlag.png',
    rating: 4.7,
    reviewCount: 175,
    heroTag: 'hero_capetown',
    shortDescription:
        "Cape Town est une ville côtière entourée de montagnes, de plages et de paysages naturels impressionnants.",
    longDescription:
        "Dominée par la Table Mountain, Cape Town est une ville colorée située entre mer et montagne. "
        "Elle est connue pour ses plages, ses vignobles, son waterfront animé et sa diversité culturelle. "
        "C’est une destination idéale pour les amateurs de nature, de randonnées, de bonne cuisine et de vues panoramiques.",
  ),

  Destination(
    id: 'marrakech',
    city: 'Marrakech',
    country: 'Morocco',
    continent: 'Africa',
    imagePath: 'images/villes/marrakech2.jpg',
    flagPath: 'images/Pays/moroccoFlag.png',
    rating: 4.6,
    reviewCount: 160,
    heroTag: 'hero_marrakech',
    shortDescription:
        "Marrakech charme par ses souks colorés, ses palais historiques et son ambiance chaleureuse.",
    longDescription:
        "Entre la place Jemaa el-Fna, les souks, les riads et les palais, Marrakech est une immersion dans l’art de vivre marocain. "
        "On y découvre une architecture traditionnelle, une cuisine riche en saveurs et une atmosphère animée du matin au soir. "
        "C’est une destination idéale pour ceux qui aiment les marchés, les découvertes culturelles et les expériences authentiques.",
  ),

  Destination(
    id: 'santorini',
    city: 'Santorini',
    country: 'Greece',
    continent: 'Europe',
    imagePath: 'images/villes/santorini2.jpg',
    flagPath: 'images/Pays/greeceFlag.png',
    rating: 4.9,
    reviewCount: 210,
    heroTag: 'hero_santorini',
    shortDescription:
        "Santorin est une île grecque célèbre pour ses maisons blanches, ses toits bleus et ses couchers de soleil sur la mer Égée.",
    longDescription:
        "Perchée au bord de falaises volcaniques, Santorin offre des vues spectaculaires sur la mer. "
        "Ses villages comme Oia et Fira sont connus pour leurs ruelles étroites, leurs églises aux dômes bleus et leurs cafés en terrasse. "
        "C’est une destination romantique par excellence, idéale pour les couples, les photos et les séjours au calme.",
  ),

  Destination(
    id: 'sydney',
    city: 'Sydney',
    country: 'Australia',
    continent: 'Oceania',
    imagePath: 'images/villes/sydney2.jpg',
    flagPath: 'images/Pays/australiaFlag.png',
    rating: 4.8,
    reviewCount: 190,
    heroTag: 'hero_sydney',
    shortDescription:
        "Sydney est une ville côtière moderne, célèbre pour son Opéra, son port et ses plages comme Bondi.",
    longDescription:
        "Sydney combine une architecture moderne, un grand port naturel et des plages mythiques. "
        "L’Opéra de Sydney, le Harbour Bridge, les quartiers comme The Rocks ou Darling Harbour en font une ville agréable à découvrir. "
        "C’est une destination idéale pour profiter du plein air, de la mer, de la culture et d’un style de vie détendu.",
  ),

  Destination(
    id: 'casablanca',
    city: 'Casablanca',
    country: 'Morocco',
    continent: 'Africa',
    imagePath: 'images/villes/casablanca1.jpg',
    flagPath: 'images/Pays/moroccoFlag.png',
    rating: 4.5,
    reviewCount: 150,
    heroTag: 'hero_casablanca',
    shortDescription:
        "Casablanca, la perle moderne du Maroc, mêle architecture contemporaine et ambiance côtière.",
    longDescription:
        "Casablanca est une ville dynamique au bord de l’Atlantique, connue pour sa mosquée Hassan II, ses avenues modernes et son mélange d’histoire et de modernité. "
        "On y découvre des restaurants raffinés, des plages urbaines et une vie nocturne animée, idéale pour les voyageurs en quête de culture et de détente.",
  ),

  Destination(
    id: 'lagos',
    city: 'Lagos',
    country: 'Nigeria',
    continent: 'Africa',
    imagePath: 'images/villes/lagos2.jpg',
    flagPath: 'images/Pays/nigeriaFlag.png',
    rating: 4.6,
    reviewCount: 210,
    heroTag: 'hero_lagos',
    shortDescription:
        "Lagos est une ville vibrante mêlant plages dorées, musique afrobeat et innovation.",
    longDescription:
        "Lagos fascine par son énergie, ses plages comme Tarkwa Bay, ses marchés colorés et son incroyable scène musicale. "
        "La ville est un centre culturel et économique unique en Afrique, parfait pour découvrir l’afrobeat, la gastronomie locale et une créativité débordante.",
  ),

  Destination(
    id: 'dakar',
    city: 'Dakar',
    country: 'Senegal',
    continent: 'Africa',
    imagePath: 'images/villes/dakar1.jpg',
    flagPath: 'images/Pays/senegalFlag.png',
    rating: 4.7,
    reviewCount: 180,
    heroTag: 'hero_dakar',
    shortDescription:
        "Dakar, ville côtière chaleureuse, est connue pour son ambiance, ses plages et sa culture artistique.",
    longDescription:
        "Dakar est une destination ensoleillée mêlant marchés, musique traditionnelle, plages et monuments comme le Monument de la Renaissance Africaine. "
        "Entre les îles proches, la gastronomie sénégalaise et les soirées animées, Dakar offre un séjour authentique et vibrant.",
  ),

  Destination(
    id: 'nairobi',
    city: 'Nairobi',
    country: 'Kenya',
    continent: 'Africa',
    imagePath: 'images/villes/nairobi1.jpg',
    flagPath: 'images/Pays/kenyaFlag.png',
    rating: 4.8,
    reviewCount: 240,
    heroTag: 'hero_nairobi',
    shortDescription:
        "Nairobi est la capitale des safaris, alliant ville moderne et nature sauvage.",
    longDescription:
        "À Nairobi, on peut découvrir la faune africaine à proximité du centre-ville, visiter le parc national, explorer Karen Blixen ou encore apprendre l’histoire des tribus Maasai. "
        "C’est une ville authentique, culturelle et idéale pour débuter l’aventure safari.",
  ),

  Destination(
    id: 'abidjan',
    city: 'Abidjan',
    country: 'Côte d’Ivoire',
    continent: 'Africa',
    imagePath: 'images/villes/abidjan1.jpg',
    flagPath: 'images/Pays/civFlag.png',
    rating: 4.7,
    reviewCount: 190,
    heroTag: 'hero_abidjan',
    shortDescription:
        "Abidjan, surnommée la ‘perle des lagunes’, séduit par son dynamisme et sa gastronomie.",
    longDescription:
        "Ville moderne et culturelle, Abidjan offre des quartiers vivants comme Cocody et Plateau, des restaurants variés, une ambiance nocturne animée et des plages proches. "
        "C’est une destination chaleureuse et cosmopolite où l’on découvre la vraie hospitalité ivoirienne.",
  ),

  Destination(
    id: 'tunis',
    city: 'Tunis',
    country: 'Tunisia',
    continent: 'Africa',
    imagePath: 'images/villes/tunis2.jpg',
    flagPath: 'images/Pays/tunisiaFlag.png',
    rating: 4.6,
    reviewCount: 160,
    heroTag: 'hero_tunis',
    shortDescription:
        "Tunis charme avec ses médinas, ses plages et son histoire millénaire.",
    longDescription:
        "Entre ruelles anciennes, mosquées historiques, musées et plages méditerranéennes, Tunis est une ville riche en patrimoine. "
        "L’ancienne Carthage et Sidi Bou Saïd sont des incontournables pour tout visiteur.",
  ),

  Destination(
    id: 'accra',
    city: 'Accra',
    country: 'Ghana',
    continent: 'Africa',
    imagePath: 'images/villes/accra1.jpg',
    flagPath: 'images/Pays/ghanaFlag.png',
    rating: 4.5,
    reviewCount: 170,
    heroTag: 'hero_accra',
    shortDescription:
        "Accra offre un mélange authentique de culture africaine, modernité et plages tropicales.",
    longDescription:
        "Accra est une capitale accueillante où se mêlent marchés colorés, musique ghanéenne, plages et lieux culturels comme Jamestown. "
        "La ville est parfaite pour les voyageurs cherchant une expérience africaine chaleureuse et vibrante.",
  ),

  Destination(
    id: 'addis_ababa',
    city: 'Addis-Ababa',
    country: 'Ethiopia',
    continent: 'Africa',
    imagePath: 'images/villes/addis2.jpg',
    flagPath: 'images/Pays/ethiopiaFlag.png',
    rating: 4.4,
    reviewCount: 140,
    heroTag: 'hero_addis',
    shortDescription:
        "Addis-Ababa est un centre historique et culturel unique en Afrique de l’Est.",
    longDescription:
        "Connue comme la capitale diplomatique de l’Afrique, Addis-Ababa regorge de musées, d’architecture unique et de traditions profondes. "
        "C’est un point d’entrée captivant vers l’histoire éthiopienne et ses hauts plateaux.",
  ),

  Destination(
    id: 'windhoek',
    city: 'Windhoek',
    country: 'Namibia',
    continent: 'Africa',
    imagePath: 'images/villes/windhoek2.jpg',
    flagPath: 'images/Pays/namibiaFlag.png',
    rating: 4.3,
    reviewCount: 120,
    heroTag: 'hero_windhoek',
    shortDescription:
        "Windhoek, ville paisible, est entourée de paysages désertiques splendides.",
    longDescription:
        "Windhoek offre une atmosphère calme, une architecture allemande unique et un accès direct aux plus beaux déserts d’Afrique : Sossusvlei, Namib et Etosha.",
  ),

  Destination(
    id: 'seoul',
    city: 'Séoul',
    country: 'South Korea',
    continent: 'Asia',
    imagePath: 'images/villes/seoul1.jpg',
    flagPath: 'images/Pays/southkoreaFlag.png',
    rating: 4.9,
    reviewCount: 300,
    heroTag: 'hero_seoul',
    shortDescription:
        "Séoul mélange modernité futuriste, quartiers animés et traditions coréennes.",
    longDescription:
        "Entre les gratte-ciel de Gangnam, les palais historiques comme Gyeongbokgung, et les rues animées de Myeongdong, Séoul est une ville vibrante. "
        "La cuisine coréenne, les cafés uniques, les marchés traditionnels et la culture K-pop en font une destination incontournable.",
  ),
  Destination(
    id: 'london',
    city: 'Londres',
    country: 'United Kingdom',
    continent: 'Europe',
    imagePath: 'images/villes/london2.jpg',
    flagPath: 'images/Pays/ukFlag.png',
    rating: 4.8,
    reviewCount: 410,
    heroTag: 'hero_london',
    shortDescription:
        "Londres charme par ses monuments historiques, ses musées et son ambiance cosmopolite.",
    longDescription:
        "De Big Ben à Tower Bridge, en passant par Camden Town et Notting Hill, Londres combine histoire, diversité culturelle et modernité. "
        "C’est une ville riche en spectacles, musées gratuits, gastronomie internationale et balades le long de la Tamise.",
  ),
  Destination(
    id: 'rome',
    city: 'Rome',
    country: 'Italy',
    continent: 'Europe',
    imagePath: 'images/villes/rome2.jpg',
    flagPath: 'images/Pays/italyFlag.png',
    rating: 4.8,
    reviewCount: 310,
    heroTag: 'hero_rome',
    shortDescription:
        "Rome allie histoire millénaire, monuments antiques et dolce vita.",
    longDescription:
        "Le Colisée, le Vatican, la Fontaine de Trevi et les ruelles pavées font de Rome un musée à ciel ouvert. "
        "La ville offre une gastronomie incomparable, des places animées et un charme historique unique.",
  ),
  Destination(
    id: 'los_angeles',
    city: 'Los Angeles',
    country: 'United States',
    continent: 'North America',
    imagePath: 'images/villes/losangeles2.jpg',
    flagPath: 'images/Pays/usaFlag.png',
    rating: 4.6,
    reviewCount: 330,
    heroTag: 'hero_losangeles',
    shortDescription:
        "Los Angeles est la capitale mondiale du cinéma, des plages et du soleil.",
    longDescription:
        "Hollywood, Santa Monica, Venice Beach et Beverly Hills font de Los Angeles une ville emblématique. "
        "On y trouve une diversité culturelle incroyable, de la nourriture internationale et une ambiance détendue propre à la Californie.",
  ),
  Destination(
    id: 'bangkok',
    city: 'Bangkok',
    country: 'Thailand',
    continent: 'Asia',
    imagePath: 'images/villes/bangkok1.jpg',
    flagPath: 'images/Pays/thailandFlag.png',
    rating: 4.7,
    reviewCount: 290,
    heroTag: 'hero_bangkok',
    shortDescription:
        "Bangkok combine temples magnifiques, marchés vibrants et vie nocturne animée.",
    longDescription:
        "Le Grand Palais, les temples Wat Pho et Wat Arun, les marchés flottants et la street-food en font une ville fascinante. "
        "Bangkok est un mélange parfait entre modernité asiatique et traditions thaïlandaises.",
  ),
  Destination(
    id: 'dubai',
    city: 'Dubai',
    country: 'United Arab Emirates',
    continent: 'Asia',
    imagePath: 'images/villes/dubai1.jpg',
    flagPath: 'images/Pays/uarabemirateFlag.png',
    rating: 4.8,
    reviewCount: 260,
    heroTag: 'hero_dubai',
    shortDescription:
        "Dubai est une ville futuriste mêlant luxe, innovations et désert.",
    longDescription:
        "Entre le Burj Khalifa, les îles Palm, le désert et les centres commerciaux gigantesques, Dubai propose une expérience unique. "
        "La ville offre des plages, une gastronomie internationale et une architecture impressionnante.",
  ),
  Destination(
    id: 'istanbul',
    city: 'Istanbul',
    country: 'Turkey',
    continent: 'Europe',
    imagePath: 'images/villes/istanbul1.jpg',
    flagPath: 'images/Pays/turkeyFlag.png',
    rating: 4.8,
    reviewCount: 230,
    heroTag: 'hero_istanbul',
    shortDescription:
        "Istanbul relie l’Europe et l’Asie dans un mélange unique d’histoire et de culture.",
    longDescription:
        "Entre Sainte-Sophie, la Mosquée Bleue, le Bosphore et les bazars, Istanbul est une ville riche en traditions. "
        "On y découvre une cuisine généreuse, une architecture incroyable et un patrimoine millénaire.",
  ),
  Destination(
    id: 'madrid',
    city: 'Madrid',
    country: 'Spain',
    continent: 'Europe',
    imagePath: 'images/villes/madrid2.jpg',
    flagPath: 'images/Pays/spainFlag.png',
    rating: 4.7,
    reviewCount: 200,
    heroTag: 'hero_madrid',
    shortDescription:
        "Madrid séduit par son énergie culturelle, ses musées et sa gastronomie.",
    longDescription:
        "Entre le musée du Prado, la Plaza Mayor, le parc du Retiro et ses cafés animés, Madrid est une ville chaleureuse. "
        "C’est une destination idéale pour l’art, la vie nocturne et les tapas.",
  ),
  Destination(
    id: 'lisbon',
    city: 'Lisbon',
    country: 'Portugal',
    continent: 'Europe',
    imagePath: 'images/villes/lisbon2.jpg',
    flagPath: 'images/Pays/portugalFlag.png',
    rating: 4.8,
    reviewCount: 250,
    heroTag: 'hero_lisbon',
    shortDescription:
        "Lisbonne est une ville ensoleillée avec ruelles pittoresques et culture maritime.",
    longDescription:
        "Le quartier d’Alfama, les miradouros, les tramways jaunes et les Pastéis de Nata rendent Lisbonne inoubliable. "
        "La ville mêle musique fado, plages proches et ambiance décontractée.",
  ),
  Destination(
    id: 'montreal',
    city: 'Montréal',
    country: 'Canada',
    continent: 'North America',
    imagePath: 'images/villes/montreal2.jpg',
    flagPath: 'images/Pays/canadaFlag.png',
    rating: 4.7,
    reviewCount: 260,
    heroTag: 'hero_montreal',
    shortDescription:
        "Montréal combine culture européenne, festivals et diversité culinaire.",
    longDescription:
        "Entre le Vieux-Montréal, le Mont Royal, ses quartiers multiculturels et ses festivals, Montréal est une ville vibrante. "
        "Elle offre une gastronomie variée, une ambiance chaleureuse et une créativité artistique unique.",
  ),
  Destination(
    id: 'toronto',
    city: 'Toronto',
    country: 'Canada',
    continent: 'North America',
    imagePath: 'images/villes/toronto1.jpg',
    flagPath: 'images/Pays/canadaFlag.png',
    rating: 4.6,
    reviewCount: 300,
    heroTag: 'hero_toronto',
    shortDescription:
        "Toronto est une métropole moderne, multiculturelle et dynamique.",
    longDescription:
        "La Tour CN, les îles de Toronto, les musées, le quartier Distillery et la diversité gastronomique font de Toronto une ville incontournable. "
        "C’est un centre culturel et économique majeur au Canada.",
  ),
  Destination(
    id: 'buenosaires',
    city: 'Buenos Aires',
    country: 'Argentina',
    continent: 'South America',
    imagePath: 'images/villes/buenosaires2.jpg',
    flagPath: 'images/Pays/argentinaFlag.png',
    rating: 4.7,
    reviewCount: 210,
    heroTag: 'hero_buenosaires',
    shortDescription:
        "Buenos Aires charme par son tango, son architecture européenne et son ambiance passionnée.",
    longDescription:
        "Avec ses cafés historiques, la Boca colorée, le tango et les grandes avenues, Buenos Aires possède une identité forte. "
        "La ville est vivante, culturelle et pleine d’énergie.",
  ),
  Destination(
    id: 'mexico_city',
    city: 'Mexico City',
    country: 'Mexico',
    continent: 'South America',
    imagePath: 'images/villes/mexicocity2.jpg',
    flagPath: 'images/Pays/mexicoFlag.png',
    rating: 4.6,
    reviewCount: 280,
    heroTag: 'hero_mexicocity',
    shortDescription:
        "Mexico City combine histoire aztèque, musées grandioses et cuisine authentique.",
    longDescription:
        "Entre Teotihuacan, le musée Frida Kahlo, Chapultepec et les tacos de rue, CDMX est une destination culturelle et gourmande. "
        "La ville est immense, dynamique et fascinante.",
  ),
  Destination(
    id: 'stockholm',
    city: 'Stockholm',
    country: 'Sweden',
    continent: 'Europe',
    imagePath: 'images/villes/stockholm2.jpg',
    flagPath: 'images/Pays/swedenFlag.png',
    rating: 4.8,
    reviewCount: 180,
    heroTag: 'hero_stockholm',
    shortDescription:
        "Stockholm est une capitale élégante entourée d’îles et de nature.",
    longDescription:
        "Avec Gamla Stan, ses musées, ses cafés et ses architectures modernes, Stockholm mélange traditions scandinaves et innovation. "
        "C’est une ville parfaite pour les amoureux de design et de paysages.",
  ),
  Destination(
    id: 'prague',
    city: 'Prague',
    country: 'Czech Republic',
    continent: 'Europe',
    imagePath: 'images/villes/prague2.jpg',
    flagPath: 'images/Pays/czechFlag.png',
    rating: 4.9,
    reviewCount: 220,
    heroTag: 'hero_prague',
    shortDescription:
        "Prague est une ville féerique connue pour ses ponts, ses châteaux et son charme unique.",
    longDescription:
        "Le pont Charles, le château de Prague, les ruelles médiévales et la cuisine tchèque en font une destination magique. "
        "C’est l’une des plus belles villes d’Europe.",
  ),
  Destination(
    id: 'vienna',
    city: 'Vienne',
    country: 'Austria',
    continent: 'Europe',
    imagePath: 'images/villes/vienna1.jpg',
    flagPath: 'images/Pays/austriaFlag.png',
    rating: 4.8,
    reviewCount: 195,
    heroTag: 'hero_vienna',
    shortDescription:
        "Vienne est la capitale de la musique classique, de l’art et des cafés historiques.",
    longDescription:
        "Entre le palais de Schönbrunn, l’Opéra, le Belvédère et son ambiance impériale, Vienne est un voyage dans l’élégance européenne. "
        "La ville est culturelle, paisible et raffinée.",
  ),
  Destination(
    id: 'zurich',
    city: 'Zurich',
    country: 'Switzerland',
    continent: 'Europe',
    imagePath: 'images/villes/zurich1.jpg',
    flagPath: 'images/Pays/switzerlandFlag.png',
    rating: 4.7,
    reviewCount: 160,
    heroTag: 'hero_zurich',
    shortDescription:
        "Zurich combine luxe, nature et qualité de vie exceptionnelle.",
    longDescription:
        "Entre lac, montagnes proches, boutiques élégantes et vieille ville charmante, Zurich est une capitale tranquille et moderne. "
        "C’est une destination parfaite pour le confort et les paysages.",
  ),
  Destination(
    id: 'doha',
    city: 'Doha',
    country: 'Qatar',
    continent: 'Asia',
    imagePath: 'images/villes/doha2.jpg',
    flagPath: 'images/Pays/qatarFlag.png',
    rating: 4.6,
    reviewCount: 150,
    heroTag: 'hero_doha',
    shortDescription:
        "Doha est une ville moderne en plein essor au style architectural unique.",
    longDescription:
        "Avec son Corniche, ses musées, ses souks et ses îles artificielles, Doha offre luxe, culture et découvertes. "
        "C’est une destination idéale entre modernité et traditions.",
  ),
  Destination(
    id: 'cairo',
    city: 'Le Caire',
    country: 'Egypt',
    continent: 'Africa',
    imagePath: 'images/villes/cairo1.jpg',
    flagPath: 'images/Pays/egyptFlag.png',
    rating: 4.7,
    reviewCount: 310,
    heroTag: 'hero_cairo',
    shortDescription:
        "Le Caire fascine avec ses pyramides, son Nil et son histoire incroyable.",
    longDescription:
        "Les pyramides de Gizeh, le musée égyptien, les marchés et les croisières sur le Nil font du Caire une ville mythique. "
        "C’est un voyage au cœur de l’Antiquité.",
  ),
  Destination(
    id: 'amman',
    city: 'Amman',
    country: 'Jordan',
    continent: 'Asia',
    imagePath: 'images/villes/amman2.jpg',
    flagPath: 'images/Pays/jordanFlag.png',
    rating: 4.6,
    reviewCount: 145,
    heroTag: 'hero_amman',
    shortDescription:
        "Amman est une ville historique proche de sites emblématiques comme Pétra et la mer Morte.",
    longDescription:
        "Entre la citadelle, les souks, le théâtre romain et la cuisine jordanienne, Amman est une ville chaleureuse. "
        "C’est un point de départ parfait pour découvrir Pétra, Wadi Rum et la mer Morte.",
  ),
];
