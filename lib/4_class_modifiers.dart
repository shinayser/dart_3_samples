//Documentação: https://dart.dev/language/class-modifiers
class Vehicle {
  late String make, model;

  Vehicle({
    required this.make,
    required this.model,
  });

  void moveForward(int meters) {}
}

// Extendendo
class Car extends Vehicle {
  int passengers;

  Car({
    required super.make,
    required super.model,
    required this.passengers,
  });
}

// Implementando
class MockVehicle implements Vehicle {
  @override
  void moveForward(int meters) {}

  @override
  String make = '';

  @override
  String model = '';
}

// -----------------------------------------------------------------------------
sealed class Funcionario {
  final String nome;
  final int cpf;
  final double salario;

  Funcionario({
    required this.nome,
    required this.cpf,
    required this.salario,
  });

  double calculaSalario();
}

class Estagiario extends Funcionario {
  Estagiario({
    required super.nome,
    required super.cpf,
    required super.salario,
  });

  @override
  double calculaSalario() {
    return salario;
  }
}

class CLT extends Funcionario {
  CLT({
    required super.nome,
    required super.cpf,
    required super.salario,
  });

  // Base de cálculo	Alíquota	Parcela a deduzir do IR
  // De R$ 2.112,01 até R$ 2.826,65	7,5%	R$ 158,40
  // De R$ 2.826,66 até R$ 3.751,05	15%	R$ 370,40
  // De R$ 3.751,06 até R$ 4.664,68	22,5%	R$ 651,73
  // Acima de R$ 4.664,68	27,5%	R$ 884,96
  @override
  double calculaSalario() {
    return switch (salario) {
      < 2112.01 => salario,
      > 2112.01 && < 2826.65 => salario * 0.925,
      > 2826.66 && < 3751.05 => salario * 0.85,
      > 3751.06 && < 4664.68 => salario * 0.775,
      _ => salario * 0.725,
    };
  }
}
