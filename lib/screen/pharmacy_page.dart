import 'package:eczane_app/network/pharmacy_list_api.dart';
import 'package:eczane_app/network/pharmacy_list_response.dart';
import 'package:eczane_app/widget/app_bar.dart';
import 'package:flutter/material.dart';

class PharmacyPage extends StatefulWidget {
  final String city;
  final String district;

  const PharmacyPage({Key key, this.city, this.district}) : super(key: key);
  @override
  _PharmacyPageState createState() => _PharmacyPageState();
}

class _PharmacyPageState extends State<PharmacyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Eczane Listesi"),
      body: FutureBuilder<PharmacyListResponse>(
        future: PharmacyListAPI()
            .getPharmacy(city: widget.city, district: widget.district),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final city = snapshot.data;
          return ListView.builder(
            physics: ScrollPhysics(
                parent: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics())),
            itemCount: city.data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(city.data[index].eczaneAdi),
                subtitle: Text(city.data[index].adresi),
                trailing: Icon(
                  Icons.arrow_forward,
                  size: 25,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
