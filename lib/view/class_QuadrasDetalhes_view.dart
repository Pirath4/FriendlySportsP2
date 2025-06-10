import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class QuadraDetalhesView extends StatefulWidget {
  final String nome;
  final String endereco;
  final String qtdQuadras;
  final List<String> imagemUrl;

  const QuadraDetalhesView({
    required this.nome,
    required this.endereco,
    required this.qtdQuadras,
    required this.imagemUrl,
    Key? key,
  }) : super(key: key);

  static const users = ["1", "2"];

  @override
  _QuadraDetalhesViewState createState() => _QuadraDetalhesViewState();
}

class _QuadraDetalhesViewState extends State<QuadraDetalhesView> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String? _horarioSelecionado;

  final List<String> _horarios = List.generate(
    16,
    (index) => '${(8 + index).toString().padLeft(2, '0')}:00',
  );

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('pt_BR', null);
    Intl.defaultLocale = 'pt_BR';
  }

  Future<void> _confirmarReserva() async {
    final data = DateFormat('dd/MM/yyyy').format(_selectedDay!);
    final hora = _horarioSelecionado!;
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Usuário não está logado!'),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    try {
      // Verificar se já existe uma reserva para o mesmo horário
      final existingReservation = await FirebaseFirestore.instance
          .collection('quadra')
          .where('Quadra', isEqualTo: widget.nome)
          .where('Data', isEqualTo: data)
          .where('Hora', isEqualTo: hora)
          .get();

      if (existingReservation.docs.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Este horário já está reservado!'),
            duration: Duration(seconds: 3),
          ),
        );
        return;
      }

      // Buscar o nome do usuário no Firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (!userDoc.exists) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Dados do usuário não encontrados!'),
            duration: Duration(seconds: 3),
          ),
        );
        return;
      }

      final userData = userDoc.data() as Map<String, dynamic>;
      final userName = userData['nome'] ?? 'Usuário Desconhecido';

      // Salvar a reserva no Firestore
      await FirebaseFirestore.instance.collection('quadra').add({
        'nome': userName,
        'Quadra': widget.nome,
        'Data': data,
        'Hora': hora,
        'Criado em': FieldValue.serverTimestamp(),
      });

      final mensagem = 'Reserva confirmada para $data às $hora';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(mensagem),
          duration: const Duration(seconds: 3),
        ),
      );

      print(mensagem);
    } catch (e) {
      final errorMessage = 'Erro ao salvar reserva: $e';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          duration: const Duration(seconds: 3),
        ),
      );
      print(errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.nome,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 250,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
              ),
              items: widget.imagemUrl.map((url) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image.network(
                      url,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 250,
                          color: Colors.grey[300],
                          child: const Icon(Icons.error, size: 50),
                        );
                      },
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: QuadraDetalhesView.users.length,
                itemBuilder: (context, index) {
                  final usuario = QuadraDetalhesView.users[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(usuario),
                          onBackgroundImageError: (exception, stackTrace) {
                            print('Erro ao carregar imagem: $exception');
                          },
                          backgroundColor: Colors.grey[300],
                          child:
                              usuario.isEmpty ? const Icon(Icons.person) : null,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          usuario,
                          style: const TextStyle(fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Agende um horário:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  TableCalendar(
                    locale: 'pt_BR',
                    firstDay: DateTime.now(),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: _focusedDay,
                    calendarFormat: _calendarFormat,
                    selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(_selectedDay, selectedDay)) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                          _horarioSelecionado = null;
                        });
                      }
                    },
                    onFormatChanged: (format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    },
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: Colors.blueAccent.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: true,
                      titleCentered: true,
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (_selectedDay != null) ...[
                    const Text(
                      "Selecione um horário:",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: _horarios.map((hora) {
                        final isSelected = _horarioSelecionado == hora;
                        return ChoiceChip(
                          label: Text(hora),
                          selected: isSelected,
                          selectedColor: Colors.blue,
                          onSelected: (_) {
                            setState(() {
                              _horarioSelecionado = hora;
                            });
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),
                    if (_horarioSelecionado != null)
                      Center(
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.check),
                          label: const Text("Confirmar Reserva"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                          ),
                          onPressed: _confirmarReserva,
                        ),
                      ),
                    const SizedBox(height: 20),
                    // Widget para mostrar as reservas existentes
                    const Text(
                      "Reservas Confirmadas:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('quadra')
                          .where('Quadra', isEqualTo: widget.nome)
                          .orderBy('Criado em', descending: true)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (snapshot.hasError) {
                          return const Text('Erro ao carregar reservas');
                        }
                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return const Text(
                              'Nenhuma reserva encontrada para esta quadra.');
                        }

                        final reservas = snapshot.data!.docs;

                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: reservas.length,
                          itemBuilder: (context, index) {
                            final reserva =
                                reservas[index].data() as Map<String, dynamic>;
                            final userName = reserva['nome'] ?? 'Desconhecido';
                            final data = reserva['Data'] ?? 'N/A';
                            final hora = reserva['Hora'] ?? 'N/A';

                            return ListTile(
                              leading:
                                  const Icon(Icons.event, color: Colors.blue),
                              title: Text('Usuário: $userName'),
                              subtitle: Text('Data: $data, Hora: $hora'),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
