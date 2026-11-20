
import 'package:flutter/material.dart';

void main() {
  runApp(const DivinCVApp());
}

const Color navy = Color(0xFF14213D);
const Color blue = Color(0xFF2563EB);
const Color pale = Color(0xFFF3F6FC);

class DivinCVApp extends StatelessWidget {
  const DivinCVApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CV - Divin Ben',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: blue),
        scaffoldBackgroundColor: pale,
        cardTheme: CardThemeData(
          elevation: 1,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      home: const LoginPage(),
    );
  }
}

// CONNEXION
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  String errorMessage = '';

  void login() {
    if (usernameController.text.trim() == 'divin' &&
        passwordController.text == '1234') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const MainNavigation(),
        ),
      );
    } else {
      setState(() {
        errorMessage = 'Identifiants incorrects.';
      });
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                      radius: 45,
                      backgroundColor: navy,
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Bienvenue',
                      style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: navy,
                      ),
                    ),
                    const Text(
                      'Connectez-vous pour consulter mon CV',
                    ),
                    const SizedBox(height: 25),
                    TextField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Nom d’utilisateur',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Mot de passe',
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    if (errorMessage.isNotEmpty)
                      Text(
                        errorMessage,
                        style: const TextStyle(color: Colors.red),
                      ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: login,
                        child: const Text('Se connecter'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Démo : divin / 1234',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// NAVIGATION
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    FamilyPage(),
    ContactPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MON ESPACE PERSONNEL',
          style: TextStyle(
            color: navy,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() => selectedIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.description_outlined),
            selectedIcon: Icon(Icons.description),
            label: 'Mon CV',
          ),
          NavigationDestination(
            icon: Icon(Icons.family_restroom),
            label: 'Famille',
          ),
          NavigationDestination(
            icon: Icon(Icons.contact_mail_outlined),
            label: 'Contact',
          ),
        ],
      ),
    );
  }
}

// PAGE PRINCIPALE : CV
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 950),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 600;

                final sidebar = Container(
                  width: isWide ? 260 : double.infinity,
                  color: navy,
                  padding: const EdgeInsets.all(22),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PhotoPlaceholder(),
                      SizedBox(height: 25),
                      SideTitle('COORDONNÉES'),
                      SideInfo(Icons.location_on, 'Goma, RDC'),
                      SideInfo(Icons.phone, '+243 998 591 642'),
                      SideInfo(Icons.email, 'divinben567@gmail.com'),
                      SizedBox(height: 22),
                      SideTitle('COMPÉTENCES'),
                      SideBullet('Développement logiciel'),
                      SideBullet('Programmation'),
                      SideBullet('Maintenance informatique'),
                      SideBullet('Maintenance télécoms'),
                      SideBullet('Fibre optique'),
                      SideBullet('Équipements VSAT'),
                      SizedBox(height: 22),
                      SideTitle('QUALITÉS'),
                      SideBullet('Sens des responsabilités'),
                      SideBullet('Esprit d’équipe'),
                      SideBullet('Capacité d’adaptation'),
                      SideBullet('Motivation et discipline'),
                      SizedBox(height: 22),
                      SideTitle('LANGUES'),
                      SideBullet('Français : à préciser'),
                      SideBullet('Autres langues : à préciser'),
                    ],
                  ),
                );

                final mainContent = Padding(
                  padding: const EdgeInsets.all(24),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'DIVIN BAHAVU BÉNÉDICTION',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: navy,
                        ),
                      ),
                      SizedBox(height: 7),
                      Text(
                        'ÉTUDIANT EN RESEAUX TELECOMS',
                        style: TextStyle(
                          color: blue,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(height: 18),
                      Text(
                        'PROFIL PROFESSIONNEL',
                        style: sectionStyle,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Étudiant en quatrième année de licence en Reseaux Telecommunication à l’Institut Supérieur d’Informatique et de Gestion (ISIG). '
                        'Intéressé par le développement logiciel, les technologies informatiques et les télécommunications. '
                        'Motivé à approfondir mes connaissances et à mettre mes compétences en pratique dans un environnement professionnel.',
                        style: bodyStyle,
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 22),
                      Text('FORMATION', style: sectionStyle),
                      SizedBox(height: 10),
                      TimelineItem(
                        title: 'Licence 4 en Reseaux Telecommunication',
                        subtitle: 'Institut Supérieur d’Informatique et de Gestion (ISIG)',
                        period: 'En cours',
                      ),
                      SizedBox(height: 20),
                      Text(
                        'EXPÉRIENCE PROFESSIONNELLE',
                        style: sectionStyle,
                      ),
                      SizedBox(height: 10),
                      TimelineItem(
                        title: 'Stage pratique en télécommunications',
                        subtitle: 'Maintenance préventive et corrective des équipements télécoms',
                        period: 'Période à compléter',
                      ),
                      SizedBox(height: 8),
                      Text(
                        '• Découverte et maintenance des équipements de télécommunication.\n'
                        '• Initiation aux équipements BTS, BBU et RRU.\n'
                        '• Découverte des systèmes VSAT et des antennes paraboliques.\n'
                        '• Initiation à la fibre optique et aux faisceaux hertziens.\n'
                        '• Observation des installations et des opérations de maintenance.',
                        style: bodyStyle,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'COMPÉTENCES TECHNIQUES',
                        style: sectionStyle,
                      ),
                      SizedBox(height: 10),
                      Text(
                        '• Notions en développement d’applications.\n'
                        '• Connaissances en informatique générale.\n'
                        '• Notions de maintenance informatique.\n'
                        '• Connaissances de base en réseaux et télécommunications.\n'
                        '• Découverte des technologies de transmission.',
                        style: bodyStyle,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'OBJECTIF PROFESSIONNEL',
                        style: sectionStyle,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Mettre mes connaissances en pratique, développer mon expérience professionnelle et contribuer à la réalisation de projets informatiques et technologiques.',
                        style: bodyStyle,
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 25),
                      Divider(),
                      Text(
                        'Références disponibles sur demande.',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                );

                return isWide
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          sidebar,
                          Expanded(child: mainContent),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          sidebar,
                          mainContent,
                        ],
                      );
              },
            ),
          ),
        ),
      ),
    );
  }
}

// PHOTO PERSONNELLE
class PhotoPlaceholder extends StatelessWidget {
  const PhotoPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 145,
        height: 165,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white, width: 4),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Image.asset(
          'assets/images/photo.jpg',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add_a_photo, size: 42, color: blue),
                SizedBox(height: 8),
                Text(
                  'VOTRE PHOTO',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: navy,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// ÉLÉMENTS DE LA COLONNE LATÉRALE
class SideTitle extends StatelessWidget {
  final String title;

  const SideTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
    );
  }
}

class SideInfo extends StatelessWidget {
  final IconData icon;
  final String text;

  const SideInfo(this.icon, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.lightBlueAccent, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SideBullet extends StatelessWidget {
  final String text;

  const SideBullet(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(color: Colors.lightBlueAccent),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// STYLES DU CV
const TextStyle sectionStyle = TextStyle(
  color: navy,
  fontWeight: FontWeight.bold,
  fontSize: 16,
  letterSpacing: 0.7,
);

const TextStyle bodyStyle = TextStyle(
  fontSize: 13.5,
  height: 1.6,
  color: Color(0xFF333333),
);

class TimelineItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String period;

  const TimelineItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.period,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.circle, size: 11, color: blue),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(subtitle, style: bodyStyle),
              const SizedBox(height: 4),
              Text(
                period,
                style: const TextStyle(
                  color: blue,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// PAGE FAMILLE
class FamilyPage extends StatelessWidget {
  const FamilyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Text(
          'MA FAMILLE',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: navy,
          ),
        ),
        SizedBox(height: 15),
        FamilyPhotoCard(
          title: 'Mon père',
          name: 'BAHAVU KALIMIRA',
          profession: 'COMMERCANT',
          photo: 'assets/images/pere.jpg',
        ),
        FamilyPhotoCard(
          title: 'Ma mère',
          name: 'BAHATI KARANGA',
          profession: 'COMMERCANTE',
          photo: 'assets/images/mere.jpg',
        ),
        FamilyPhotoCard(
          title: 'Mon frere',
          name: 'JULES NGAOSETHI',
          profession: 'ASSISTANT DTM',
          photo: 'assets/images/frere.jpg',
        ),
        
      ],
    );
  }
}

// CARTE PHOTO FAMILLE
class FamilyPhotoCard extends StatelessWidget {
  final String title;
  final String name;
  final String profession;
  final String photo;

  const FamilyPhotoCard({
    super.key,
    required this.title,
    required this.name,
    required this.profession,
    required this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 15),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                photo,
                width: 105,
                height: 125,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 105,
                    height: 125,
                    color: pale,
                    child: const Icon(
                      Icons.person,
                      size: 55,
                      color: blue,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: navy,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Nom : $name',
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Profession : $profession',
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// PAGE CONTACT
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Text(
          'MES CONTACTS',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: navy,
          ),
        ),
        SizedBox(height: 15),
        InfoCard(
          title: 'Téléphone',
          icon: Icons.phone,
          items: ['+243 998 591 642'],
        ),
        InfoCard(
          title: 'Adresse e-mail',
          icon: Icons.email,
          items: ['divinben567@gmail.com'],
        ),
        InfoCard(
          title: 'Réseaux sociaux',
          icon: Icons.people,
          items: [
            'Facebook : Divin Ben',
            'WhatsApp : DIVIN BENEDICTION',
            'LinkedIn : Ben DIvin',
          ],
        ),
        InfoCard(
          title: 'Localisation',
          icon: Icons.location_on,
          items: ['Goma, RDC'],
        ),
      ],
    );
  }
}

// CARTE D'INFORMATIONS
class InfoCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<String> items;

  const InfoCard({
    super.key,
    required this.title,
    required this.icon,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 15),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: blue),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: navy,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...items.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: Text(
                  item,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
