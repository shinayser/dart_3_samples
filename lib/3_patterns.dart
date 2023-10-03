//Todos os tipos de Patterns podem ser vistos em https://dart.dev/language/pattern-types

void main() {
  logical_or_com_novo_switch() {
    Color color = Color.black;
    bool isDarkModeEnabled = true;

    bool isPrimary = switch (color) {
      Color.red || Color.yellow || Color.blue => true,
      Color.black when isDarkModeEnabled => true,
      _ => false
    };

    print('isPrimary: $isPrimary');
  }

  relacional_com_novo_switch() {
    final idade = 18;

    final label = switch (idade) {
      < 10 => 'criança',
      > 10 && < 30 => 'adolescente',
      > 30 && < 64 => 'adulto',
      _ => 'idoso'
    };

    print('É $label');
  }

  listas() {
    List<dynamic> lista = [1, 2, 3];

    switch (lista) {
      case [int a, bool b]:
        print('Tem dois elementos: a: $a, b: $b');
        break;
      case [int a, int b]:
        print('Tem dois elementos: a: $a, b: $b');
        break;
      case [var a, var b, var c]:
        print('Tem três elementos: a: $a, b: $b, c: $c');
        break;
    }
  }

  objectos() {
    dynamic figura = Retangulo(2, 3);

    switch (figura) {
      case Retangulo(:double base, :double altura):
        print('A área do retângulo é ${base * altura}');
        break;
      case Quadrado(:final base):
        print('A área do quadrado é ${base * base}');
        break;
    }
  }

  forLoopsMap() {
    Map<String, int> hist = {
      'Daniel': 1,
      'Gracy': 2,
      'Gabriel': 3,
      'Gustavo': 4,
      'Beraldo': 5,
    };

    for (var MapEntry(:key, :value) in hist.entries) {
      print('$key occurred $value times');
    }
  }

  forLoopsSet() {
    Set<String> nomes = {
      'Daniel',
      'Gracy',
      'Gabriel',
      'Gustavo',
      'Beraldo',
    };

    for (var nome in nomes) {
      print(nome);
    }

    // Set<(String, int)> nomes = {
    //   ('Daniel', 1),
    //   ('Gracy', 2),
    //   ('Gabriel', 3),
    //   ('Gustavo', 4),
    //   ('Beraldo', 5),
    // };
    //
    // for (var (nome, valor) in nomes) {
    //   print('$nome com valor $valor');
    // }
  }

  validarJson() {
    final remoteConfig = {
      'name': 'enable_cpf_screen',
      'value': true,
      'data': {
        'company': 'ifood',
      }
    };

    if (remoteConfig
        case {
          'name': String name,
          'value': bool value,
          'data': {'company': String company}
        }) {
      print('É o $name com value $value e a company é $company');
    } else {
      print('Não deu match no formato');
    }
  }
}

enum Color { red, yellow, blue, black, white }

class Quadrado {
  final double base;

  Quadrado(this.base);
}

class Retangulo extends Quadrado {
  final double altura;

  Retangulo(super.base, this.altura);
}
