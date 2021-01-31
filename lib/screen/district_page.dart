import 'package:eczane_app/network/district_list_api.dart';
import 'package:eczane_app/network/district_list_response.dart';
import 'package:eczane_app/screen/pharmacy_page.dart';
import 'package:eczane_app/widget/app_bar.dart';
import 'package:flutter/material.dart';

class DistrictPage extends StatefulWidget {
  final String city;

  const DistrictPage({Key key, this.city}) : super(key: key);
  @override
  _DistrictPageState createState() => _DistrictPageState();
}

class _DistrictPageState extends State<DistrictPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("İlçeler"),
      body: FutureBuilder<DistrictListResponse>(
        future: DistrictListAPI().getDistrict(city: widget.city),
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
              return InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PharmacyPage(
                            city: widget.city,
                            district: city.data[index].ilceAd))),
                child: ListTile(
                  title: Text(city.data[index].ilceAd),
                  trailing: Icon(
                    Icons.arrow_forward,
                    size: 25,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
