
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/theme.dart';
import '../../../../widget/custom_button.dart';

class DialogWithScrollableContent extends StatefulWidget {
  const DialogWithScrollableContent({super.key});

  @override
  State<DialogWithScrollableContent> createState() =>
      _DialogWithScrollableContentState();
}

class _DialogWithScrollableContentState
    extends State<DialogWithScrollableContent> {
  
  late ColorNotifier notifier;
  
  List title = [
    "Develop across all platforms",
    "Speed & Performance",
    "Incredible tooling",
    "Loved by millions",
    "What is Angular?",
    "Architecture overview",
  ];

  List text = [
    "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.",
    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
    "Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.",
    "From prototype through global deployment, Angular delivers the productivity and scalable infrastructure that supports Google's largest applications.",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    "Angular is a platform and framework for building client applications in HTML and TypeScript. Angular is itself written in TypeScript. It implements core and optional functionality as a set of TypeScript libraries that you import into your apps.\n\nThe basic building blocks of an Angular application are NgModules, which provide a compilation context for components. NgModules collect related code into functional sets; an Angular app is defined by a set of NgModules. An app always has at least a root module that enables bootstrapping, and typically has many more feature modules.\n\nComponents define views, which are sets of screen elements that Angular can choose among and modify according to your program logic and data. Every app has at least a root component.\n\nComponents use services, which provide specific functionality not directly related to views. Service providers can be injected into components as dependencies, making your code modular, reusable, and efficient.\n\nBoth components and services are simply classes, with decorators that mark their type and provide metadata that tells Angular how to use them.\n\nThe metadata for a component class associates it with a template that defines a view. A template combines ordinary HTML with Angular directives and binding markup that allow Angular to modify the HTML before rendering it for display.\n\nThe metadata for a service class provides the information Angular needs to make it available to components through Dependency Injection (DI).\n\nAn app's components typically define many views, arranged hierarchically. Angular provides the Router service to help you define navigation paths among views. The router provides sophisticated in-browser navigational capabilities."
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    
    notifier = Provider.of(context,listen: true);
    
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: notifier.getBgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dialog With Scrollable Content",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: notifier.text,
                ),
              ),
              SizedBox(height: 15),
              CustomButton(
                text: "Open dialog",
                bgcolor: Color(0xFF343dff),
                onPressed: () {
                  showDialog(
                    useSafeArea: true,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: notifier.getBgColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        title: Text("Install Angular"),
                        titleTextStyle: TextStyle(
                          fontFamily: "Outfit",
                          fontSize: 25,
                          color: notifier.text,
                        ),
                        content: SizedBox(
                          width: width < 800 ? width / 1.5 : width / 3,
                          height: 400,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (var i = 0; i < title.length; i++)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        title[i],
                                        style: TextStyle(
                                          fontSize: 21,
                                          fontWeight: FontWeight.w600,
                                          color: notifier.text,
                                        ),
                                      ),
                                      Text(
                                        text[i],
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
                        actions: [
                          CustomButton(
                            text: "No Thanks",
                            textcolor: Color(0xFFe74c3c),
                            hovercolor: Color(0xFFe74c3c),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            width: 150,
                          ),
                          CustomButton(
                            text: "Install",
                            textcolor: notifier.text,
                            hovercolor: Color(0xFF0f79f3),
                            width: 100,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      );
                    },
                  );
                },
                width: 150,
                fonatweidth: FontWeight.w600,
              ),
            ],
          ),
        );
      },
    );
  }
}
