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
      case Retangulo(base: var base, altura: var altura):
        print('A área do retângulo é ${base * altura}');
        break;
      case Quadrado(base: var base):
        print('A área do quadrado é ${base * base}');
        break;
    }
  }

  objectos();
  validarJson() {
    final remoteConfig = {
      'name': 'enable_cpf_screen',
      'value': true,
      'data': {
        'date': '10/10/2023',
      }
    };

    if (remoteConfig
        case {
          'name': String name,
          'value': bool value,
          'data': {'date': String date}
        }) {
      print('É o $name com value $value e a data é $date');
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
