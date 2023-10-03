// Documentação completa: https://dart.dev/language/records
// Sem Records -----------------------------------------------------------
class LatLong {
  double lat;
  double long;

  LatLong(this.lat, this.long);

  bool get isEnabled => true;
}

LatLong getLatLongDoJeitoAntigo() {
  return LatLong(1.0, 2.0);
}

(double, double) getLatLongComRecords() {
  return (1.0, 2.0);
}

void main() {
  records() {
    //Desestruturar records é mais fácil
    final (lat, long) = getLatLongComRecords();
    print('lat: $lat, long: $long');
  }

  objetos() {
    //Mas da pra destruturar classes também!
    final LatLong(:lat, long: longitude) = getLatLongDoJeitoAntigo();
    print('lat: $lat, long: $longitude');
  }

  listas() {
    //Também da pra destruturar listas
    final lista = [1, 2, 3, 4, 5];
    final [primeiro, segundo] = lista;
    print('primeiro: $primeiro, segundo: $segundo');
  }

  maps() {
    //E maps
    Map<String, dynamic> json = {
      'nome': 'Daniel',
      'cpf': 123456789,
    };

    final {
      'nome': nome,
      'cpf': cpf as int,
    } = json;

    print('É o $nome com cpf $cpf');
  }
}
