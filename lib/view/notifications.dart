import 'package:constitution_of_india/provider/notifications_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  void initState() {
    print("Schedule");
    context.read<NotificationProvider>().getnotifications();
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: context.watch<NotificationProvider>().response!.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/image/background.png"),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    title: const Text("THE CONSTITUTION OF INDIA"),
                    leading: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset("assets/image/schedule/back.png"),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.height * 0.8,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/image/notification_input box.png"),
                          fit: BoxFit.fill),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "NOTIFICATIONS",
                          style: TextStyle(fontSize: 25),
                        ),
                        Image.asset("assets/image/notification bell_icon.png")
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: context
                          .watch<NotificationProvider>()
                          .response!
                          .length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: MediaQuery.sizeOf(context).height * 0.08,
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/image/schedule/schedule1_inputbox.png"),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "${context.watch<NotificationProvider>().response![index].smallDescription}",
                                style: TextStyle(fontSize: 25),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
