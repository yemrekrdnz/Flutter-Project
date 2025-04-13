import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(BookApp());
}

class BookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kitap Öneri Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: Colors.brown[50],
      ),
      home: BookRecommendationPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BookRecommendationPage extends StatefulWidget {
  @override
  _BookRecommendationPageState createState() => _BookRecommendationPageState();
}

class _BookRecommendationPageState extends State<BookRecommendationPage>
    with SingleTickerProviderStateMixin {
  final Map<String, List<Map<String, String>>> books = {
    'Roman': [
      {'isim': 'Suç ve Ceza', 'yazar': 'Fyodor Dostoyevski', 'sayfa': '671'},
      {'isim': '1984', 'yazar': 'George Orwell', 'sayfa': '328'},
      {'isim': 'Madame Bovary', 'yazar': 'Gustave Flaubert', 'sayfa': '432'},
      {'isim': 'Anna Karenina', 'yazar': 'Lev Tolstoy', 'sayfa': '864'},
      {
        'isim': 'Yeraltından Notlar',
        'yazar': 'Fyodor Dostoyevski',
        'sayfa': '125'
      },
      {'isim': 'Kırmızı ve Siyah', 'yazar': 'Stendhal', 'sayfa': '576'},
      {'isim': 'Don Kişot', 'yazar': 'Miguel de Cervantes', 'sayfa': '1072'},
      {'isim': 'Babalar ve Oğullar', 'yazar': 'Ivan Turgenyev', 'sayfa': '256'},
      {
        'isim': 'Karamazov Kardeşler',
        'yazar': 'Fyodor Dostoyevski',
        'sayfa': '840'
      },
      {'isim': 'Sefiller', 'yazar': 'Victor Hugo', 'sayfa': '1463'},
    ],
    'Bilim Kurgu': [
      {'isim': 'Dune', 'yazar': 'Frank Herbert', 'sayfa': '412'},
      {'isim': 'Vakıf', 'yazar': 'Isaac Asimov', 'sayfa': '296'},
      {
        'isim': 'Otostopçunun Galaksi Rehberi',
        'yazar': 'Douglas Adams',
        'sayfa': '224'
      },
      {'isim': 'Cesur Yeni Dünya', 'yazar': 'Aldous Huxley', 'sayfa': '288'},
      {'isim': 'Fahrenheit 451', 'yazar': 'Ray Bradbury', 'sayfa': '158'},
      {'isim': 'Ben, Robot', 'yazar': 'Isaac Asimov', 'sayfa': '320'},
      {'isim': 'Zaman Makinesi', 'yazar': 'H.G. Wells', 'sayfa': '128'},
      {'isim': 'Uzay Şarkısı', 'yazar': 'Ray Bradbury', 'sayfa': '304'},
      {'isim': 'Mars Yıllıkları', 'yazar': 'Ray Bradbury', 'sayfa': '222'},
      {
        'isim': '2001: Bir Uzay Destanı',
        'yazar': 'Arthur C. Clarke',
        'sayfa': '297'
      },
    ],
    'Tarih': [
      {'isim': 'Sapiens', 'yazar': 'Yuval Noah Harari', 'sayfa': '498'},
      {
        'isim': 'İnsanlığın Tarihi',
        'yazar': 'Yuval Noah Harari',
        'sayfa': '412'
      },
      {
        'isim': 'Guns, Germs, and Steel',
        'yazar': 'Jared Diamond',
        'sayfa': '480'
      },
      {
        'isim': 'İmparatorluğun Çöküşü',
        'yazar': 'Niall Ferguson',
        'sayfa': '368'
      },
      {
        'isim': 'Ortaçağ Avrupa Tarihi',
        'yazar': 'Chris Wickham',
        'sayfa': '650'
      },
      {'isim': 'Tarih Bilinci', 'yazar': 'Halil İnalcık', 'sayfa': '224'},
      {
        'isim': 'Osmanlı İmparatorluğu',
        'yazar': 'Halil İnalcık',
        'sayfa': '648'
      },
      {'isim': 'Roma İmparatorluğu', 'yazar': 'Mary Beard', 'sayfa': '608'},
      {
        'isim': 'Tarihten Günümüze Ekonomik Sistemler',
        'yazar': 'Ernest Mandel',
        'sayfa': '352'
      },
      {
        'isim': 'Kültür ve Sömürgecilik',
        'yazar': 'Edward Said',
        'sayfa': '272'
      },
    ],
    'Polisiye': [
      {
        'isim': 'Sherlock Holmes',
        'yazar': 'Arthur Conan Doyle',
        'sayfa': '320'
      },
      {'isim': 'Cinayetler Oteli', 'yazar': 'Agatha Christie', 'sayfa': '288'},
      {
        'isim': 'Doğu Ekspresinde Cinayet',
        'yazar': 'Agatha Christie',
        'sayfa': '256'
      },
      {
        'isim': 'Kuzuların Sessizliği',
        'yazar': 'Thomas Harris',
        'sayfa': '352'
      },
      {'isim': 'Kayıp Kız', 'yazar': 'Gillian Flynn', 'sayfa': '416'},
      {'isim': 'Ejderha Dövmeli Kız', 'yazar': 'Stieg Larsson', 'sayfa': '672'},
      {'isim': 'Şeytan Tüyü', 'yazar': 'Daphne du Maurier', 'sayfa': '400'},
      {
        'isim': 'Kapalı Oda Cinayetleri',
        'yazar': 'John Dickson Carr',
        'sayfa': '320'
      },
      {'isim': 'Körlük', 'yazar': 'Jose Saramago', 'sayfa': '336'},
      {'isim': 'Karanlık Sular', 'yazar': 'Robert Bryndza', 'sayfa': '384'},
    ],
    'Biyografi': [
      {'isim': 'Steve Jobs', 'yazar': 'Walter Isaacson', 'sayfa': '656'},
      {'isim': 'Elon Musk', 'yazar': 'Ashlee Vance', 'sayfa': '400'},
      {
        'isim': 'Einstein: His Life and Universe',
        'yazar': 'Walter Isaacson',
        'sayfa': '704'
      },
      {'isim': 'Leonardo da Vinci', 'yazar': 'Walter Isaacson', 'sayfa': '624'},
      {'isim': 'Benjamin Franklin', 'yazar': 'Walter Isaacson', 'sayfa': '608'},
      {'isim': 'Churchill', 'yazar': 'Andrew Roberts', 'sayfa': '1152'},
      {'isim': 'Alexander Hamilton', 'yazar': 'Ron Chernow', 'sayfa': '832'},
      {'isim': 'Becoming', 'yazar': 'Michelle Obama', 'sayfa': '448'},
      {
        'isim': 'Mahatma Gandhi: His Life and Times',
        'yazar': 'Louis Fischer',
        'sayfa': '640'
      },
      {'isim': 'Malcolm X', 'yazar': 'Alex Haley', 'sayfa': '608'},
    ],
  };

  String? selectedGenre;
  Map<String, String>? recommendedBook;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  void recommendBook() {
    if (selectedGenre != null && books[selectedGenre!] != null) {
      final genreBooks = books[selectedGenre!]!;
      final randomBook = genreBooks[Random().nextInt(genreBooks.length)];
      setState(() {
        recommendedBook = randomBook;
        _animationController.reset();
        _animationController.forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kitap Öneri Uygulaması',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown[700],
        elevation: 10,
        actions: [
          IconButton(
            icon: Icon(Icons.library_books),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LibraryPage(books: books)),
              );
            },
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 196, 84, 84),
                      const Color.fromARGB(235, 72, 44, 44)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  "Öneri almak istediğiniz türü seçiniz",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: books.keys.map((genre) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGenre = genre;
                          recommendedBook = null;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        width: 150,
                        decoration: BoxDecoration(
                          color: selectedGenre == genre
                              ? Colors.brown[300]
                              : Colors.brown[100],
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            genre,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown[800],
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: recommendBook,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  backgroundColor: Colors.brown[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 10,
                  shadowColor: Colors.black.withOpacity(0.3),
                ),
                child: Text(
                  'Kitap Öner',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              if (recommendedBook != null)
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Column(
                    children: [
                      Text(
                        'Kitap Adı: ${recommendedBook!['isim']}',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown[700]),
                      ),
                      Text(
                        'Yazar: ${recommendedBook!['yazar']}',
                        style:
                            TextStyle(fontSize: 16, color: Colors.brown[600]),
                      ),
                      Text(
                        'Sayfa Sayısı: ${recommendedBook!['sayfa']}',
                        style:
                            TextStyle(fontSize: 16, color: Colors.brown[600]),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class LibraryPage extends StatefulWidget {
  final Map<String, List<Map<String, String>>> books;

  LibraryPage({required this.books});

  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  final Map<String, bool> expandedGenres = {};

  @override
  void initState() {
    super.initState();
    widget.books.keys.forEach((genre) {
      expandedGenres[genre] = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final genreIcons = {
      'Roman': Icons.book,
      'Bilim Kurgu': Icons.science,
      'Tarih': Icons.history,
      'Polisiye': Icons.local_police,
      'Biyografi': Icons.person,
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Kütüphane'),
        backgroundColor: Colors.brown[700],
        elevation: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: widget.books.keys.map((genre) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      expandedGenres[genre] = !(expandedGenres[genre] ?? false);
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.brown[100],
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          genreIcons[genre] ?? Icons.bookmark,
                          color: Colors.brown[800],
                        ),
                        SizedBox(width: 10),
                        Text(
                          genre,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (expandedGenres[genre] == true)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: widget.books[genre]!.length,
                      itemBuilder: (context, index) {
                        final book = widget.books[genre]![index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  book['isim']!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.brown[800],
                                  ),
                                ),
                                Text(
                                  'Yazar: ${book['yazar']}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.brown[600],
                                  ),
                                ),
                                Text(
                                  'Sayfa: ${book['sayfa']}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.brown[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
