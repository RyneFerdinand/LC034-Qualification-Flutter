import 'package:code/models/cardPack.dart';
import 'package:code/models/globalTheme.dart';

bool initialized = false;

String username = '';

GlobalTheme currTheme = GlobalTheme();

var reviewList = [];

// For Packs
var packList = [];
var tempPackList = [];

int numOfPacks = 10;

var _packListNames = [
  'Empire of Scarlet',
  'Blackstorm Rising',
  'Tornado of Phantoms',
  'Dimension of the Wizards',
  'Blazing Rose',
  'Cybernetic Rebellion',
  'Dark Dimension',
  'Spririt of the Beast',
  'Aerial Assault',
  'Soul of Resurrection',
];

var _packListDescriptions = [
  '[13th mini Box] "Empire of Scarlet"! Cries of anguish echo through the night.A symphony of terror under the scarlet moon.',
  '[16th Main Box] "Black Storm Rising" ! BF, Dragnity creates a whirlwind! Soar up! Black feather dragon! Get ready to be blown away! Rise, "Black-Winged Dragon"!',
  '[17th Mini Box] "Tornado of Phantoms"! Fly like the wind! Gustos and Mecha Phantom Beasts are inbound! Many wind-type monsters such as "E ・ HERO Great TORNADO", "Phantom Beast Machine Tether Wolf", and "Mist Warm" have appeared!',
  '[18th Mini Box] "Dimension of Wizard"!The next level of Spellcaster and Psychic strategies! New Madolche and Naturia cards are here as well! Introducing "Arkanite Magician" that destroys cards on the opponent\'s field! Don\'t miss the new psychic tribe and "Madolce" and "Natur"!',
  '[20th Main Box] "Blazing Rose" ! "Cold flames wrap around the whole world, appear!" That "Black Rose Dragon" is included! In addition, new themes such as "Subteller" will also participate!',
  '[21st Main Box] "Cybernetic Rebellion"! "Cyber Dragon," activate! Machine-Type monsters are stronger than ever with the new Crystrons! Includes the new "Crystal Machinery", "Diva in the Deep Sea", "Dragon of the Ice Barrier Gungnir", and "Phantom Beast Machine Orion"!',
  '[23rd Main Box] Fighting to an unknown area- "Dark Dimension"! The gateway to darkness has opened. The next stage of Dueling has arrived! Includes powerful cards such as "Guardian Priest Mahad", "Chaos Sorcerer", and "Summoner Aleister", as well as "Magician Girl", "Gadget", and "Gravekeeper"!',
  '[23rd Mini Box] "Spirit of the Beast"! Spiritual Beasts and Ritual Beast Tamers are here to stir up a storm! Yosenjus have come out of hiding as well!See the cooperation between the spirit beast and the spirit beast messenger! Introducing the youkai beast of Goddess!',
  '[24th Main Box] "Aerial Assault"! Blackwings have returned, their forces now more powerful than ever! Turn the black wings and the assault begins now! See the great evolution of BF! Includes "BF-Elite Zephyrus" and "Brunak, the Dragon of the Ice Barrier"!',
  '[24th Mini Box] "Soul of Resurrection"! Break through the door of the underworld and appear "Dragon Necro of the Underworld"! The door to the netherworld has opened. Rise, Dragonecro Nethersoul Dragon! The Shiranui have returned from the realm beyond as well!"Zombie Master", "Killer Tomato", "Thunder Break", etc. will also participate!',
];

var _packListPrices = [10, 20, 15, 25, 17, 22, 16, 11, 19, 18];

void initPackList() {
  for (int i = 1; i <= numOfPacks; i++) {
    if (i >= 1 && i <= 3) {
      tempPackList.add(new CardPack(i, 'listItem/$i.jpg', _packListNames[i - 1],
          _packListDescriptions[i - 1], _packListPrices[i - 1]));
    }
    packList.add(new CardPack(i, 'listItem/$i.jpg', _packListNames[i - 1],
        _packListDescriptions[i - 1], _packListPrices[i - 1]));
  }
}

var carouselList = [];
int numOfCarousel = 5;

void initCarouselList() {
  for (int i = 1; i <= numOfCarousel; i++) {
    carouselList.add('assets/carousel/$i.jpg');
  }
}

var cardList = [];
int numOfCards = 3;

void initCards() {
  for (var i = 1; i <= numOfCards; i++) {
    cardList.add('assets/card/$i.jpg');
  }
}

void initializeData() {
  initPackList();
  initCarouselList();
  initCards();
}
