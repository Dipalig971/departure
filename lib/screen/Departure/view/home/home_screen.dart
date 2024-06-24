import 'dart:convert';
import 'package:departure/screen/Departure/modal/dohe_model.dart';
import 'package:departure/screen/Departure/provider/dohe_data.dart';
import 'package:departure/screen/Departure/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../detail/detail_Screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DoheProvider providerTrue = Provider.of<DoheProvider>(context, listen: true);
    DoheProvider providerFalse = Provider.of<DoheProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: const Color(0xffCFE7CF),
      drawer: Drawer(
        child: Switch(value: Provider.of<ThemeProvider>(context).isDark, onChanged: (value) {
          Provider.of<ThemeProvider>(context, listen: false)
              .changeTheme();

        },),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xffCFE7CF),
        title: const Text('रत्नावली के दोहे'),
      ),
      body: FutureBuilder<String>(
        future: rootBundle.loadString('assets/json_data/dohe.json'),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            List<dynamic> data = jsonDecode(snapshot.data!);
            providerFalse.convert(data);

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: providerTrue.jsondata.length,
                itemBuilder: (context, index) {
                  DepartureModel item = providerTrue.jsondata[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(index: index), // Pass the index you want to display
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            color: Colors.white,
                            child: ListTile(
                              leading: Text(
                                item.id.toString(),
                                style: TextStyle(fontSize: 18),
                              ),
                              title: Text(
                                item.dohe.toString(),
                                style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
