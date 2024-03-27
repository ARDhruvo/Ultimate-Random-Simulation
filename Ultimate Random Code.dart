/* 
 * @author Kashikizu
 * Concept date: 23/03/2024 (dd/mm/yyyy)
 * File Creation Date: 27/03/2024
 * Initial Completion Date: ??/??/2024
 */

import 'dart:math';

void main() {
  UnivCalc start = UnivCalc();
  int roll = start.rand() % 4;
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
        /*
  ChaoticRussianRoulette crr = ChaoticRussianRoulette();
  crr;
  */
        print("Not available for now");
      }
      break;
    case 3:
      {
        ColorGen cg = ColorGen();
        cg;
      }
  }
}

class CoinFlip {
  //flips coin
  CoinFlip() {
    Coin c = Coin();
    c.ocd();
  }
}

class Coin extends CoinCalc {
  //int heads = 0, tails = 0; //Counter variables for stats
  //Coin flip
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
    if (h == t) {
      if (h == 0) {
        print("No coins were flipped");
      } else {
        print("Both faces were flipped 50% of the time");
      }
    } else if (h > t) {
      percCalc(h, f, "Heads");
    } else {
      percCalc(t, f, "Tails");
    }
  }

  //Calculating statistics
  void percCalc(int face, flips, String faceName) {
    double percFace = (face / flips) * 100;
    double percRound = double.parse(percFace.toStringAsFixed(2));
    print("Most flipped side is $faceName");
    print("$faceName was flipped $face times");
    print("$faceName was flipped $percRound% of the time");
  }
}

//Dice has problem with 6
class Dice {
  //Rolls dices
  Dice() {
    Roll d = Roll();
    d.ocd();
  }
}

//The dice that is rolled
class Roll extends DiceRoll {
  //Main method for rolling the dice
  Roll() {
    int rolls = gen();
    print("Number of dices rolled: $rolls");
    roll(rolls);
  }
}

class DiceRoll extends DiceCalc {
  DiceRoll() {}

  //Rolls the random amount of die
  void roll(int n) {
    //Counter for further calculations
    List<int> sides = [0, 0, 0, 0, 0, 0];

    for (int i = 0; i < n; i++) {
      //Tracks dice roll number
      int ser = i + 1;
      int rolled = rand() % 6;
      //Determines the result
      switch (rolled) {
        case 0:
          {
            sides[0]++;
            print("Dice #$ser rolled a 1");
          }
          break;
        case 1:
          {
            sides[1]++;
            print("Dice #$ser rolled a 2");
          }
          break;
        case 2:
          {
            sides[2]++;
            print("Dice #$ser rolled a 3");
          }
          break;
        case 3:
          {
            sides[3]++;
            print("Dice #$ser rolled a 4");
          }
          break;
        case 4:
          {
            sides[4]++;
            print("Dice #$ser rolled a 5");
          }
          break;
        case 5:
          {
            sides[5];
            print("Dice #$ser rolled a 6");
          }
        default:
          {
            print("");
          }
          break;
      }
    }
    ocd();
    //Finding the statistics of the results
    mostRolled(sides, n);
    highestRolled(sides, n);
    lowestRolled(sides, n);
  }
}

class DiceCalc extends UnivCalc {
  DiceCalc() {}

  //For finding the most rolled
  void mostRolled(List<int> sides, int n) {
    if (n == 0) {
      print("No dice was rolled");
    } else {
      print("Most rolled side(s): ");
      int mostFreq = sides.reduce(max);
      if (mostFreq == 1) {
        print("All sides were rolled equal number of times");
      } else {
        for (int i = 0; i < 6; i++) {
          if (mostFreq == sides[i]) {
            print(i + 1);
          }
        }
        double percSide = statCalc(mostFreq, n);
        print("Rolled $percSide% of the times");
      }
    }
    ocd();
  }

  //For finding the highest rolled
  void highestRolled(List<int> sides, int n) {
    if (n == 0) {
      return;
    } else {
      print("Highest rolled side: ");
      int highestFreq = 0;
      for (int i = 5; i > 0; i--) {
        if (sides[i] != 0) {
          highestFreq = i + 1;
          break;
        }
      }
      print(highestFreq);
      int iteration = sides[highestFreq - 1];
      double percSide = statCalc(iteration, n);
      print("Rolled $percSide% of the times");
    }
    ocd();
  }

  //For finding the lowest rolled
  void lowestRolled(List<int> sides, int n) {
    if (n == 0) {
      return;
    } else {
      print("Lowest rolled side: ");
      int lowestFreq = 0;
      for (int i = 0; i < 6; i++) {
        if (sides[i] != 0) {
          lowestFreq = i + 1;
          break;
        }
      }
      print(lowestFreq);
      int iteration = sides[lowestFreq - 1];
      double percSide = statCalc(iteration, n);
      print("Rolled $percSide% of the times");
    }
    ocd();
  }

  //Stat calculator
  double statCalc(int outcome, total) {
    double perc = (outcome / total) * 100;
    double percRound = double.parse(perc.toStringAsFixed(2));
    return percRound;
  }
}

class ColorGen extends UnivCalc {
  //gens random color
  ColorGen() {
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

  //Contructor
  Keyword() {}
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

//Roulette is broken, fix later
/*
class ChaoticRussianRoulette {
  //Starts the game
  ChaoticRussianRoulette() {
    RussianRoulette fire = RussianRoulette();
    fire.ocd();
  }
}


class RussianRoulette extends Game {
  RussianRoulette() {
    //Determines a random slot
    int bullet = rand() % 6, lifeCheck = 1;
    print("Gun was loaded");
    ocd();
    //Inserts the bullet in a random slot
    slots[bullet] = 1;
    //Main Game
    lifeCheck = shoot(slots, lifeCheck);
    //Gives a realistic slot value instead of list index
    bullet++;
    print("Bullet was in slot number $bullet");
    if (lifeCheck == 1) {
      print("You made it out alive");
    } else {
      print("You lost");
    }
  }
}

class Game extends Revolver {
  Game() {}

  //Main Game
  int shoot(List<int> gun, int lifeCheck) {
    //Determines a random number of shots that will be taken
    int attempt = rand();
    if (attempt == 0) {
      print("You were not brave enough to shoot");
      ocd();
    } else {
      print("Gun was decided to be fired ${attempt + 1} times");
      ocd();
      //Checks the shot
      flip(3, attempt, result);
      for (int i = 0; i <= attempt; i++) {
        int slot = i + 1;
        print("Shot #$slot fired...");
        if (gun[i] == 1) {
          print("It had the bullet. Better luck next time!");
          lifeCheck = 0;
          ocd();
          break;
        } else {
          print("It was empty");
          ocd();
        }
      }
    }
    return lifeCheck;
  }

  void result(String a, int s) {
    print("Shot #$s fired...");
    print(a);
  }
}

class Revolver extends UnivCalc {
  //Gun
  List<int> slots = [0, 0, 0, 0, 0, 0];

  Revolver() {}
}
*/

class UnivCalc {
  int heads = 0, tails = 0;

  int lifeCheck = 1;
  UnivCalc() {}

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
          break;
        }
      case 1: //dice
        {
          break;
          //Not much to do I think
        }
      case 2: //color
        {
          break;
        }
      case 3: //roulette
        {
          /*for (int i = 0; i <= n; i++) {
            s = i + 1;
            a = "It had the bullet. Better luck next time!";
            b = "It was empty";
            if (gun?[i] == 1) {
              //print();
              func(a, s);
              lifeCheck = 0;
              ocd();
              break;
            } else {
              //print();
              ocd();
            }
          }*/
          break;
        }
      default:
        {
          print("placeholder");
        }
    }
  }

  void univRoll(int n) {}

  int rand() {
    int value = Random().nextInt(6969);
    return value;
  }

  void ocd() {
    print("");
  }

  int gen() {
    int value = Random().nextInt(10);
    return value;
  }
}
