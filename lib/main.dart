import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'AZIMUT Отель',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  ' Улица Смоленская 8, Арбат, Москва, Россия',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          FavoriteWidget(),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(

        'Отель «AZIMUT Смоленская» с панорамным видом на город занимает 24- '
            'этажное здание в центре Москвы. Гости могут посещать клубный лаундж '
            'на 20 этаже с великолепным видом на Москву. На всей территории '
            'работает бесплатный Wi-Fi. В каждом номере есть кондиционер, телевизор с плоским '
            'экраном, сейф и бесплатная бутылка минеральной воды.  В некоторых номерах '
            'обустроены гостиная зона и место для работы.',
        softWrap: true,
      ),
    );


    Widget textSectionTwo = Container(
      padding: const EdgeInsets.all(32),
      child: Text(

        'Гостям некоторых номеров отеля «AZIMUT Смоленская» предоставляется '
            'право посещения представительского лаунджа с панорамным видом на '
            'городской пейзаж Москвы. Этот лаундж на 20 этаже отлично подходит для '
            'отдыха и проведения деловых встреч. ',
        softWrap: true,
      ),
    );

    Widget textSectionThree = Container(
      padding: const EdgeInsets.all(32),
      child: Text(

        'Стойка регистрации гостиницы работает круглосуточно. В ресторане Avenue '
            'подают блюда местной и интернациональной кухни. К услугам бизнес- '
            'путешественников 10 полностью оборудованных конференц-залов. ',
        softWrap: true,
      ),
    );


    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'Телефон'),
          _buildButtonColumn(color, Icons.near_me, 'Message'),
          _buildButtonColumn(color, Icons.share, 'Поделиться'),
        ],
      ),
    );

    Widget buttonSectionTwo = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.local_parking, 'Парковка'),
          _buildButtonColumn(color, Icons.fitness_center, 'Хороший фитнес-центр'),
          _buildButtonColumn(color, Icons.spa, 'Спа центр'),
        ],
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Предложения в AZIMUT Отель',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Предложения в AZIMUT Отель'),
          backgroundColor: Color(0xFFC27306),
        ),
        body: ListView(
          children: [
            Image.asset(
                'lib/images/hotel.jpg',
                width: 600,
                height: 240,
                fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
            Image.asset(
              'lib/images/building.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            textSectionTwo,
            buttonSectionTwo,
            textSectionThree,
          ],
        ),
      ),
    );

  }
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Color(0xFFC27306)),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFFC27306),
            ),
          ),
        ),
      ],
    );
  }
}
class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
}
