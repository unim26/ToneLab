import 'package:ToneLab/my_cicular_slider.dart';
import 'package:ToneLab/my_painter.dart';
import 'package:ToneLab/pages/info_page.dart';
import 'package:flutter/material.dart';
import 'package:sound_generator/sound_generator.dart';
import 'package:sound_generator/waveTypes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPlaying = false;
  double frequency = 440;
  double balance = 0;
  double volume = 1;
  waveTypes waveType = waveTypes.SINUSOIDAL;
  int sampleRate = 96000;
  List<int>? oneCycleData;

  @override
  void initState() {
    super.initState();

    isPlaying = false;

    SoundGenerator.init(sampleRate);

    SoundGenerator.onIsPlayingChanged.listen((value) {
      setState(() {
        isPlaying = value;
      });
    });

    SoundGenerator.onOneCycleDataHandler.listen((value) {
      setState(() {
        oneCycleData = value;
      });
    });

    SoundGenerator.setAutoUpdateOneCycleSample(true);

    SoundGenerator.refreshOneCycleData();
  }

  @override
  void dispose() {
    super.dispose();
    SoundGenerator.release();
  }

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.sizeOf(context).height;
    final sWidth = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Scaffold(
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
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                //app name
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //space
                    SizedBox(
                      width: sWidth * .15,
                    ),
                    Text(
                      "Tone",
                      style: TextStyle(
                        fontSize: sHeight * .05,
                        color: Colors.brown,
                        
                      ),
                    ),
                    Text(
                      "Lab",
                      style: TextStyle(
                        fontSize: sHeight * .05,
                        color: Colors.yellow.shade700,
                      ),
                    ),

                    //space
                    SizedBox(
                      width: sWidth * .15,
                    ),

                    //icon
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const InfoPage(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.info_outline_rounded,
                        color: Colors.brown,
                        size: sHeight * .04,
                      ),
                    ),
                  ],
                ),

                //divider
                Divider(
                  color: Colors.yellow.shade700,
                  thickness: 2,
                ),

                //graph
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.brown,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        width: 2,
                      )),
                  // color: Colors.white54,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 2,
                    vertical: 10,
                  ),
                  child: oneCycleData != null
                      ? CustomPaint(
                          painter: MyPainter(oneCycleData!),
                        )
                      : Container(),
                ),

                SizedBox(
                  height: sHeight * .02,
                ),

                //wave form
                Text(
                  "Wave Form",
                  style: TextStyle(
                    fontSize: sHeight * .035,
                    color: Colors.yellow.shade700,
                  ),
                ),
                Center(
                  child: DropdownButton<waveTypes>(
                    borderRadius: BorderRadius.circular(20),
                    dropdownColor: Colors.brown.shade200,
                    elevation: 0,
                    value: waveType,
                    onChanged: (waveTypes? newValue) {
                      setState(() {
                        waveType = newValue!;
                        SoundGenerator.setWaveType(waveType);
                      });
                    },
                    items: waveTypes.values.map((waveTypes classType) {
                      return DropdownMenuItem<waveTypes>(
                        value: classType,
                        child: Text(
                          classType.toString().split('.').last,
                          style: const TextStyle(
                            color: Colors.brown,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                //space
                SizedBox(
                  height: sHeight * .025,
                ),

                //volume and balanced sliders
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //volume
                    MyCicularSlider(
                      notation: "%",
                      title: "Volume",
                      fontsize: sHeight,
                      minvalue: 0,
                      maxvalue: 100,
                      initialValue: 50,
                      onChange: (value) {
                        setState(() {
                          volume = value.toDouble();
                          SoundGenerator.setVolume(volume);
                        });
                      },
                    ),

                    //balnce
                    MyCicularSlider(
                      notation: "",
                      title: "Balance",
                      fontsize: sHeight,
                      minvalue: -1,
                      maxvalue: 1,
                      initialValue: 0,
                      onChange: (value) {
                        setState(() {
                          balance = value.toDouble();
                          SoundGenerator.setBalance(balance);
                        });
                      },
                    ),
                  ],
                ),

                //frequency
                MyCicularSlider(
                  notation: "Hz",
                  title: "Frequency",
                  fontsize: sHeight,
                  minvalue: 20,
                  maxvalue: 20000,
                  initialValue: 440,
                  onChange: (value) {
                    setState(() {
                      frequency = value.toDouble();
                      SoundGenerator.setFrequency(frequency);
                    });
                  },
                ),

                //play pause button
                Container(
                  width: sWidth * .23,
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
                        blurRadius: 5,
                        spreadRadius: 3,
                      )
                    ],
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        isPlaying
                            ? SoundGenerator.stop()
                            : SoundGenerator.play();
                      },
                      icon: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.yellow.shade700,
                        size: sWidth * .15,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
