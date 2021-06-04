-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 18, 2020 at 09:54 PM
-- Server version: 10.1.41-MariaDB-0+deb9u1
-- PHP Version: 7.0.33-0+deb9u3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `benjaminbland`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `username` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`username`, `password`) VALUES
('root', '$2b$12$BXhnc0YWa7.DXUe08Uiyz..Yf/0.d33KInX.0AlFWrErbgjzaWFTq'),
('Ben', '$2b$12$oe0GBVuSB.pSxSMP.ZxUZeWwYAGagRPb6TEmxiQ5qVJz8t3MHXF.u'),
('james.clarke', '$2b$12$e.VoluAouC6Ruu6.EWpXk.yS5oqsdpLPx1l0AsYCrJXT0ODyqDDJ6');

-- --------------------------------------------------------

--
-- Table structure for table `destinations`
--

CREATE TABLE `destinations` (
  `destId` int(64) NOT NULL,
  `name` varchar(200) NOT NULL,
  `reviews1` varchar(10000) NOT NULL,
  `reviews2` varchar(10000) NOT NULL,
  `feature1` varchar(10000) NOT NULL,
  `feature1Description` varchar(10000) NOT NULL,
  `feature2` varchar(10000) NOT NULL,
  `feature2Description` varchar(10000) NOT NULL,
  `imageURL` varchar(3000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `destinations`
--

INSERT INTO `destinations` (`destId`, `name`, `reviews1`, `reviews2`, `feature1`, `feature1Description`, `feature2`, `feature2Description`, `imageURL`) VALUES
(1, 'Greece', '', '', 'Crisp White Beaches', 'Greece\'s coastline features wide beaches as far as the eye can see', 'Serene Towns', 'Come visit greeces serene rural towns, with their distinctive white walls', 'Backgrounds/Greece2.jpg'),
(2, 'Canaries', '', '', 'The weather', 'This destination is knowing for being scorching hot in the summer', 'The sea', 'The water is clearer than your mind after a swim in the cooling waters', 'Backgrounds/CanaryIslands2.jpg'),
(3, 'America', '', '', 'Culture', 'American culture is like no other, with an emphasis on partriotism', 'Food', 'American food is varied affair, with cultures from across the world adding their own spin on popular meals', 'Backgrounds/America2.jpg'),
(4, 'Arctic', '', '', 'A rugged landscape', 'From glaciers to dormant volcanoes, the arctic landscape transports you back to a harsh and unforgiving past ', 'Wildlife', 'Wildlife like no other can be found roaming the arctic tundra', 'Backgrounds/Arctic.jpg'),
(5, 'Australia', '', '', 'The climate', 'Reaching temperatures of 45 Degrees, you\'d better remember to pack your sunscreen', 'Wildlife', 'Australia has some of the most diverse wildlife on the planet, and only some of it wants to hurt you', 'Backgrounds/Australia.jpg'),
(6, 'Norway', '', '', 'Coastlines', 'Norway has some of the longest and most ruggd coastlines in the world', 'Islands', 'Norway has 50,000 islands of its coastline, most accessible by boat', 'Backgrounds/Norway.jpg'),
(7, 'Turkey', '', '', 'Architecture', 'Some of turkeys most famous hotels and locations, are built inside of caves', 'Its capital city', 'Istanbul is old capital city of turkey, and is one of the most popular tourist destinations in the country', 'Backgrounds/Turkey.jpg'),
(8, 'Spain', '', '', 'The climate', 'Being located in the extreme southwest of Europe, Spain enjoys summer temperatures well in excess of 30 degrees ', 'Islands', 'Spain has many small islands around it, some of these being the most popular party destinations in Europe, such as Ibiza', 'Backgrounds/Spain.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `favouriteDest`
--

CREATE TABLE `favouriteDest` (
  `username` varchar(500) NOT NULL,
  `destId` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `favouriteDest`
--

INSERT INTO `favouriteDest` (`username`, `destId`) VALUES
('admin', '?destId=2'),
('Ben', '?destId=1'),
('Ben', '?destId=2'),
('james.clarke1', '?destId=1'),
('james.clarke', '?destId=1');

-- --------------------------------------------------------

--
-- Table structure for table `favouriteHotels`
--

CREATE TABLE `favouriteHotels` (
  `username` varchar(500) NOT NULL,
  `hotelId` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `favouriteHotels`
--

INSERT INTO `favouriteHotels` (`username`, `hotelId`) VALUES
('Ben', '?hotelId=1'),
('james.clarke1', '?hotelId=2'),
('Ben', '?hotelId=12'),
('Ben', '?hotelId=7'),
('Ben', '?hotelId=29');

-- --------------------------------------------------------

--
-- Table structure for table `hotelReviews`
--

CREATE TABLE `hotelReviews` (
  `hotelId` varchar(500) NOT NULL,
  `Review` varchar(20000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hotelReviews`
--

INSERT INTO `hotelReviews` (`hotelId`, `Review`) VALUES
('?hotelId=1', 'Really comfy beds'),
('?hotelId=1', 'Fantastic view'),
('?hotelId=2', 'Brilliant pool'),
('?hotelId=2', 'This is really good'),
('?hotelId=7', 'We went snorkling for the first time on our visit the the Ahthens Tiare Hotel'),
('?hotelId=8', 'We loved the Zoological park which is within visiting distance of the hotel');

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `hotelId` varchar(50) NOT NULL,
  `destId` varchar(500) NOT NULL,
  `name` varchar(500) NOT NULL,
  `reviews1` varchar(5000) NOT NULL,
  `reviews2` varchar(5000) NOT NULL,
  `feature1` varchar(5000) NOT NULL,
  `feature1Description` varchar(5000) NOT NULL,
  `feature2` varchar(5000) NOT NULL,
  `feature2Description` varchar(5000) NOT NULL,
  `imageURL` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`hotelId`, `destId`, `name`, `reviews1`, `reviews2`, `feature1`, `feature1Description`, `feature2`, `feature2Description`, `imageURL`) VALUES
('?hotelId=1', '?destId=2', 'Hotel Cristina las Palmas', '', '', 'Location', 'Located in Las Palmas de Gran Canaria, Hotel Cristina las Palmas is connected to the airport. Las Arenas Commercial Center and Calle Triana are worth checking out if shopping is on the agenda, while those wishing to experience the area\'s natural beauty can explore Las Canteras Beach and Santa Catalina Park. Poema del Mar Aquarium and Viera y Clavijo Botanical Garden are also worth visiting.', 'Facilities', '5-star beach hotel with a conference centre\r\nThis smoke-free hotel features a restaurant, an outdoor pool and a health club. Free buffet breakfast and free WiFi in public areas are also provided. Additionally, a bar/lounge, a poolside bar and a coffee shop/café are on-site. All 306 rooms offer free WiFi and free wired Internet, plus separate sitting areas and plasma TVs with satellite channels. Other amenities available to guests include 24-hour room service, minibars and down duvets.\r\nHotel Cristina las Palmas offers 306 forms of air-conditioned accommodation with minibars and a safe. This accommodation offers separate sitting areas. Beds feature down comforters. 26-inch Plasma televisions come with satellite channels. Bathrooms include baths or showers, bidets, complimentary toiletries and hairdryers.\r\nThis Las Palmas de Gran Canaria hotel provides complimentary wired and wireless Internet access. Business-friendly amenities include desks and telephones. A nightly turndown service is provided and housekeeping is offered on a daily basis. Amenities available on request include in-room massages.\r\nRecreational amenities at the hotel include an outdoor pool and a health club.', 'Backgrounds/187921306.jpg'),
('?hotelId=2', '?destId=2', 'Playa Meloneras Palace', '', '', 'Location', 'The hotel is situated on Meloneras beach, in the southern part of the island of Gran Canaria, giving fantastic views of the coast.', 'Facilities', ' A great pick for families and couples alike, this five-star hotel offers an outdoor swimming pool, sports ground, live music and entertainment.', 'Backgrounds/h10-playa-meloneras-palace.jfif'),
('?hotelId=3', '?destId=2', 'Radisson Blu Resort Gran Canaria', '', '', 'Location', 'Surrounded by three picturesque beaches, this hotel’s location on Gran Canaria is at the edge of the Atlantic Ocean on the southern coast of the island. In addition to the beaches, guests enjoy shopping at trendy stores and exploring nearby villages like Arguineguin.', 'Overview', 'The hotel maintains a great balance of convenience and exclusion with the island\'s national airport a quick drive away. Offering direct access and close proximity to highway GC1, this resort getaway offers great accessibility and visibility of the entire island.', 'Backgrounds/radisson-blu-resort-gran-canaria.jfif'),
('?hotelId=4', '?destId=2', 'Vital Suites Hotel and Spa', '', '', 'Location', 'Vital Suites Hotel and Spa is situated in a quiet location on the outskirts of Playa del Inglés. The centre of Playa del Inglés and Yumbo shopping centre are just 400m away. Guests can relax on the sun terrace by the swimming pool or in the Spa', 'Overview', 'The rooms are comfortably furnished and come fitted with an en suite bathroom with hairdryer and bathrobe. They are also all equipped with satellite TV a direct dial telephone, a minibar, central heating, a safe and a terrace with golf field views. The Suite Junior are fitted with the same equipment and they have also a living room with a balcony or terrace.', 'Backgrounds/vital-suites-hotel-and-spa_.jfif'),
('?hotelId=5', '?destId=1', 'Capsis Hotel Thessaloniki', '', '', 'Thessaloniki', 'Located in Vardaris neighbourhood, Capsis Hotel Thessaloniki is connected to a shopping centre.', 'Culture', 'Museum of Byzantine Culture and Thessaloniki Concert Hall are cultural highlights, and some of the area\'s notable landmarks include Aristotelous Square and Church of Panagia Chalkeon. Insectopia and Waterland are also worth visiting. Take the opportunity to explore the area for outdoor excitement like ecotours.', 'Backgrounds/Capsis Hotel Thessaloniki.jpg'),
('?hotelId=6', '?destId=1', 'Iliada Villas', '', '', 'Naxos', 'Located in Naxos, Iliada Villas is in the suburbs and near the beach. While the natural beauty of Agios Prokopios Beach and Agios Georgios Beach can be enjoyed by anyone, those looking for an activity can explore Port of Naxos.', 'Activites', 'Discover the area\'s water adventures with scuba diving and snorkelling nearby, or enjoy the great outdoors with mountain biking and hiking/biking trails.', 'Backgrounds/Iliada Villas.jpg'),
('?hotelId=7', '?destId=1', 'Athens Tiare Hotel', '', '', 'Athens', 'Located in Athens City Centre neighbourhood, Athens Tiare Hotel is connected to a shopping centre. Syntagma Square and Parthenon are notable landmarks', 'Activities', 'Looking to enjoy an event or a game while in town? See what\'s happening at Panathenaic Stadium or Faliro Sports Pavilion Arena.', 'Backgrounds/Athens Tiare Hotel.jpg'),
('?hotelId=8', '?destId=1', 'Dolce by Wyndham Attica Riviera', '', '', 'Markopoulo Mesogaias', 'Located in Markopoulo Mesogaias, Dolce by Wyndham Attica Riviera is in the business district and on the beach.', 'Things to do', ' Rafina Port and Koutouki Cave are worth exploring if an activity is on the agenda, while those in the mood for shopping can visit Factory Outlet Airport and McArthurGlen Designer Outlet. Travelling with kids? Don\'t miss Attica Zoological Park.', 'Backgrounds/Dolce by Wyndham Attica Riviera.jpg'),
('?hotelId=9', '?destId=3', 'Arlo SoHo', '', '', 'New York', 'Located in New York, Arlo SoHo is in the city centre and near a metro station. Notable landmarks in the area include One World Trade Center and National September 11 Memorial.', 'Activities', 'Looking to enjoy an event or a game? See what\'s going on at Madison Square Garden or Barclays Center Brooklyn. Our guests love the hotel\'s convenience for public transport: Canal St. Station (Varick St.) is just steps away and Canal St. Station (W. Broadway) is 6 minutes by foot.', 'Backgrounds/Arlo SoHo.jpg'),
('?hotelId=10', '?destId=3', 'Archer Hotel New York', '', '', 'Location', 'In the city centre, Archer Hotel New York is in New York\'s Midtown neighbourhood, an area with great shopping. The area\'s natural beauty can be seen at Bryant Park and Central Park, while Central Park Zoo and Chelsea Piers are popular area attractions.', 'Activities', 'Looking to enjoy an event or a game? See what\'s going on at Madison Square Garden or Barclays Center Brooklyn. Our guests love the hotel\'s location for the sightseeing. It\'s also convenient for public transport: 42 St. - Bryant Pk. Station is 4 minutes by foot and 34 St. Station (Herald Square) is 5 minutes.', 'Backgrounds/Archer Hotel New York.jpg'),
('?hotelId=11', '?destId=3', 'LYRIC | 70 Pine NYC', '', '', 'Location', 'Located in New York, LYRIC | 70 Pine NYC is in the business district and near a metro station. Broadway and Ellis Island Immigration Museum are cultural highlights, and some of the area\'s notable landmarks include Brooklyn Bridge and Empire State Building.', 'Amenities', 'Chelsea Piers and Central Park Zoo are not to be missed. Our guests love the hotel\'s convenience for public transport: Wall St. Station is just steps away and Broad St. Station is 5 minutes by foot.', 'Backgrounds/LYRIC 70 Pine NYC.jpg'),
('?hotelId=12', '?destId=3', 'Fitzpatrick Grand Central', '', '', 'Location', 'Located in New York\'s Midtown neighbourhood, Fitzpatrick Grand Central is in the city centre and near a metro station. The area\'s natural beauty can be seen at Bryant Park and Central Park, while Central Park Zoo and Chelsea Piers are popular area attractions.', 'Things to do ', 'Consider St. James Theatre for a night out, and don\'t miss Bronx Zoo, a top local attraction. Relax and indulge in the area\'s health/beauty spas, or seek out an adventure with hiking/biking trails nearby. Our guests love the hotel\'s central location.', 'Backgrounds/Fitzpatrick Grand Central.jpg'),
('?hotelId=13', '?destId=4', 'Snow Hotel & Glass Igloos', '', '', 'Overview', 'Glass igloo or ice hotel? What a dilemma! No problem, with 3 nights at this fantastic resort, you can do BOTH! Our Snow Hotel & Glass Igloos package is ideal for families with older children or couples who are looking to experience the best of the Arctic. We include all the services that we feel are essential to make your stay with us an unforgettable trip of a lifetime.', 'Activities', 'Our activities include snowboarding, husky safari and more', 'Backgrounds/Snow Hotel & Glass Igloos.jpg'),
('?hotelId=14', '?destId=4', 'Gulo Gulo Holiday Apartments', '', '', 'Overview', 'If your a family looking for a break away or a small group of friends then this package stay at the Gulo Gulo Holiday Apartments could be exactly what you\'re looking for. With four activities included in the price and loads more activities you can add on if you choose, plus an apartment that can sleep up to 6 people, you\'re getting really great value for money', 'Activities', 'Activties include: 45-minute Meet the Polar Bears at Ranua Wildlife Park, 3-hour Snowmobile Safari to Reindeer Farm, 2-hour Snowshoeing at Night', 'Backgrounds/Gulo Gulo Holiday Apartments.jpg'),
('?hotelId=15', '?destId=4', 'Arctic Retreat Eco Lodge', '', '', 'Overview', 'Tucked away in the forest, Arctic Retreat is the little gem you\'ve been searching for. Offering a personal stay in a luxury eco-lodge which resets the stresses of day to day life. With just 4 luxury cabins each with their own private hot tub and activities with small group sizes (or private if preferred) Arctic Retreat is a boutique lodge and perfect for those who want a little bit more from their holiday time. Fantastic for viewing the Northern Lights, this is the getaway break you’re looking for.', 'Package Details', 'Ice fishing private activity 3 hours, Guided host meeting with orientation and outdoor lunch, Private husky tour driven by guide 1.5 hours', 'Backgrounds/Arctic Retreat Eco Lodge.jpg'),
('?hotelId=16', '?destId=4', '3 Night ICEHOTEL Adventure', '', '', 'Overview', 'The ICEHOTEL is created in a new guise every winter, completely made out of natural ice from Torne River, one of Sweden’s national rivers and last untouched waters. When the winter suites have melted back into the river in spring, a part of the hotel still stands, a place where visitors can experience the ice and snow year-round.', 'Features', 'On this trip you will get to enjoy sitting on a husky sledge as your professional guide drives the sledge over frozen lakes and through the pristine forest. The package also includes a snowmobile safari when you can feel the need for speed as you experience Lapland\'s most popular means of travel. And the evening you can enjoy a vodka IN the rocks in the ice bar - but remember to take time check for the Northern Lights because it\'s one of the best places in the world to see them.\r\n\r\nThis package is most popular for birthday and anniversaries or people who want to see the ICEHOTEL but not break the bank. The package can be tailored to your request.', 'Backgrounds/3 Night ICEHOTEL Adventure.jpg'),
('?hotelId=17', '?destId=5', 'Hotel Kurrajong Canberra', '', '', 'Barton', 'Located in Barton\'s Capital Hill neighbourhood, Hotel Kurrajong Canberra is in the business district and near the airport.', 'Things to do ', 'National Gallery of Australia and National Museum of Australia are cultural highlights, and travellers looking to shop may want to visit Canberra Centre. Looking to enjoy an event or a game? See what\'s going on at Manuka Oval or Canberra Stadium. Spend some time exploring the area\'s activities, including segway rentals/tours. Our guests appreciate the hotel\'s location for the sightseeing.', 'Backgrounds/Hotel Kurrajong Canberra.jpg'),
('?hotelId=18', '?destId=5', 'Atlantis Hotel Melbourne', '', '', 'Melbourne', 'In the city centre and near a metro station, Atlantis Hotel, Melbourne is in an area with good airport proximity. Queen Victoria Market and Melbourne Central are worth visiting if shopping is on the agenda, while those wishing to experience the area\'s natural beauty can explore Royal Botanic Gardens.', 'Things to do ', 'Looking to enjoy an event or a match? See what\'s going on at Marvel Stadium or Melbourne Cricket Ground. Take the opportunity to explore the area for water adventures such as sailing and other activities like golfing. Our guests appreciate the motel\'s location for the sightseeing. It\'s also convenient for public transport: Flagstaff Station is 6 minutes by foot and Melbourne Central Station is 12 minutes.', 'Backgrounds/Atlantis Hotel Melbourne.jpg'),
('?hotelId=19', '?destId=5', 'Travelodge Hotel Sydney Airport', '', '', 'Mascot', 'Near a train station, Travelodge Hotel Sydney Airport is in an area with good airport proximity. Sydney Opera House and Sydney Harbour Bridge are notable landmarks, and the area\'s natural beauty can be seen at Maroubra Beach and Centennial Park.', 'Things to do', 'Looking to enjoy an event or a match while in town? See what\'s going on at Sydney Cricket Ground. Our guests appreciate the hotel\'s convenience for public transport: Mascot Station is 10 minutes by foot.', 'Backgrounds/Travelodge Hotel Sydney Airport.jpg'),
('?hotelId=20', '?destId=5', 'ibis budget Sydney Airport', '', '', 'Mascot', 'Near a metro station, ibis budget Sydney Airport is in an area with good airport proximity and shopping.', 'Things to do', 'Crown Street and Paddy\'s Market are worth checking out if shopping is on the agenda, while those wishing to experience the area\'s natural beauty can explore Coogee Beach and Maroubra Beach. Looking to enjoy an event or a game? See what\'s going on at Sydney Cricket Ground or Sydney Showground.', 'Backgrounds/ibis budget Sydney Airport.jpg'),
('?hotelId=21', '?destId=6', 'Thon Hotel Sandven', '', '', 'Norheimsund', 'Located in Kvam, Thon Hotel Sandven is in a rural location and on the waterfront.', 'Things to do ', 'Norheimsund Harbour and Aktiven Skiheis are worth checking out if an activity is on the agenda, while those wishing to experience the area\'s natural beauty can explore Hardangerfjord and Steinsdalfossen Waterfall.', 'Backgrounds/Thon Hotel Sandven.jpg'),
('?hotelId=22', '?destId=6', 'Thon Hotel Oslo Airport', '', '', 'Jessheim', 'Located in Ullensaker, Thon Hotel Oslo Airport is in an area with great airport proximity.', 'Things to do', 'Local points of interest include Norway Trade Fairs.', 'Backgrounds/Thon Hotel Oslo Airport.jpg'),
('?hotelId=23', '?destId=6', 'Radisson Blu Airport Hotel, Oslo Gardermoen', '', '', 'Gardermoen', 'Located in Gardermoen, Radisson Blu Airport Hotel, Oslo Gardermoen is connected to the airport.', 'Things to do', 'Spend some time exploring the area\'s activities, including golfing.', 'Backgrounds/Radisson Blu Airport Hotel.jpg'),
('?hotelId=24', '?destId=6', 'Thon Hotel Nordlys\r\n', '', '', 'Bodo', 'Located in Bodo, Thon Hotel Nordlys is in the city centre and on the waterfront.', 'Places to visit', 'The area\'s natural beauty can be seen at Ausvika and Geitvågstranda, while Nordland Museum and Bodo Domkirke are cultural highlights.', 'Backgrounds/Thon Hotel Nordlys\r\n.jpg'),
('?hotelId=25', '?destId=7', 'Ciragan Palace Kempinski', '', '', 'Istanbul', 'Located in Istanbul\'s Besiktas neighbourhood, Ciragan Palace Kempinski is in the entertainment district and by the sea. Pera Museum and Hagia Sophia are cultural highlights, and travellers looking to shop may want to visit Grand Bazaar and Istanbul Cevahir Shopping and Entertainment Centre.', 'Things to do ', ' Looking to enjoy an event or a game while in town? See what\'s happening at Vodafone Arena or Turk Telekom Arena.', 'Backgrounds/Ciragan Palace Kempinski.jpg'),
('?hotelId=26', '/destid=7', 'The Cappadocia Hotel', '', '', 'Urgup', 'Located in Urgup, The Cappadocia Hotel is in the historical district. The area\'s natural beauty can be seen at Göreme National Park and Red Valley, while Goreme Open Air Museum and Zelve Open Air Museum are cultural highlights.', 'Activities', 'Make sure you don\'t miss outdoor adventures like hiking/biking trails, horse riding and mountain biking, or hop on a bike for hire nearby and take a self-guided tour around Urgup.', 'Backgrounds/The Cappadocia Hotel.jpg'),
('?hotelId=27', '?destId=7', 'Royal Inci Airport Hotel', '', '', 'Istanbul', 'Located in Kucukcekmece neighbourhood, Royal Inci Airport Hotel is connected to the airport. ArmoniPark Outlet Center and Aqua Florya Shopping and Life Center are worth visiting if shopping is on the agenda, while those wishing to experience the area\'s natural beauty can explore Florya Beach.', 'Things to do ', 'Looking to enjoy an event or a match while in town? See what\'s going on at Ataturk Olympic Stadium. Spend some time exploring the area\'s activities, including outlet shopping.', 'Backgrounds/Royal Inci Airport Hotel.jpg'),
('?hotelId=28', '?destId=7', 'Dere Suites', '', '', 'Urgup', 'Located in Urgup, Dere Suites is in the city centre. Cross Golf and Alaaddin Turkish Bath are worth checking out if an activity is on the agenda, while those wishing to experience the area\'s natural beauty can explore Göreme National Park and Göreme National Park and the Rock Sites of Cappadocia', 'Things to do ', 'Rafting offers a great chance to get out on the surrounding water, or you can seek out an adventure with horse riding, cave exploring and hiking/biking trails nearby.', 'Backgrounds/Dere Suites.jpg'),
('?hotelId=29', '?destId=7', 'Yazar Lara Hotel', '', '', 'Antalya', 'Yazar Lara Hotel is located in Antalya\'s Lara neighbourhood. Shemall Shopping Center and Old Bazaar are worth checking out if shopping is on the agenda', 'Things to do', 'Those wishing to experience the area\'s popular attractions can visit Antalya Aquarium and Antalya Aquapark and Dolphinland. Antalya Aquapark and Butterfly Park Antalya are also worth visiting.', 'Backgrounds/Yazar Lara Hotel.jpg'),
('?hotelId=30', '?destId=8', 'Hotel Nuevo Madrid', '', '', 'Madrid', 'Located in Madrid\'s Ciudad Lineal neighbourhood, Hotel Nuevo Madrid is near the airport and near a metro station. Prado Museum and Thyssen-Bornemisza National Museum are cultural highlights, and some of the area\'s notable landmarks include Plaza Mayor and Royal Palace of Madrid.', 'Things to do', 'Enjoy an event or a match at Santiago Bernabeu Stadium, and consider making time for Madrid Zoo Aquarium—a top attraction that\'s not to be missed. Our guests appreciate the hotel\'s convenience for public transport: Manoteras Station is 15 minutes by foot.', 'Backgrounds/Hotel Nuevo Madrid.jpg'),
('?hotelId=31', '?destId=8', 'Hotel M.A. Sevilla Congresos', '', '', 'Seville', 'Located in Este-Alcosa-Torreblanca neighbourhood, Hotel M.A. Sevilla Congresos is connected to the convention centre. Giralda Tower and Metropol Parasol are notable landmarks, and the area\'s natural beauty can be seen at Plaza de España and Plaza Nueva.', 'Things to do', ' Check out an event or a game at Benito Villamarin Stadium, and consider making time for Isla Magica Theme Park, a top attraction not to be missed.', 'Backgrounds/Hotel MA Sevilla Congresos.jpg'),
('?hotelId=32', '?destId=8', 'Apartamentos Guadalpin Boutique', '', '', 'Marbella', 'Located in Marbella, this apartment is near the beach. Marbella Marina and Puerto Banus Marina are worth checking out if an activity is on the agenda', 'Things to do', 'Those wishing to experience the area\'s natural beauty can explore Puerto Banus Beach and Cabopino Beach. Don\'t miss out on a visit to Selwo Adventure Park. Our guests love the property\'s central location.', 'Backgrounds/Apartamentos Guadalpin Boutique.jpg'),
('?hotelId=33', '?destId=8', 'Aura Park Fira Barcelona', '', '', 'L\'Hospitalet de Llobregat', 'Located in L\'Hospitalet de Llobregat, Aura Park Fira Barcelona is connected to a shopping centre. The area\'s natural beauty can be seen at Montjuic and Parc de la Ciutadella, while Barcelona Aquarium and Barcelona Zoo are popular area attractions', 'Things to do', 'Looking to enjoy an event or a game? See what\'s going on at Camp Nou or Palau Sant Jordi.', 'Backgrounds/Aura Park Fira Barcelona.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `Logins`
--

CREATE TABLE `Logins` (
  `Username` varchar(20) NOT NULL,
  `EmailAddress` varchar(50) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Logins`
--

INSERT INTO `Logins` (`Username`, `EmailAddress`, `Password`, `isAdmin`) VALUES
('Ben Bland', 'benbland56@hotmail.co.uk', 'admin', 1),
('mike', 'mike@rocketmail.com', 'testaccount', 0),
('Benjamin', 'benyolo', 'Sup', 0);

-- --------------------------------------------------------

--
-- Table structure for table `Products`
--

CREATE TABLE `Products` (
  `Name` varchar(500) NOT NULL,
  `ID` varchar(32) NOT NULL,
  `Image` varchar(50) NOT NULL,
  `alttext` varchar(500) NOT NULL,
  `productpage` varchar(500) NOT NULL,
  `Price` double NOT NULL,
  `Department` varchar(200) NOT NULL,
  `Description` varchar(4000) NOT NULL,
  `Review` varchar(1000) NOT NULL,
  `Rating` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Products`
--

INSERT INTO `Products` (`Name`, `ID`, `Image`, `alttext`, `productpage`, `Price`, `Department`, `Description`, `Review`, `Rating`) VALUES
('Logitech G933', '1', 'images/logitechg933.jpg', 'logitechg933', 'Productpage-ID=1.php', 93.99, 'Peripherals', 'logitech G933 headset with included RBG functionality', 'Great product, i bought it for my grandson and he loves it', 5),
('Razer DeathAdder Elite Ergonomic Esports Gaming Mouse (Precise 16000 DPi Sensor, Mechanical Mouse Switches, Ergonomic Design and Chroma RGB)', '2', 'images/razerdeathadder.jpg', 'razerdeathadder', 'Productpage-ID=2.php', 39.75, 'Peripherals', 'Its just a green mouse really', 'Kinda bad', 2),
('Razer Firefly Chroma Custom Lighting Cloth Gaming Mouse Pad ', '3', 'images/razerfirefly.jpg', 'razerfirefly', 'Productpage-ID=3.php', 59.99, 'Peripherals', 'Razer gaming mousepad for professional use only', 'Not good', 1),
('LG 34UC99 34 inch Curved Ultrawide Height Adjustable IPS Monitor (3440 x 1440, 2x HDMI, DisplayPort, USB-C, 300 cd/m2, 5ms, 75Hz, AMD Freesync)', '6', 'images/LGmonitor.jpg', 'LG34UC99', 'Productpage-ID=6.php', 879.99, 'Monitors', 'Curved Monitor', 'Very good if you elligable for the mortgage needed to buy one', 5),
('Asus NVIDIA GeForce GTX 1050 PH-GTX1050TI-4G 4 GB GDDR5 128 Bit - Black', '7', 'images/asus1050.jpg', 'asusgtx1050', 'Productpage-ID=7.php', 149.99, 'Graphics Cards', 'PLACEHOLDER', 'Good but expensive', 4),
('Jurassic World Evolution (PS4)', '8', 'images/jurassicpark.jpg', 'jurrasicparkps4', 'Productpage-ID=8.php', 44.99, 'PS4 Games', '', '', 0),
('All-new Amazon Echo (2nd generation)', '9', 'images/alexa.jpg', 'amazonalexa', 'Productpage-ID=9.php', 89.99, 'Electronics', 'Amazon’s Alexa-controlled Echo speaker, now in its second generation and with several derivative versions available, continues to expand its music, smart-home, and digital-assistant abilities. It’s first a wireless speaker, but capable of much more. Using nothing but the sound of your voice, you can play music, search the Web, create to-do and shopping lists, shop online, get instant weather reports, and control popular smart-home products—all while your smartphone stays in your pocket.', '', 0),
('Russell Hobbs RHM1714B 17L Digital 700w Solo Microwave Black', '10', 'images/russellhobbs.jpg', 'russellhobbsmicrowave', 'Productpage-ID=10.php', 119.99, 'Microwaves', 'The RHM1714B is a practical and stylish everyday microwave. This model has a silver mirror finish door and black housing', '', 0),
('Logitech G502 Gaming Mouse Proteus Spectrum RGB Tunable with 11 Programmable Buttons - Black', '11', 'images/logitechg502.jpg', 'logitechg502', 'Productpage-ID=11.php', 49.99, 'Peripherals', 'Logitech G502 features an enhanced optical sensor for maximum tracking accuracy, customisable RGB lighting, custom game profiles, from 200 up to 12,000 DPI and repositionable weights. Some profile settings require Logitech gaming software available for download at official website. ', '', 0),
('Logitech C920 HD Pro USB 1080p Webcam', '12', 'images/logitechc920.jpg', 'logitechc920', 'Productpage-ID=12.php', 54.99, 'Webcams', 'The Logitech HD Pro Webcam C920 is an HD web cam that delivers crystal-clear 1080p video calling and high performance. A sleek black design comes together with high-definition quality (up to 1920 x 1080p) and flawless video calling through Skype for Windows. This high-performance webcam is the ideal tool for a boundless array of self-expression, with video chat on Skype in full HD 1080p or vibrant true-to-life full HD 1080p recordings for video blogs. You can game stream, share, rant, rap, sing and dance live in high-definition 720p. Dual microphones ensure natural stereo sound, while a five-element glass lens and a precisely tuned autofocus let you express yourself in full clarity and detail. ', '', 0),
('Logitech G213 Prodigy Gaming Keyboard, RGB Backlit, Qwerty UK Layout - Black ', '13', 'images/logitechg213.jpg', 'logitechg213', 'Productpage-ID=13.php', 55.04, 'Keyboards', 'G213 prodigyâ€™s slim body is durable, precise and spill-resistant. G213 prodigy is designed for the way you play. With performance tuned keys, G213 prodigy brings together the tactile feel and gaming-grade performance. Keys on the G213 prodigy are tuned to deliver ultra-quick and responsive feedback that is up to 4 times faster than the keys on standard keyboards, while the anti-ghosting gaming matrix keeps you in control even when multiple keys are pressed simultaneously. Add a personal touch to your system with customisable RGB lighting zones or play, pause and mute music and videos instantly with media controls. G213 prodigy is a full-sized keyboard designed for gaming and productivity. ', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `RESTLogins`
--

CREATE TABLE `RESTLogins` (
  `emailAddress` varchar(256) NOT NULL,
  `Password` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `restTableTest`
--

CREATE TABLE `restTableTest` (
  `name` varchar(200) NOT NULL,
  `age` int(10) NOT NULL,
  `location` varchar(200) NOT NULL,
  `height` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restTableTest`
--

INSERT INTO `restTableTest` (`name`, `age`, `location`, `height`) VALUES
('testName', 60, 'testLocation', 'testHeight'),
('bebn', 12, 'town', 'tall'),
('Ben', 12, 'town', 'tall'),
('fdsffdgdfg', 12, 'town', 'tall'),
('Hype', 12, 'town', 'tall'),
('Big dog', 12, 'town', 'tall'),
('Test', 12, 'town', 'tall');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `destId` varchar(500) NOT NULL,
  `review` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`destId`, `review`) VALUES
('?destId=1', 'Lovely country with amazing views'),
('?destId=2', 'Fantastic collection of islands with lots of things to do '),
('?destId=3', 'Americans are some of the friendliest people you will ever meet'),
('?destId=4', 'It was pretty cold but we looked past this for the fantastic landscapes'),
('?destId=5', 'As long as your hotel has aircon and a few cans of bug spray, you can\'t go wrong with this destination'),
('?destId=6', 'We went for a boat cruise and enjoyed every minute of it'),
('?destId=7', 'We stayed in a cave hotel and it was one of the most unique experiences of our lifetimes'),
('?destId=8', 'I got a fantastic tan over the two weeks i stayed in spain');

-- --------------------------------------------------------

--
-- Table structure for table `Students`
--

CREATE TABLE `Students` (
  `studentname` varchar(40) NOT NULL,
  `course` varchar(40) NOT NULL,
  `subject` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Students`
--

INSERT INTO `Students` (`studentname`, `course`, `subject`) VALUES
('Ben Bland', 'Comp Sci', 'Software Engineering');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `destinations`
--
ALTER TABLE `destinations`
  ADD PRIMARY KEY (`destId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `destinations`
--
ALTER TABLE `destinations`
  MODIFY `destId` int(64) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
