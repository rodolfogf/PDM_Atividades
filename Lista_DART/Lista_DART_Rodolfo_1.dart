import 'dart:io';
import 'dart:math';

//Exercício 1
main() {
  print("Entre o valor de x do ponto 1: ");
  double p1x = stdin.readLineSync()! as double;
  print("Entre o valor de y do ponto 1: ");
  double p1y = stdin.readLineSync()! as double;
  print("Entre o valor de x do ponto 2: ");
  double p2x = stdin.readLineSync()! as double;
  print("Entre o valor de y do ponto 2: ");
  double p2y = stdin.readLineSync()! as double;

  double dist = sqrt(pow(p2x - p1x, 2) + pow(p2y - p1y, 2));
  print("A distância entre os pontos é $dist");
}
