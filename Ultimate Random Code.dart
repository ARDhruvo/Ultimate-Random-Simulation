/* 
 * @author Kashikizu
 * Concept date: 23/03/2024 (dd/mm/yyyy)
 * File Creation Date: 27/03/2024
 * Update Date: 28/03/2024 - Fixed Dice Code, Removed Roulette Code, Added future cases in UnivCalc
 * Update Date: 31/03/2024 - Added Name Generator and Chaotic Russian Roulette; Added banana(); Added Card Gen and Rickroll
 * Initial Completion Date: 31/03/2024
 */

import 'dart:math';

void main() {
  UnivCalc start = UnivCalc();
  int roll = start.rand() % 7;
  switch (roll) {
    case 0:
      {
        CoinFlip cf = CoinFlip();
        cf;
      }
      break;
    case 1:
      {
        Dice d = Dice();
        d;
      }
      break;
    case 2:
      {
        ColorGen cg = ColorGen();
        cg;
      }
      break;
    case 3:
      {
        NameGen ng = NameGen();
        ng;
      }
      break;
    case 4:
      {
        ChaosRussianRoulette crr = ChaosRussianRoulette();
        crr;
      }
      break;
    case 5:
      {
        CardGen cd = CardGen();
        cd;
      }
      break;
    default:
      {
        print("https://www.youtube.com/watch?v=dQw4w9WgXcQ");
        start.banana();
      }
  }
}

class CoinFlip {
  //flips coin
  CoinFlip() {
    print("COIN FLIP");
    Coin c = Coin();
    c.ocd();
  }
}

class Coin extends CoinCalc {
  Coin() {
    int f = gen(); //ramdom number of coins flipped
    print("Number of coins flipped: $f");
    flip(0, f, result); //Modified polymorphable flip
    ocd();
    stats(heads, tails, f);
  }

  void result(String face, int s) {
    print("Flip $s: $face");
  }
}

class CoinCalc extends UnivCalc {
  CoinCalc() {}

  //Checks and calls percentage
  void stats(int h, t, f) {
    double perc = 0;
    if (h == t) {
      if (h == 0) {
        print("No coins were flipped");
        banana();
      } else {
        print("Both faces were flipped 50% of the time");
      }
    } else if (h > t) {
      perc = percCalc(h, f);
      print("Most flipped side is Heads");
      print("Heads was flipped $h times");
      print("Heads was flipped $perc% of the time");
    } else {
      perc = percCalc(t, f);
      print("Most flipped side is Tails");
      print("Heads was flipped $t times");
      print("Heads was flipped $perc% of the time");
    }
  }
}

class Dice {
  //Rolls dice
  Dice() {
    print("DICE ROLL");
    Roll d = Roll();
    d.ocd();
  }
}

class Roll extends DiceCalc {
  Roll() {
    List<int> sides = [0, 0, 0, 0, 0, 0]; //Frequency of sides of the dice

    int n = gen(); //Determines the roll amount
    if (n == 0) {
      print("No dice was rolled");
      banana();
    } else {
      print("Dice was rolled $n times");
      for (int i = 0; i < n; i++) {
        int roll = rand() % 6; //Rolling for the result
        int s = i + 1;
        //Result display
        switch (roll) {
          case 0:
            {
              sides[roll] = res(sides[roll], s, roll);
            }
            break;
          case 1:
            {
              sides[roll] = res(sides[roll], s, roll);
            }
            break;
          case 2:
            {
              sides[roll] = res(sides[roll], s, roll);
            }
            break;
          case 3:
            {
              sides[roll] = res(sides[roll], s, roll);
            }
            break;
          case 4:
            {
              sides[roll] = res(sides[roll], s, roll);
            }
            break;
          case 5:
            {
              sides[roll] = res(sides[roll], s, roll);
            }
            break;
          default:
            {
              print(roll);
              print(sides[roll]);
            }
        }
      }
      List<int> sides2 = [
        0,
        0,
        0,
        0,
        0,
        0
      ]; //Another dice to copy the result to
      diceCopy(sides, sides2); //Copies dice results
      List<int> freq = [
        0,
        0
      ]; //Tracking the frequency of highest and lowest side
      int high = diceHigh(sides2, freq); //Gets highest side
      int low = diceLow(sides2, freq); //Gets lowest side
      int max = diceMax(sides2); //Gets most frequent side
      ocd();
      mostRolled(sides, max, n); //Prints most frequent side stats
      typeRolled(
          sides, high, freq[0], n, "Highest"); //Prints highest side stats
      typeRolled(sides, low, freq[1], n, "Lowest"); //Prints lowest side stats
      ocd();
    }
  }
}

class DiceCalc extends UnivCalc {
  DiceCalc() {}

  //Easier result printing
  int res(int side, s, roll) {
    side++;
    print("Dice #$s rolled a ${roll + 1}");
    return side;
  }

  //Gets most frequent side
  int diceMax(List<int> dice) {
    int max = 0;
    dice.sort();
    max = dice[5];
    return max;
  }

  //Copies dice results
  void diceCopy(List<int> side, side2) {
    for (int i = 0; i < 6; i++) {
      side2[i] = side[i];
    }
  }

  //Gets highest side
  int diceHigh(List<int> side2, freq) {
    int high = 0;
    for (int i = 5; i > 0; i--) {
      if (side2[i] != 0) {
        high = i + 1;
        freq[0] = side2[i];
        break;
      }
    }
    return high;
  }

  //Gets lowest side
  int diceLow(List<int> side2, freq) {
    int low = 0;
    for (int i = 0; i < 6; i++) {
      if (side2[i] != 0) {
        low = i + 1;
        freq[1] = side2[i];
        break;
      }
    }
    return low;
  }

  //Prints most frequent side stats
  void mostRolled(List<int> dice, int max, n) {
    print("Most Rolled Side(s)");
    for (int i = 0; i < 6; i++) {
      if (max == dice[i]) {
        print(i + 1);
      }
    }
    print("Rolled $max times");
    double times = percCalc(max, n); //Calculates statistics
    print("Rolled $times% of the times");
    ocd();
  }

  //Prints extreme side stats
  void typeRolled(List<int> dice, int est, freq, n, String type) {
    print("$type Rolled Side:");
    print(est);
    double times = percCalc(freq, n); //Calculates statistics
    print("Rolled $freq times");
    print("Rolled $times% of the times");
    ocd();
  }
}

class ColorGen extends UnivCalc {
  //gens random color
  ColorGen() {
    print("COLOR GENERATOR");
    Color c = Color();
    c.ocd();
  }
}

class Color extends Calc {
  //Constructor
  Color() {
    int n = rand() % 5;
    if (n == 0) {
      print("No colors were generated");
      banana();
    } else {
      print("$n Colors were generated");
      for (int i = 0; i < n; i++) {
        int ser = i + 1;
        print("Color #$ser:");
        int r = rand() % 256;
        int g = rand() % 256;
        int b = rand() % 256;
        printAmount(r, g, b);
        printHex(r, g, b);
        printCMYK(r, g, b);
      }
    }
  }

  //Prints the RGB value
  void printAmount(int r, g, b) {
    print("RGB value: ($r, $g, $b)");
    print("R = $r");
    print("G = $g");
    print("B = $b");
    ocd();
  }

  //Prints the Hex value
  void printHex(int r, g, b) {
    //for red
    var rInd1 = number[hexDigit1(r)];
    var rInd2 = number[hexDigit2(r)];
    //for green
    var gInd1 = number[hexDigit1(g)];
    var gInd2 = number[hexDigit2(g)];
    //for blue
    var bInd1 = number[hexDigit1(b)];
    var bInd2 = number[hexDigit2(b)];

    print("Hex Code = #$rInd2$rInd1$gInd2$gInd1$bInd2$bInd1");
    print("R = $rInd2$rInd1");
    print("G = $gInd2$gInd1");
    print("B = $bInd2$bInd1");
    ocd();
  }

  //Prints the CMYK value
  void printCMYK(int r, g, b) {
    //Getting the percent value of each color
    int pr = colorPercent(r);
    int pg = colorPercent(g);
    int pb = colorPercent(b);
    int k = kValue(pr, pg, pb);
    int c = cmyValue(pr, k);
    int m = cmyValue(pg, k);
    int y = cmyValue(pb, k);

    print("CMYK value = ($c, $m, $y, $k)");
    print("C = $c%");
    print("M = $m%");
    print("Y = $y%");
    print("K = $k%");
    ocd();
  }
}

/* Sauces:
https://www.mamanatural.com/baby-names/girls/lists/fantasy-names-for-girls/
https://www.mamanatural.com/baby-names/boys/lists/fantasy-names-for-boys/
https://www.thoughtco.com/most-common-us-surnames-1422656
https://www.ssa.gov/oact/babynames/decades/century.html
https://blog.prepscholar.com/unique-cool-last-names
https://student-tutor.com/blog/200-iconic-fantasy-last-names-for-your-next-bestseller/
https://chartopia.d12dev.com/chart/8727/
https://parenting.firstcry.com/articles/40-cool-fantasy-and-sci-fi-baby-names-for-boys/
https://parenting.firstcry.com/articles/40-unique-sci-fi-and-fantasy-names-for-girl-babies/
https://hobbylark.com/writing/cool-last-names
*/

class NameGen {
  NameGen() {
    print("NAME GENERATOR");
    Generator gen = Generator(); //Starts generating names
    gen.ocd();
  }
}

class Generator extends NameCalc {
  //Main name generator
  Generator() {
    int n = Random().nextInt(10); //Number of names to be genned
    if (n == 0) {
      print("No names were generated");
      banana();
    } else {
      print("$n names were generated");
      for (int i = 0; i < n; i++) {
        int s = i + 1;
        int nameType = univRoll(5);
        nameRoll(nameType, s, types);
      }
      nameStats("Masculine", mas, n);
      nameStats("Feminine", fem, n);
      ocd();
      print("Where,");
      for (int i = 0; i < genre.length; i++) {
        if (genre[i] != 0) {
          nameStats(types[i], genre[i], n);
        }
      }
    }
  }
}

class NameCalc extends Keyword {
  NameCalc() {}

  void flipName(var a, b, c, int s, void func(int s, var a, b)) {
    int res = rand() % 2;
    if (res == 0) {
      func(s, a, c);
      print("Name Type: Masculine");
      mas++;
    } else {
      func(s, b, c);
      print("Name Type: Feminine");
      fem++;
    }
  }

  void nameRoll(int cases, s, List<String> types) {
    switch (cases) {
      case 0:
        {
          //Simple Name
          flipName(firstMaleNames, firstFemaleNames, lastNames, s, nameGen);
          print("Name Genre: ${types[cases]}");
          genre[cases]++;
          ocd();
        }
        break;
      case 1:
        {
          //Fant Name
          flipName(firstFantMaleNames, firstFantFemaleNames, fantLastNames, s,
              nameGen);
          print("Name Genre: ${types[cases]}");
          genre[cases]++;
          ocd();
        }
        break;
      case 2: //Cyber Name
        {
          flipName(firstCyberMaleNames, firstCyberFemaleNames, lastCyberNames,
              s, nameGen);
          print("Name Genre: ${types[cases]}");
          genre[cases]++;
          ocd();
        }
        break;
      case 3: //Scifi Name
        {
          flipName(
              firstSciMaleNames, firstSciFemaleNames, lastSciNames, s, nameGen);
          print("Name Genre: ${types[cases]}");
          ocd();
          genre[cases]++;
        }
        break;

      default: //Hybrid
        {
          var maleName = [
            firstMaleNames,
            firstFantMaleNames,
            firstCyberMaleNames,
            firstSciMaleNames
          ];
          var femaleName = [
            firstFemaleNames,
            firstFantFemaleNames,
            firstCyberFemaleNames,
            firstSciFemaleNames
          ];
          var lastName = [
            lastNames,
            fantLastNames,
            lastCyberNames,
            lastSciNames
          ];
          int hybridFirstMaleRoll = univRoll(4);
          int hybridFirstFemaleRoll = univRoll(4);
          int hybridLastRoll = univRoll(4);
          if (hybridLastRoll == hybridFirstMaleRoll ||
              hybridLastRoll == hybridFirstFemaleRoll) {
            hybridLastRoll = hybridLastRoll % 2;
          }
          flipName(
              maleName[hybridFirstMaleRoll],
              femaleName[hybridFirstFemaleRoll],
              lastName[hybridLastRoll],
              s,
              nameGen);
          print("Name Genre: Hybrid");
          genre[cases]++;
          ocd();
        }
    }
  }

  void nameGen(int ser, var firstName, lastName) {
    //Gets the name
    int fnIndex = rand() % 31;
    int lnIndex = rand() % 31;
    String name = firstName[fnIndex] + ' ' + lastName[lnIndex];
    print("Name number $ser: $name");
  }

  void nameStats(String type, int f, n) {
    double freq = percCalc(f, n);
    print("$type type of name was generated $freq% of the time");
  }
}

class Calc extends Keyword {
  //Constructor
  Calc() {}

  //Returns ones place in Hexadecimal
  int hexDigit1(int n) {
    return n % 16;
  }

  //Returns tens place in Hexadecimal
  int hexDigit2(int n) {
    int v = (n ~/ 16) % 16;
    return v;
  }

  //Conversion to suitable form
  int colorPercent(int c) {
    double val = (c / 255) * 100;
    int nc = val.toInt();
    return nc;
  }

  //Alt to MAX method
  int maxValue(int r, g, b) {
    int max;
    if (r > g) {
      if (r > b) {
        max = r;
      } else {
        max = b;
      }
    } else {
      if (g > b) {
        max = g;
      } else {
        max = b;
      }
    }
    return max;
  }

  //Returns K or Black Value
  int kValue(int r, g, b) {
    int m = maxValue(r, g, b);
    int k = 100 - m;
    return k;
  }

  //Returns C, M or Y or Cyan, Magenta or Yellow Value
  int cmyValue(int n, k) {
    double v = (((100 - n - k) / (100 - k))) * 100;
    int percent = v.toInt();
    return percent;
  }
}

class ChaosRussianRoulette {
  ChaosRussianRoulette() {
    print("RUSSIAN ROULETTE");
    Revolver r = Revolver();
    r.ocd();
  }
}

class Revolver extends GunCalc {
  Revolver() {
    var gun = [0, 0, 0, 0, 0, 0];
    loadGun(gun);
    shootGun(gun);
    if (lifeCheck == 0) {
      print("You lost...");
    } else {
      print("You won!");
    }
    checkGun(gun);
  }
}

class GunCalc extends UnivCalc {
  GunCalc() {}

  void loadGun(var list) {
    int bullets = univRoll(6);
    int dropped = 0;
    print("$bullets bullets were taken");
    for (int i = 1; i <= bullets; i++) {
      int slots = univRoll(6);
      if (list[slots] != 0) {
        dropped++;
      } else {
        list[slots]++;
      }
    }
    if (dropped != 0) {
      print("$dropped bullets were dropped");
    }
    print("${bullets - dropped} bullets were loaded");
    ocd();
  }

  void shootGun(var list) {
    int pull = univRoll(6);
    if (pull == 0) {
      print("No shots were fired");
    } else {
      print("There will be $pull shots fired");
      ocd();
      for (int i = 1; i <= pull; i++) {
        int slots = univRoll(6);
        print("Slot ${slots + 1} was fired");
        if (list[slots] != 0) {
          print("There was a bullet");
          lifeCheck = 0;
          break;
        } else {
          print("There wasnt any bullet");
        }
      }
    }
    ocd();
  }

  void checkGun(var list) {
    ocd();
    print("Bullets were in slot(s):");
    for (int i = 0; i < list.length; i++) {
      if (list[i] != 0) {
        print(i + 1);
      }
    }
  }
}

class CardGen {
  CardGen() {
    print("CARD DRAW");
    Deck d = Deck();
    d.ocd();
  }
}

class Deck extends CardCalc {
  Deck() {
    int n = univRoll(13); //Determines the number of cards to be drawn
    if (n == 0) {
      print("No cards was drawn");
      banana();
    } else {
      print("$n cards will be drawn");
      ocd();

      draw(n); //Draws the cards

      print("Among the cards drawn:");
      ocd();
      cardCount(); //Shows the most drawn suit
      cardStats(n); //Gives stats about the drawn cards
    }
  }
}

class CardCalc extends Keyword {
  CardCalc() {}

  //Draws cards
  void draw(int n) {
    for (int i = 0; i < n; i++) {
      int draw = univRoll(52);
      int ser = i + 1;
      hand[i] = draw;
      for (int j = i - 1; j >= 0; j--) {
        if (hand[i] == hand[j]) {
          draw = univRoll(52);
          hand[i] = draw;
        }
      }
      print("Card #$ser: ${cards[draw]}");
      suitsCounter(draw); //Keeps track of suits
    }
    ocd();
  }

  void suitsCounter(int draw) {
    if (draw <= 12) {
      suits[0]++;
    } else if (draw <= 25) {
      suits[1]++;
    } else if (draw <= 38) {
      suits[2]++;
    } else {
      suits[3]++;
    }

    //For face cards
    if ((draw >= 0 && draw <= 3) ||
        (draw >= 13 && draw <= 16) ||
        (draw >= 26 && draw <= 29) ||
        (draw >= 39 && draw <= 42)) {
      suits[4]++;
    }
  }

  void cardCount() {
    var sort = [0, 0, 0, 0];
    for (int i = 0; i < 4; i++) {
      sort[i] = suits[i];
    }
    sort.sort();
    if (sort[3] == sort[0]) {
      print("All suits were drawn equally");
    } else {
      print("Most drawn suit(s):");
      for (int i = 0; i < 4; i++) {
        if (sort[3] == suits[i]) {
          print(suitsName[i]);
        }
      }
    }
    ocd();
  }

  //Statistics of the drawn cards
  void cardStats(int n) {
    for (int i = 0; i < 4; i++) {
      if (suits[i] != 0) {
        print("${suitsName[i]} was drawn ${suits[i]} times");
        double percHand = percCalc(suits[i], n);
        print("Which comprises $percHand% of cards drawn");
        double percSuits = percCalc(suits[i], 13);
        print("$percSuits% of cards the suit");
        double percDeck = percCalc(suits[i], 52);
        print("$percDeck% of cards in deck");
        ocd();
      }
    }
    if (suits[4] != 0) {
      print("Number of Face Cards: ${suits[4]}");
      double percHand = percCalc(suits[4], n);
      print("Which comprises $percHand% of cards drawn");
      double percFace = percCalc(suits[4], 12);
      print("$percFace% of Face Cards");
      double percDeck = percCalc(suits[4], 52);
      print("$percDeck% of cards in deck");
      ocd();
    }
  }
}

class Keyword extends UnivCalc {
  //Mapping for Hexadecimal conversion
  var number = {
    0: '0',
    1: '1',
    2: '2',
    3: '3',
    4: '4',
    5: '5',
    6: '6',
    7: '7',
    8: '8',
    9: '9',
    10: 'A',
    11: 'B',
    12: 'C',
    13: 'D',
    14: 'E',
    15: 'F'
  };

  List<String> types = ['Regular', 'Fantasy', 'Cyberpunk', 'Sci-Fi', 'Hybrid'];

  var firstMaleNames = [
    'Daniel',
    'James',
    'Robert',
    'John',
    'Michael',
    'David',
    'William',
    'Richard',
    'Joseph',
    'Thomas',
    'Christopher',
    'Charles',
    'Matthew',
    'Anthony',
    'Mark',
    'Donald',
    'Steven',
    'Andrew',
    'Paul',
    'Joshua',
    'Kenneth',
    'Kevin',
    'Brian',
    'George',
    'Timothy',
    'Ronald',
    'Jason',
    'Edward',
    'Jeffrey',
    'Ryan',
    'Jacob'
  ];
  var firstFemaleNames = [
    'Lisa',
    'Karen',
    'Sarah',
    'Jessica',
    'Susan',
    'Barbara',
    'Elizabeth',
    'Linda',
    'Jennifer',
    'Patricia',
    'Mary',
    'Nancy',
    'Betty',
    'Sandra',
    'Margaret',
    'Ashley',
    'Kimberly',
    'Emily',
    'Donna',
    'Michelle',
    'Carol',
    'Amanda',
    'Melissa',
    'Deborah',
    'Stephanie',
    'Dorothy',
    'Rebecca',
    'Sharon',
    'Laura',
    'Cynthia',
    'Amy'
  ];
  var lastNames = [
    'Smith',
    'Johnson',
    'Williams',
    'Brown',
    'Jones',
    'Garcia',
    'Miller',
    'Davis',
    'Rodriguez',
    'Martinez',
    'Hernandez',
    'Lopez',
    'Gonzales',
    'Wilson',
    'Anderson',
    'Thomas',
    'Taylor',
    'Moore',
    'Jackson',
    'Martin',
    'Lee',
    'Perez',
    'Thompson',
    'White',
    'Harris',
    'Sanchez',
    'Clark',
    'Ramirez',
    'Lewis',
    'Robinson',
    'Walker'
  ];

  var firstFantMaleNames = [
    'Ajax',
    'Ajaz',
    'Alexavier',
    'Baratheon',
    'Bastian',
    'Calbex',
    'Dexy',
    'Dracon',
    'Draco',
    'Eddard',
    'Elex',
    'Fairfax',
    'Galaxy',
    'Hale',
    'Jaxith',
    'Jedi',
    'Kace',
    'Kendrix',
    'Kiasax',
    'Leax',
    'Mannix',
    'Alexios',
    'Alix',
    'Baxley',
    'Bazz',
    'Benjen',
    'Calix',
    'Dryden',
    'Dunixi',
    'Elex',
    'Elvin'
  ];

  var firstFantFemaleNames = [
    'Aeress',
    'Aerilyn',
    'Aerith',
    'Blossom',
    'Blythe',
    'Caerlion',
    'Dauphine',
    'Delilah',
    'Dex',
    'Echo',
    'Elaxi',
    'Fae',
    'Glinda',
    'Golda',
    'Guinevere',
    'Hermione',
    'Imagica',
    'Jinx',
    'Kassandre',
    'Katniss',
    'Leatrix',
    'Aerona',
    'Aeronwen',
    'Caerwyn',
    'Calandra',
    'Calixte',
    'Domino',
    'Dream',
    'Electra',
    'Faeryn',
    'Felixa'
  ];

  var fantLastNames = [
    'Abednego',
    'Cyprus',
    'Dagon',
    'Damaris',
    'Einar',
    'Festus',
    'Gallio',
    'Griffin',
    'Kami',
    'Lightfoot',
    'Luna',
    'Priestley',
    'Sierra',
    'Atwater',
    'Agassi',
    'Dobermann',
    'Akagawa',
    'Humblecut',
    'Marblemaw',
    'Desai',
    'Darby',
    'Draper',
    'Sacredmore',
    'Truthbelly',
    'Monsterbelly',
    'Boneflare',
    'Whesker',
    'Wong',
    'Shadegrove',
    'Hazerider',
    'Rapidclaw'
  ];

  var firstCyberFemaleNames = [
    'Toni',
    'Simula',
    'Akiko',
    'Parity',
    'Gerty',
    'Shaylea',
    'Kalle',
    'Star',
    'Ayvee',
    'Chang',
    'Alexa',
    'Adi',
    'Lexie',
    'Angel',
    'Ning',
    'Sprite',
    'Anna',
    'Io',
    'Lunar',
    'Alita',
    'Asta',
    'Pipa',
    'Pixel',
    'Link',
    'Amiga',
    'Meta',
    'Organia',
    'Chyu',
    'Tiff',
    'Gai',
    'Jeri'
  ];

  var firstCyberMaleNames = {
    0: 'Niko',
    1: 'Dare',
    2: 'Grid',
    3: 'Brick',
    4: 'Catch',
    5: 'Mox',
    6: 'Dozer',
    7: 'Ghost',
    8: 'Chen',
    9: 'Juan',
    10: 'Wallace',
    11: 'William',
    12: 'Brad',
    13: 'Tom',
    14: 'Blaze',
    15: 'Crispin',
    16: 'Cyrano',
    17: 'Derry',
    18: 'Cael',
    19: 'Devin',
    20: 'Edvin',
    21: 'Ezra',
    22: 'Harlen',
    23: 'Isaiah',
    24: 'Klavan',
    25: 'Loki',
    26: 'Idris',
    27: 'Jace',
    28: 'Kian',
    29: 'Lucius',
    30: 'Milo'
  };

  var lastCyberNames = {
    0: 'Diseth',
    1: 'Avison',
    2: 'Sonoda',
    3: 'Dilucca',
    4: 'Rocheford',
    5: 'Sabine',
    6: 'Cayne',
    7: 'Esperon',
    8: 'Cedeno',
    9: 'Forgrave',
    10: 'Basset',
    11: 'Belmont',
    12: 'Lockley',
    13: 'Blackford',
    14: 'Flanigan',
    15: 'Kendrick',
    16: 'Lane',
    17: 'Dial',
    18: 'Khalifa',
    19: 'Black',
    20: 'Ashley',
    21: 'Kenner',
    22: 'Blue',
    23: 'Sims',
    24: 'Kent',
    25: 'Dkymm',
    26: 'Gunner',
    27: 'Fox',
    28: 'Carter',
    29: 'Silver',
    30: 'Rhoades'
  };

  var firstSciFemaleNames = {
    0: 'Adora',
    1: 'Althea',
    2: 'Alia',
    3: 'Alura',
    4: 'Zyla',
    5: 'Zephyra',
    6: 'Zorina',
    7: 'Zoraida',
    8: 'Xaviera',
    9: 'Winter',
    10: 'Victorine',
    11: 'Valyria',
    12: 'Ursula',
    13: 'Tallulah',
    14: 'Theodora',
    15: 'Theia',
    16: 'Sylvia',
    17: 'Sarah',
    18: 'Seren',
    19: 'Seraphine',
    20: 'Sylviana',
    21: 'Sorcha',
    22: 'Octavia',
    23: 'Nyx',
    24: 'Panthea',
    25: 'Marina',
    26: 'Leta',
    27: 'Luna',
    28: 'Laelia',
    29: 'Iris',
    30: 'Galatea'
  };

  var firstSciMaleNames = {
    0: 'Albus',
    1: 'Artemis',
    2: 'Caspian',
    3: 'Deckard',
    4: 'Emmett',
    5: 'Garrick',
    6: 'H.G.',
    7: 'Harold',
    8: 'Jareth',
    9: 'Kirk',
    10: 'Lando',
    11: 'Max',
    12: 'Montgomery',
    13: 'Mulder',
    14: 'Odo',
    15: 'Aslan',
    16: 'Clyde',
    17: 'Anakin',
    18: 'Ari',
    19: 'Daario',
    20: 'Heil',
    21: 'Klaus',
    22: 'Kylo',
    23: 'Luke',
    24: 'Neo',
    25: 'Casper',
    26: 'Elliot',
    27: 'Innis',
    28: 'Nico',
    29: 'Burton',
    30: 'Sisko'
  };

  var lastSciNames = {
    0: 'Alastair',
    1: 'Aphelion',
    2: 'Callisto',
    3: 'Chrysalis ',
    4: 'Furi ',
    5: 'Gibbethon ',
    6: 'Nadir ',
    7: 'Gregorios ',
    8: 'Omega',
    9: 'Sapphirus ',
    10: 'Silvius ',
    11: 'Umbra ',
    12: 'Zibia ',
    13: 'Hovland',
    14: 'Trench',
    15: 'Ermine',
    16: 'Winters',
    17: 'Faddis',
    18: 'Lomax',
    19: 'Mantooth',
    20: 'Huxley',
    21: 'Bozzelli',
    22: 'Mintz',
    23: 'Kipps',
    24: 'Cabada',
    25: 'Otto',
    26: 'Blixt',
    27: 'Pittman',
    28: 'Bisley',
    29: 'Carlisle',
    30: 'Arrington'
  };

  var cards = [
    'Ace of Spades',
    'King of Spades',
    'Queen of Spades',
    'Jack of Spades',
    '10 of Spades',
    '9 of Spades',
    '8 of Spades',
    '7 of Spades',
    '6 of Spades',
    '5 of Spades',
    '4 of Spades',
    '3 of Spades',
    '2 of Spades',
    'Ace of Hearts',
    'King of Hearts',
    'Queen of Hearts',
    'Jack of Hearts',
    '10 of Hearts',
    '9 of Hearts',
    '8 of Hearts',
    '7 of Hearts',
    '6 of Hearts',
    '5 of Hearts',
    '4 of Hearts',
    '3 of Hearts',
    '2 of Hearts',
    'Ace of Clubs',
    'King of Clubs',
    'Queen of Clubs',
    'Jack of Clubs',
    '10 of Clubs',
    '9 of Clubs',
    '8 of Clubs',
    '7 of Clubs',
    '6 of Clubs',
    '5 of Clubs',
    '4 of Clubs',
    '3 of Clubs',
    '2 of Clubs',
    'Ace of Diamond',
    'King of Diamond',
    'Queen of Diamond',
    'Jack of Diamond',
    '10 of Diamond',
    '9 of Diamond',
    '8 of Diamond',
    '7 of Diamond',
    '6 of Diamond',
    '5 of Diamond',
    '4 of Diamond',
    '3 of Diamond',
    '2 of Diamond'
  ];

  //Contructor
  Keyword() {}
}

class UnivCalc {
  int heads = 0, tails = 0;

  int mas = 0, fem = 0;
  List<int> genre = [0, 0, 0, 0, 0];

  int lifeCheck = 1;

  var hand = [60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60];
  var suits = [0, 0, 0, 0, 0],
      suitsName = ['Spades', 'Hearts', 'Clubs', 'Diamonds'];

  UnivCalc() {}

  void banana() {
    int banana = rand() + 1;
    ocd();
    print("Instead you got $banana bananas!");
  }

  void flip(int loc, n, void func(String a, int s),
      [String? a, b, int? s, List<int>? gun]) {
    switch (loc) {
      case 0: //coin
        {
          a = "Heads";
          b = "Tails";
          for (int i = 0; i < n; i++) {
            s = i + 1;
            int res = rand() % 2;
            if (res == 0) {
              func(a, s);
              heads++;
            } else {
              func(b, s);
              tails++;
            }
          }
        }
        break;
      case 1: //dice
        {
          //Not much to do I think
        }
        break;
      case 2: //color
        {}
        break;
      case 3: //roulette
        {}
        break;
      case 4: //name generator
        {}
        break;
      case 5: //deck of cards
        {}
        break;
      case 6: //Gacha
        {}
        break;
      default:
        {
          print("placeholder");
        }
    }
  }

  int univRoll(int n) {
    int cases = rand() % n;
    return cases;
  }

  //Calculates % stats
  double percCalc(int f, n) {
    double percFace = (f / n) * 100;
    double percRound = double.parse(percFace.toStringAsFixed(2));
    return percRound;
  }

  //Returns a random number
  int rand() {
    int value = Random().nextInt(6969);
    return value;
  }

  //Returns a random number between 10; Used for determining loop numbers
  int gen() {
    int value = Random().nextInt(10);
    return value;
  }

  void ocd() {
    print("");
  }
}
