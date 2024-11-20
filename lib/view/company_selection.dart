import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jalyuzi/widget/custom_container.dart';

class CompanySelectionPage extends StatefulWidget {
  const CompanySelectionPage({super.key});

  @override
  State<CompanySelectionPage> createState() => _CompanySelectionPageState();
}

class _CompanySelectionPageState extends State<CompanySelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/background.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///qollanma
                CustomContainer(
                  height: 80,
                  width: double.infinity,
                  child: Text(
                    "qollanma",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          ///comp qoshilish
                          CustomContainer(
                            height: 150,
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/add-user.png",
                                  height: 36,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "companiyaga \n qoshilish",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),

                          ///support
                          CustomContainer(
                            height: 90,
                            width: double.infinity,
                            child: Text(
                              "Bir nima edi",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),

                    /// komp yaratish
                    Expanded(
                      child: CustomContainer(
                          height: 250,
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/office-building.png",
                                height: 80,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "kompaniya \n yaratish",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                CustomContainer(
                  height: 50,
                  width: double.infinity,
                  child: Text(
                    "Bir nima edi",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
                CustomContainer(
                  height: 50,
                  width: double.infinity,
                  child: Text(
                    "Bir nima edi",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
