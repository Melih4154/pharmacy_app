import 'package:eczane_app/network/city_list_api.dart';
import 'package:eczane_app/network/city_list_response.dart';
import 'package:eczane_app/screen/district_page.dart';
import 'package:eczane_app/widget/app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> cityList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Şehirler"),
      body: FutureBuilder<CityListResponse>(
        future: CityListAPI().getCity(),
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
                        builder: (context) => DistrictPage(
                              city: city.data[index].sehirAd,
                            ))),
                child: ListTile(
                  title: Text(city.data[index].sehirAd),
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
