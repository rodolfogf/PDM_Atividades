import 'dart:io';

main() {
  print("Informe a nota 1");
  var n1 = double.tryParse(stdin.readLineSync() ?? "");
  print("Informe a nota 2");
  var n2 = double.tryParse(stdin.readLineSync() ?? "");
  print("Informe a nota 3");
  var n3 = double.tryParse(stdin.readLineSync() ?? "");

  double media_pond = (n1! * 2 + n2! * 3 + n3! * 5) / 10;

  print("A média do aluno é: $media_pond");
}
