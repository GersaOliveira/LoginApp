import 'package:flutter/material.dart';

class TelaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Obrigado :)'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Gostaria de expressar meu entusiasmo e sincero interesse em integrar '
                'a equipe como desenvolvedor Flutter. Durante minha trajetória profissional, '
                'desenvolvi uma paixão pelo desenvolvimento mobile, e acredito que minha dedicação e '
                'habilidades podem contribuir significativamente para os objetivos da empresa.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
              // Outros estilos conforme necessário
            ),
          ),
        ),
      ),
    );
  }
}
