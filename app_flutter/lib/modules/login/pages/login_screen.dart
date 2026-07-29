import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool get _formValido =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _entrar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Bem-vindo, ${_emailController.text}!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            const Icon(Icons.lock_outline, size: 80, color: Colors.teal),
            const SizedBox(height: 24),
            Text(
              'Acesse sua conta',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 32),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'E-mail',
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(),
              ),
              onChanged: (_) => setState(() {}),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: _passwordController,

              obscureText: _obscurePassword,

              decoration: InputDecoration(
                labelText: 'Senha',

                prefixIcon: const Icon(Icons.lock_outline),

                border: const OutlineInputBorder(),

                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  ),

                  onPressed: () =>
                      setState(() => _obscurePassword = !_obscurePassword),
                ),
              ),

              onChanged: (_) => setState(() {}),
            ),

            const SizedBox(height: 8),

            Align(
              alignment: Alignment.centerRight,

              child: TextButton(
                onPressed: () {},

                child: const Text('Esqueci minha senha'),
              ),
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      _emailController.clear();

                      _passwordController.clear();

                      setState(() {});
                    },

                    child: const Text('Limpar'),
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  flex: 2,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),

                      backgroundColor: Colors.teal,

                      foregroundColor: Colors.white,
                    ),

                    onPressed: _formValido ? _entrar : null,

                    child: const Text('Entrar'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            const Row(
              children: [
                Expanded(child: Divider()),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),

                  child: Text('ou'),
                ),

                Expanded(child: Divider()),
              ],
            ),

            const SizedBox(height: 24),

            OutlinedButton.icon(
              onPressed: () {},

              icon: const Icon(Icons.person_add_alt),

              label: const Text('Criar uma conta'),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
