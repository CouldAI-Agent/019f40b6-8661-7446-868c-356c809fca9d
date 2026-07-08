import 'package:flutter/material.dart';

void main() {
  runApp(const OttomanHistoryApp());
}

class OttomanHistoryApp extends StatelessWidget {
  const OttomanHistoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Osmanlı Tarihi Tablosu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HistoryTableScreen(),
      },
    );
  }
}

class HistoryTableScreen extends StatelessWidget {
  const HistoryTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Osmanlı Tarihi Önemli Olaylar ve Islahatlar'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowColor: MaterialStateProperty.resolveWith(
                (states) => Theme.of(context).colorScheme.primaryContainer,
              ),
              columns: const [
                DataColumn(label: Text('Dönem', style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(label: Text('Tarih Aralığı', style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(label: Text('Padişah Adı', style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(label: Text('Dönemdeki Önemli Savaşlar', style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(label: Text('Dönemdeki Önemli Antlaşmalar', style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(label: Text('Dönemdeki Önemli İsyanlar/İç Olaylar', style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(label: Text('Yüzyıla Göre Islahatlar', style: TextStyle(fontWeight: FontWeight.bold))),
              ],
              rows: historyData.map((era) {
                return DataRow(cells: [
                  DataCell(Text(era.period)),
                  DataCell(Text(era.dateRange)),
                  DataCell(Text(era.sultan)),
                  DataCell(Text(era.wars)),
                  DataCell(Text(era.treaties)),
                  DataCell(Text(era.events)),
                  DataCell(Text(era.reforms)),
                ]);
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class OttomanEra {
  final String period;
  final String dateRange;
  final String sultan;
  final String wars;
  final String treaties;
  final String events;
  final String reforms;

  const OttomanEra({
    required this.period,
    required this.dateRange,
    required this.sultan,
    required this.wars,
    required this.treaties,
    required this.events,
    required this.reforms,
  });
}

const List<OttomanEra> historyData = [
  OttomanEra(period: 'Kuruluş Dönemi', dateRange: '1299-1326', sultan: 'Osman Bey', wars: 'Koyunhisar (1302), Bafeus S.', treaties: '(Diplomatik antlaşma yok)', events: 'Fasılalar, Aşiret içi çekişmeler', reforms: '13. YY Islahat Yok (Kanun-ı Kadim)'),
  OttomanEra(period: 'Kuruluş Dönemi', dateRange: '1326-1362', sultan: 'Orhan Bey', wars: 'Maltepe (Pelekanon) (1329), İznik Fethi, Gelibolu Geçişi', treaties: '(Diplomatik antlaşma yok)', events: 'Saray içi rekabet (Bizans ile)', reforms: '14. YY Islahat Yok (İlk Kurumlar)'),
  OttomanEra(period: 'Kuruluş Dönemi', dateRange: '1362-1389', sultan: 'I. Murad (Hüdavendigar)', wars: 'Sırpsındığı, I. Kosova (1389)', treaties: '(Diplomatik antlaşma yok)', events: 'Savcı Bey İsyanı (Şehzade)', reforms: '14. YY Islahat Yok (Yeniçeri Ocağı)'),
  OttomanEra(period: 'Kuruluş Dönemi', dateRange: '1389-1402', sultan: 'I. Bayezid (Yıldırım)', wars: 'Niğbolu (1396), Ankara (1402)', treaties: '(Diplomatik antlaşma yok)', events: 'Düzmece Mustafa Olayı', reforms: '14. YY Islahat Yok'),
  OttomanEra(period: '(Fetret)', dateRange: '1402-1413', sultan: 'Fetret Devri', wars: 'Ankara Savaşı sonrası Kardeşler arası S.', treaties: '(Diplomatik antlaşma yok)', events: 'İç Savaş', reforms: '--'),
  OttomanEra(period: 'Kuruluş Dönemi', dateRange: '1413-1421', sultan: 'I. Mehmed (Çelebi)', wars: 'Fetret Devri Savaşları', treaties: '(Diplomatik antlaşma yok)', events: 'Şeyh Bedrettin İsyanı, Düzmece Mustafa', reforms: '15. YY Islahat Yok'),
  OttomanEra(period: 'Kuruluş Dönemi', dateRange: '1421-1451', sultan: 'II. Murad', wars: 'Varna (1444), II. Kosova (1448)', treaties: 'Edirne-Segedin Antlaşması (1444)', events: 'Düzmece Mustafa (2.), Buçuktepe İsyanı (İlk Yeniçeri Ayaklanması)', reforms: '15. YY Islahat Yok'),
  OttomanEra(period: 'Yükselme Dönemi', dateRange: '1451-1481', sultan: 'II. Mehmed (Fatih)', wars: "İstanbul'un Fethi (1453), Otlukbeli (1473), Otranto", treaties: '(Diplomatik antlaşma yok)', events: '--', reforms: '15. YY Islahat Yok'),
  OttomanEra(period: 'Yükselme Dönemi', dateRange: '1481-1512', sultan: 'II. Bayezid', wars: 'Ağa Çayırı (1485-1491), Otranto Bozgunu', treaties: '(Diplomatik antlaşma yok)', events: 'Cem Sultan Olayı, Şahkulu Ayaklanması (1511)', reforms: '16. YY Islahat Yok'),
  OttomanEra(period: 'Yükselme Dönemi', dateRange: '1512-1520', sultan: 'I. Selim (Yavuz)', wars: 'Çaldıran (1514), Mercidabık (1516), Ridaniye (1517)', treaties: '(Diplomatik antlaşma yok)', events: 'Karıştıran Savaşı', reforms: '16. YY Islahat Yok'),
  OttomanEra(period: 'Yükselme Dönemi', dateRange: '1520-1566', sultan: 'I. Süleyman (Kanuni)', wars: "Belgrad'ın Fethi (1521), Mohaç (1526), Preveze (1538), Zigetvar", treaties: 'İstanbul (İbrahim Paşa) Antlaşması (1533), Amasya Antlaşması (1555)', events: 'Canberdi Gazali, Ahmet Paşa, Baba Zünnun, Kalenderoğlu İsyanları', reforms: '16. YY Islahat Yok'),
  OttomanEra(period: 'Yükselme Dönemi', dateRange: '1566-1574', sultan: 'II. Selim', wars: "Cerbe Deniz Savaşı, Tunus'un Fethi, İnebahtı Deniz Bozgunu", treaties: '(Diplomatik antlaşma yok)', events: '--', reforms: '16. YY Islahat Yok'),
  OttomanEra(period: 'Yükselme Dönemi', dateRange: '1574-1595', sultan: 'III. Murad', wars: 'Osmanlı-Safevi Savaşları (Meşaleler S.)', treaties: 'Zitvatorok (1606 - Sonradan yapıldı)', events: '--', reforms: '16. YY Islahat Yok'),
  OttomanEra(period: 'Duraklama Dönemi', dateRange: '1595-1603', sultan: 'III. Mehmed', wars: 'Haçova Meydan Muharebesi (1596), Eğri ve Kanije Kuşatmaları', treaties: '(Diplomatik antlaşma yok)', events: 'Celali İsyanları', reforms: '17. YY Islahat Yok'),
  OttomanEra(period: 'Duraklama Dönemi', dateRange: '1603-1617', sultan: 'I. Ahmed', wars: 'Osmanlı-Safevi Savaşları', treaties: 'Zitvatorok (1606)', events: 'Celali İsyanları (Karayazıcı, Deli Hasan)', reforms: '17. YY ISLAHATLARI: Veraset sisteminde değişiklik (Ekber ve Erşed)'),
  OttomanEra(period: 'Duraklama Dönemi', dateRange: '1617-1618', sultan: 'I. Mustafa', wars: 'Osmanlı-Safevi Savaşları', treaties: '(Diplomatik antlaşma yok)', events: 'Saray içi entrikalar', reforms: '17. YY ISLAHATLARI (Yok)'),
  OttomanEra(period: 'Duraklama Dönemi', dateRange: '1618-1622', sultan: 'II. Osman (Genç)', wars: 'Hotin Seferi', treaties: 'Hotin Antlaşması', events: "Yeniçeri Ocağı'nın tasfiyesi planı", reforms: '17. YY ISLAHATLARI: Saray dışı evlilik, ulema yetki kısıtlaması, Yeniçeri tasfiyesi planı'),
  OttomanEra(period: 'Duraklama Dönemi', dateRange: '1622-1623', sultan: 'I. Mustafa (2.)', wars: '--', treaties: '--', events: 'İstanbul Ayaklanmaları', reforms: '17. YY ISLAHATLARI (Yok)'),
  OttomanEra(period: 'Duraklama Dönemi', dateRange: '1623-1640', sultan: 'IV. Murad', wars: 'Bağdat Seferi, Girit Kuşatması (Başlangıç)', treaties: 'Kasr-ı Şirin Antlaşması (1639)', events: 'Alkol ve Tütün Yasakları', reforms: '17. YY ISLAHATLARI: Toplumsal düzen yasakları, Koçi Bey ve Katip Çelebi Raporları (Risaleler)'),
  OttomanEra(period: 'Duraklama Dönemi', dateRange: '1640-1648', sultan: 'I. İbrahim', wars: 'Girit Kuşatması (Devam)', treaties: '--', events: 'Saray içi entrikalar', reforms: '17. YY ISLAHATLARI (Yok)'),
  OttomanEra(period: 'Duraklama Dönemi', dateRange: '1648-1687', sultan: 'IV. Mehmed (Avcı)', wars: 'Girit Kuşatması (Bitiş), II. Viyana Kuşatması (1683), Kutsal İttifak Savaşları', treaties: 'Vasvar (1664), Bucaş (1672), Karlofça (Bitiş)', events: "Celali İsyanları (2.), Vak'a-i Vakvakiye (Çınar Vakası)", reforms: '17. YY ISLAHATLARI: Tarhuncu Ahmet Paşa Bütçesi (Modern ilk denk bütçe), Köprülü Mehmet Paşa Şartları'),
  OttomanEra(period: 'Duraklama Dönemi', dateRange: '1687-1691', sultan: 'II. Süleyman', wars: 'Kutsal İttifak Savaşları (Devam)', treaties: '--', events: 'Zenta Muharebesi', reforms: '17. YY ISLAHATLARI (Yok)'),
  OttomanEra(period: 'Duraklama Dönemi', dateRange: '1691-1695', sultan: 'II. Ahmed', wars: 'Kutsal İttifak Savaşları (Devam)', treaties: '--', events: '--', reforms: '17. YY ISLAHATLARI (Yok)'),
  OttomanEra(period: 'Duraklama Dönemi', dateRange: '1695-1703', sultan: 'II. Mustafa', wars: 'Zenta Muharebesi (1697)', treaties: 'Karlofça Antlaşması (1699), İstanbul Antlaşması (1700)', events: 'Edirne Vakası (Şeyhülislam katledilmesi)', reforms: '18. YY Islahat Yok (Başlangıç)'),
  OttomanEra(period: 'Gerileme Dönemi', dateRange: '1703-1730', sultan: 'III. Ahmed', wars: 'Prut Savaşı (1711), Osmanlı-Venedik-Avusturya Savaşları, Petrovaradin', treaties: 'Prut Antlaşması, Pasarofça Antlaşması (1718)', events: "Patrona Halil İsyanı (Lale Devri'nin sonu)", reforms: '18. YY ISLAHATLARI (Lale Devri): Avrupa elçilikleri, ilk Türk matbaası, çiçek aşısı, Tulumbacılar (İtfaiye)'),
  OttomanEra(period: 'Gerileme Dönemi', dateRange: '1730-1754', sultan: 'I. Mahmud', wars: 'Osmanlı-Safevi Savaşları, Osmanlı-Avusturya-Rus Savaşları', treaties: 'Belgrad Antlaşması (1739), Belgrad Antlaşması', events: 'Humbaracı Ahmet Paşa Islahatları', reforms: '18. YY ISLAHATLARI: Humbaracı Ocağı ıslahı, Hendesehane (Kara Mühendishanesi) açılması'),
  OttomanEra(period: 'Gerileme Dönemi', dateRange: '1754-1757', sultan: 'III. Osman', wars: '--', treaties: '--', events: '--', reforms: '18. YY Islahat Yok'),
  OttomanEra(period: 'Gerileme Dönemi', dateRange: '1757-1774', sultan: 'III. Mustafa', wars: '1768-1774 Osmanlı-Rus Savaşı, Çeşme Deniz Felaketi', treaties: 'Küçük Kaynarca (Sonradan)', events: '--', reforms: '18. YY ISLAHATLARI: Sürat Topçuları Ocağı, İç borçlanma (Eshem Sistemi)'),
  OttomanEra(period: 'Gerileme Dönemi', dateRange: '1774-1789', sultan: 'I. Abdülhamid', wars: 'Osmanlı-Rus-Avusturya Savaşları', treaties: 'Küçük Kaynarca Antlaşması (1774), Aynalıkavak Tenkihnamesi', events: '--', reforms: '18. YY ISLAHATLARI: İstihkam Okulu, ulufe yasağı, Yeniçeri sayımı'),
  OttomanEra(period: 'Gerileme Dönemi', dateRange: '1789-1807', sultan: 'III. Selim', wars: "Napolyon'un Mısır'ı İşgali (1798), Osmanlı-Rus-Avusturya S.", treaties: 'Ziştovi (1791), Yaş (1792)', events: 'Kabakçı Mustafa İsyanı (III. Selim katli)', reforms: '18. YY ISLAHATLARI (Nizam-ı Cedid): Nizam-ı Cedid Ordusu, İrad-ı Cedid Hazinesi, Daimi elçilikler, Mühendishane-i Berri-i Hümayun'),
  OttomanEra(period: 'Dağılma Dönemi', dateRange: '1807-1808', sultan: 'IV. Mustafa', wars: 'Kabakçı Mustafa İsyanı', treaties: '--', events: 'Kabakçı Mustafa İsyanı (2.)', reforms: '--'),
  OttomanEra(period: 'Dağılma Dönemi', dateRange: '1808-1839', sultan: 'II. Mahmud', wars: "Napolyon'un Mısır İşgali (Devam), Yunan İsyanı, Navarin Deniz Felaketi (1827)", treaties: 'Bükreş (1812), Edirne (1829), Hünkar İskelesi (1833), Balta Limanı Ticaret Konvansiyonu', events: 'Mısır Bunalımı (Kavalalı Mehmet Ali Paşa), Sırp ve Yunan Milliyetçi İsyanları', reforms: "19. YY ISLAHATLARI: Sened-i İttifak, Yeniçeri Ocağı tasfiyesi (Vaka-i Hayriye), Divan'ın kaldırılması (Nazırlıklar), Tımar tasfiyesi, ilk nüfus sayımı, Takvim-i Vekayi"),
  OttomanEra(period: 'Dağılma Dönemi', dateRange: '1839-1861', sultan: 'I. Abdülmecid', wars: 'Kırım Savaşı (1853-1856)', treaties: 'Londra Boğazlar Sözleşmesi (1841), Paris Antlaşması (1856)', events: 'Gayrimüslim Hakları İsyanları', reforms: '19. YY ISLAHATLARI: Tanzimat Fermanı (1839), Islahat Fermanı (1856), ilk kağıt para, Mecelle yazımı'),
  OttomanEra(period: 'Dağılma Dönemi', dateRange: '1861-1876', sultan: 'Abdülaziz', wars: 'Girit İsyanı, Balkanlarda Milliyetçi İsyanlar', treaties: 'Maarif-i Umumiye Nizamnamesi (1869)', events: "Sultan Abdülaziz'in tahttan indirilmesi ve intiharı (?)", reforms: '19. YY ISLAHATLARI: Maarif Nizamnamesi (Eğitim reformu), Şura-yı Devlet (Danıştay)'),
  OttomanEra(period: 'Dağılma Dönemi', dateRange: '1876-1876', sultan: 'V. Murad', wars: '--', treaties: '--', events: 'Saray Entrikaları', reforms: '19. YY Islahat Yok'),
  OttomanEra(period: 'Dağılma Dönemi', dateRange: '1876-1909', sultan: 'II. Abdülhamid', wars: '93 Harbi (1877-1878 Osmanlı-Rus), Trablusgarp S. (Başlangıç)', treaties: 'Ayastefanos (1878), Berlin Antlaşması (1878), Duyun-u Umumiye', events: '31 Mart Ayaklanması (1909)', reforms: '19. YY ISLAHATLARI (I. & II. Meşrutiyet): Kanun-ı Esasi ilanı, Duyun-u Umumiye, Darülfünun (Modern üniversite), Telgraf ve demiryolu'),
  OttomanEra(period: '(II. Meşrutiyet)', dateRange: '1908-1909', sultan: 'II. Abdülhamid (2.)', wars: 'Trablusgarp Savaşı (Devam), Balkan Savaşları (Başlangıç)', treaties: 'Hata', events: 'Hata', reforms: 'Hata'),
  OttomanEra(period: 'Dağılma Dönemi', dateRange: '1909-1918', sultan: 'V. Mehmed (Reşad)', wars: 'Balkan Savaşları, I. Dünya Savaşı (1914-1918)', treaties: 'Mondros Mütarekesi (1918)', events: 'Hata', reforms: '20. YY ISLAHATLARI (İttihat ve Terakki): Çok partili siyaset, kadın hakları (İnas Darülfünunu)'),
  OttomanEra(period: 'Dağılma Dönemi', dateRange: '1918-1922', sultan: 'VI. Mehmed (Vahdeddin)', wars: 'Kurtuluş Savaşı (Ayrıntılı)', treaties: 'Hata', events: 'Mondros sonrası işgaller', reforms: '20. YY Islahat Yok (Son)'),
];
