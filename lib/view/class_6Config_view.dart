import 'package:flutter/material.dart';

class ConfigView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Configurações",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Volta para a tela anterior
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Configurar Alertas
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Configurar Alertas para Jogos ou Eventos Esportivos"),
            onTap: () {
              // Placeholder para ação futura
            },
          ),
          Divider(),

          // Alternar Tema Claro/Escuro
          ListTile(
            leading: Icon(Icons.brightness_6),
            title: Text("Alternar entre Tema Claro e Escuro"),
            onTap: () {
              // Placeholder para ação futura
            },
          ),
          Divider(),

          // Personalizar Cores do App
          ListTile(
            leading: Icon(Icons.color_lens),
            title: Text("Personalizar Cores do App"),
            onTap: () {
              // Placeholder para ação futura
            },
          ),
          Divider(),

          // Gerenciar Permissões
          ListTile(
            leading: Icon(Icons.security),
            title: Text("Gerenciar Permissões"),
            onTap: () {
              // Placeholder para ação futura
            },
          ),
          Divider(),

          // Alterar Idioma do App
          ListTile(
            leading: Icon(Icons.language),
            title: Text("Alterar Idioma do App"),
            onTap: () {
              // Placeholder para ação futura
            },
          ),
          Divider(),

          // Redefinir Configurações para o Padrão
          ListTile(
            leading: Icon(Icons.restore),
            title: Text("Redefinir Configurações para o Padrão"),
            onTap: () {
              // Placeholder para ação futura
            },
          ),
          Divider(),

          // Limpar Cache
          ListTile(
            leading: Icon(Icons.cleaning_services),
            title: Text("Limpar Cache"),
            onTap: () {
              // Placeholder para ação futura
            },
          ),
          Divider(),

          // Versão do App
          ListTile(
            leading: Icon(Icons.info),
            title: Text("Versão do App"),
            subtitle: Text("1.0.0"), // Exibe a versão do app
            onTap: () {
              // Placeholder para ação futura
            },
          ),
          Divider(),

          // Termos de Uso
          ListTile(
            leading: Icon(Icons.description),
            title: Text("Termos de Uso"),
            onTap: () {
              // Placeholder para ação futura
            },
          ),
          Divider(),

          // Política de Privacidade
          ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text("Política de Privacidade"),
            onTap: () {
              // Placeholder para ação futura
            },
          ),
          Divider(),

          // Suporte/Contato
          ListTile(
            leading: Icon(Icons.contact_support),
            title: Text("Suporte/Contato"),
            onTap: () {
              // Placeholder para ação futura
            },
          ),
          Divider(),

          // Excluir Conta
          ListTile(
            leading: Icon(Icons.delete_forever),
            title: Text("Excluir Conta"),
            onTap: () {
              // Placeholder para ação futura
            },
          ),
        ],
      ),
    );
  }
}
