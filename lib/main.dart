import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:ssw/analytics.dart';
import 'package:ssw/assets.dart';
import 'package:ssw/extensions.dart';
import 'package:ssw/widgets.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(const StruggleSwitchApp());
}

class StruggleSwitchApp extends StatefulWidget {
  const StruggleSwitchApp({super.key});

  @override
  State<StruggleSwitchApp> createState() => _StruggleSwitchAppState();
}

class _StruggleSwitchAppState extends State<StruggleSwitchApp> {
  var struggling = true;

  void handleNotStruggling(_) {
    setState(() => struggling = false);
    Analytics.tapNotStruggling();
  }

  void handleStartOver() {
    setState(() => struggling = true);
    Analytics.tapStartOver();
  }

  void handleWatchVideo() {
    launchUrlString('https://www.youtube.com/watch?v=rCp1l16GCXI');
    Analytics.tapWatchVideo();
  }

  void handleViewCreator() {
    launchUrlString('https://twitter.com/luke_pighetti');
    Analytics.tapViewCreator();
  }

  void handleViewRepository() {
    launchUrlString('https://github.com/lukepighetti/struggle-switch');
    Analytics.tapViewRepository();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Struggle Switch',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.dark,
          background: Colors.grey.shade900, // deprecated in favor of surface
          surface: Colors.grey.shade900, // supercedes background, not working
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedVisibility(
                    visible: !struggling,
                    child: IconButton(
                      icon: const Icon(
                        PhosphorIconsRegular.arrowCounterClockwise,
                      ),
                      tooltip: "Start over",
                      onPressed: handleStartOver,
                    ),
                  ),
                  Text(
                    "Your Struggle Switch",
                    style: context.textHeadline,
                  ),
                  IconButton(
                    icon: const Icon(PhosphorIconsRegular.githubLogo),
                    onPressed: handleViewRepository,
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 96,
              child: FittedBox(
                fit: BoxFit.fill,
                child: IgnorePointer(
                  ignoring: !struggling,
                  child: CupertinoSwitch(
                    value: struggling,
                    onChanged: handleNotStruggling,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: context.textHeadline.fontSize! * 1.2,
              child: Stack(
                children: [
                  Image.asset(Assets.twemojiSlightlySmilingFace.assetPath),
                  AnimatedVisibility(
                    visible: struggling,
                    duration: const Duration(milliseconds: 150),
                    child: Image.asset(Assets.twemojiPleadingFace.assetPath),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text(
              "Intrusive thoughts? Commit to not engaging\nby turning off your struggle switch.",
              style: context.textBody,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Center(
                child: FilledButton.tonalIcon(
                  label: Text(
                    "Watch the Video",
                    style: context.textButton,
                  ),
                  icon: const Icon(PhosphorIconsFill.youtubeLogo),
                  onPressed: handleWatchVideo,
                ),
              ),
            ),
            // Spacer(),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Text.rich(
                TextSpan(children: [
                  const TextSpan(text: "Made with "),
                  WidgetSpan(
                    child: Image.asset(
                      Assets.twemojiRedHeart.assetPath,
                      width: context.textCaption.fontSize! * 1.2,
                    ),
                  ),
                  const TextSpan(text: " by "),
                  TextSpan(
                    text: "Luke Pighetti",
                    style: TextStyle(color: context.colorPrimary),
                    recognizer: TapGestureRecognizer()
                      ..onTap = handleViewCreator,
                  ),
                ]),
                style: context.textCaption,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
