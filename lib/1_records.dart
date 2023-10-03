// Documentação completa: https://dart.dev/language/records
// Sem Records -----------------------------------------------------------
class LatLong {
  double lat;
  double long;

  LatLong(this.lat, this.long);
}

LatLong getLatLongDoJeitoAntigo() {
  return LatLong(1.0, 2.0);
}

// Com Records ----------------------------------------------------------
(double, double) getLatLongComRecordsA() {
  return (1.0, 2.0);
}

({double lat, double long}) getLatLongComRecordsB() {
  return (lat: 1.0, long: 2.0);
}

// Records já vem com uma implementação padrão de equals e hashcode
void main() {
  print(getLatLongComRecordsA() == getLatLongComRecordsB());
}
