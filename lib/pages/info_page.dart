import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.sizeOf(context).height;
    final sWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 174, 146, 110), // Light brown
              Color.fromARGB(255, 177, 171, 122), // Soft yellow
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //space
              SizedBox(
                height: sHeight * .04,
              ),

              Text(
                textAlign: TextAlign.start,
                "ToneLab is your all-in-one frequency generator, built for anyone looking to explore the depths of sound with precision and style! Whether you're a musician tuning instruments, an audio technician testing equipment, or a sound enthusiast experimenting with tones, ToneLab delivers crystal-clear frequencies and an intuitive design to amplify your audio experience.",
                style: TextStyle(
                  fontSize: sHeight * .025,
                  color: Colors.brown,
                ),
              ),

              //text
              Text(
                textAlign: TextAlign.start,
                "Whether you’re tuning, testing, or just having fun, ToneLab brings professional-level frequency generation right to your fingertips. Begin your audio adventure with ToneLab today and unlock the true power of sound!",
                style: TextStyle(
                  fontSize: sHeight * .025,
                  color: Colors.yellow.shade700,
                ),
              ),

              //space
              SizedBox(
                height: sHeight * .1,
              ),

              //feedback button
              // GestureDetector(
              //   onTap: () async {
              //     final GoogleSignInAccount? user;
              //     if (await GoogleSignIn().isSignedIn()) {
              //       user = GoogleSignIn().currentUser;
              //     } else {
              //       user =
              //           await GoogleSignIn(scopes: ["https://mail.google.com/"])
              //               .signIn();
              //     }

              //     //user email
              //     final email = user!.email;

              //     //user email
              //     final name = user.displayName;

              //     final auth = await user.authentication;

              //     final token = auth.accessToken;

              //     final SmtpServer = gmailSaslXoauth2(email, token!);

              //     final message = Message()
              //       ..from = Address(email, name)
              //       ..recipients = ['masagar59@gmail.com']
              //       ..subject = "Hello tone lab"
              //       ..text = "This is a test message";

              //     try {
              //       await send(message, SmtpServer);

              //       ScaffoldMessenger.of(context).showSnackBar(
              //         SnackBar(
              //           content: Text("Email send successfully...!"),
              //         ),
              //       );
              //     } on MailerException catch (e) {
              //       print(e);
              //     }

              //     await GoogleSignIn().signOut();
              //   },
              //   child: Container(
              //     width: sWidth,
              //     height: sHeight * .1,
              //     decoration: BoxDecoration(
              //       color: Colors.brown.shade600,
              //       borderRadius: BorderRadius.circular(100),
              //       border: Border.all(
              //         color: Colors.yellow.shade700,
              //         width: 4,
              //       ),
              //       boxShadow: <BoxShadow>[
              //         BoxShadow(
              //           color: Colors.brown.shade300,
              //           blurRadius: 8,
              //           spreadRadius: 5,
              //         )
              //       ],
              //     ),
              //     child: Center(
              //       child: Text(
              //         "We’d love your feedback!",
              //         style: TextStyle(
              //           fontSize: sHeight * .035,
              //           color: Colors.yellow.shade700,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

              //space
              SizedBox(
                height: sHeight * .02,
              ),

              //close button
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: sWidth,
                  height: sHeight * .1,
                  decoration: BoxDecoration(
                    color: Colors.brown.shade600,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Colors.yellow.shade700,
                      width: 4,
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.brown.shade300,
                        blurRadius: 8,
                        spreadRadius: 5,
                      )
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "Close",
                      style: TextStyle(
                        fontSize: sHeight * .06,
                        color: Colors.yellow.shade700,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
