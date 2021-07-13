import 'dart:io';
import 'dart:math';

//Exercício 2
main() {
  print("Entre o valor A: ");
  double a = stdin.readLineSync()! as double;
  print("Entre o valor B: ");
  double b = stdin.readLineSync()! as double;
  print("Entre o valor C: ");
  double c = stdin.readLineSync()! as double;

  num r = pow(a + b, 2);
  num s = pow(b + c, 2);
  num d = (r + s) / 2;

  print("O valor de D para D=(R+S)/2 é igual a: $d");
}
