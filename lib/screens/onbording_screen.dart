import 'package:flutter/material.dart';

import 'package:notes_sphere/utils/app_text_styles.dart';
import 'package:notes_sphere/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Positioned(
                width: MediaQuery.of(context).size.width * 1.5,
                right: -10,
                bottom: 130,
                child: Image.asset(
                  "assets/user.png",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 160,
                left: 185,
                child: Column(
                  children: [
                    Text(
                      "You can join \nwith us !",
                      style: AppTextStyles.appTitle.copyWith(
                        color: Colors.black,
                        fontFamily: "Inter",
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.redAccent,
                          Colors.blueAccent,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Learn \n design \n   & code",
                          style: AppTextStyles.appTitle.copyWith(
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                            fontFamily: "Inter",
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                launcher.launchUrl(
                                    Uri.parse(
                                        'https://github.com/THARINDUnirmal'),
                                    mode: launcher
                                        .LaunchMode.externalApplication);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.53,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Colors.amber,
                                      Colors.red,
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Join with GitHub",
                                    style: AppTextStyles.appSubTitle.copyWith(
                                      color: Colors.black.withOpacity(0.7),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Or",
                              style: AppTextStyles.appLaegeDescription,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            IconButton(
                              onPressed: () {
                                launcher.launchUrl(
                                  Uri.parse(
                                      "mailto:tharindunirmal1111@gmail.com?subject=Hi&body=Hello"),
                                );
                              },
                              icon: const Icon(
                                Icons.mail,
                                size: 35,
                                color: AppColor.kWhiteColor,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.075,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Version - 1 . 117 v",
                              style: AppTextStyles.appSmallDescription,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
