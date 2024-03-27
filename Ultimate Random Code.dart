/* 
 * @author Kashikizu
 * Concept date: 23/03/2024 (dd/mm/yyyy)
 * File Creation Date: 27/03/2024
 * Update Date: 28/03/2024 - Fixed Dice Code, Removed Roulette Code, Added future cases in UnivCalc
 * Initial Completion Date: ??/??/2024
 */

import 'dart:math';

void main() {
  UnivCalc start = UnivCalc();
  int roll = start.rand() % 3;
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
    double perc = 0;
    if (h == t) {
      if (h == 0) {
        print("No coins were flipped");
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

  void univRoll(int n) {}

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
