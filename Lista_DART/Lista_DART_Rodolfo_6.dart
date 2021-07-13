import 'dart:io';

main() {
  print("Informe o tempo de duração em segundos: ");
  var soma_segundos = int.tryParse(stdin.readLineSync()!);
  int horas = 0;
  int minutos = 0;
  int segundos = 0;

  if (soma_segundos! >= 60) {
    if (soma_segundos >= 3600) {
      horas = (soma_segundos / 3600).truncate();
      minutos = ((soma_segundos.toInt() - horas * 3600) / 60).truncate();
      segundos = soma_segundos - horas * 3600 - minutos * 60;
    } else {
      minutos = (soma_segundos / 60).truncate();
      segundos = soma_segundos - minutos * 60;
    }
  } else {
    segundos = soma_segundos;
  }

  print("\n$horas hora(s), $minutos minuto(s) e $segundos segundo(s)");
}
