import 'package:departure/screen/Departure/provider/dohe_data.dart';
import 'package:departure/screen/Departure/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_extend/share_extend.dart';

import '../../provider/language_provider.dart';

class DetailScreen extends StatelessWidget {
  final int index;

  const DetailScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final providerFalse = Provider.of<LanguageProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color(0xffCFE7CF),
      appBar: AppBar(
        backgroundColor: const Color(0xffCFE7CF),
        title: const Text(
          'रत्नावली के दोहे',
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert_outlined),
            onSelected: (value) {
              providerFalse.changeLanguage(value);
            },
            itemBuilder: (context) => [
              const PopupMenuItem<String>(
                value: 'hindi',
                child: Text('Hindi'),
              ),
              const PopupMenuItem<String>(
                value: 'english',
                child: Text('English'),
              ),
              const PopupMenuItem<String>(
                value: 'gujarati',
                child: Text('Gujarati'),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Consumer<DoheProvider>(
            builder: (context, providerFalse, _) {
              if (providerFalse.jsondata.isEmpty || index >= providerFalse.jsondata.length) {
                return const Text('Data not available');
              }

              final data = providerFalse.jsondata[index];

              String? translation;
              switch (languageProvider.select) {
                case 'english':
                  translation = data.english;
                  break;
                case 'gujarati':
                  translation = data.Gujarati;
                  break;
                case 'hindi':
                default:
                  translation = data.meaning;
                  break;
              }

              final shareContent = 'दोहा: ${data.dohe}\n\nअर्थ: $translation';

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40,left: 20),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration:  BoxDecoration(
                        color: const Color(0xffCFE7CF),
                        border: Border.all(color:Colors.black,width: 2)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 70, left: 35, right: 35),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Center(
                              child: Text(
                                'दोहा:',
                                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Center(
                              child: Text(
                                data.dohe.toString(),
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(height: 10),
                           const Divider(color: Colors.black,),
                            const SizedBox(height: 10),
                            const Center(
                              child: Text(
                                'अर्थ:',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              translation!,
                              overflow: TextOverflow.fade,
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 30),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            ShareExtend.share(shareContent, "text");
                          },
                          icon: const Icon(Icons.share, size: 30),
                        ),
                        IconButton(
                          onPressed: () {
                            Provider.of<FavouriteProvider>(context,listen: false).changeIcon();
                          },
                          icon: Icon(
                            Provider.of<FavouriteProvider>(context).isLike ? Icons.favorite : Icons.favorite_border,
                            size: 30,
                            color:  Provider.of<FavouriteProvider>(context).isLike ? Colors.red : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );

            },
          ),
        ],
      ),
    );
  }
}