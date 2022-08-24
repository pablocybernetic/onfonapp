import 'package:flutter/material.dart';
import 'package:onfonapp/constants/color.dart';
import 'package:onfonapp/conversation.dart';
import 'package:onfonapp/messages.dart';
import 'package:onfonapp/widgets/CustomCircle.dart';
import 'package:onfonapp/widgets/GlassMorphismContainer.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(

      // ),
      body: SingleChildScrollView(
          child: Container(
              alignment: Alignment.center,
              // width: Get.width,

              height: 800,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    purpleBack,
                    blueBack,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Stack(
                children: [
                  const Positioned(
                    left: -50,
                    top: 100 * 0.1,
                    child: CustomSphere(
                      height: 200,
                      width: 200,
                    ),
                  ),
                  const Positioned(
                    right: -50,
                    bottom: 100 * 0.1,
                    child: CustomSphere(
                      height: 200,
                      width: 200,
                    ),
                  ),
                  GlassMorphismContainer(
                      height: 350,
                      width: 350 * 0.8,
                      child: Column(children: [
                        Image.asset(
                          'assets/images/onfon_logo.png',
                          fit: BoxFit.cover,
                          height: 100.0,
                        ),
                        // Spacer(),

                        const Center(),
                        const Text(
                          "We purpose to add value to peoples' lives using the mobile phone through corporate solutions and services to individual consumers.",
                          style: TextStyle(
                            color: Color.fromRGBO(26, 22, 230, 1),
                            fontSize: 15,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.navigate_next_outlined),
                          highlightColor: Colors.pink,
                          iconSize: 39,
                          color: Colors.white,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const HomePage()));
                          },
                        ),
                      ])),
                  // const Text("data"),
                ],
              ))),
    );
  }
}
