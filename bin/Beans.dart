import 'dart_codegen.dart';
import 'V2.dart';
import 'DisplayHandler.dart';
import 'Colour.dart';
import 'Drawable.dart';

import 'Display.dart';
import 'SDLDisplay.dart';
import 'Event.dart';
import 'SDLEvent.dart';

class MouseFollower implements Drawable {
  V2 _mouse = V2.square(0);

  @override
  void Frame(Display display) {
    display.FillRect(_mouse, V2.square(60), Colour.yellow);
  }

  @override
  void OnEvent(Event event) {
    if (event.type == EventType.MouseMove) _mouse = event.pos;
  }
}

class Beans {
  V2 mouse = V2.square(0);

  late DisplayHandler dh;

  void Start() {
    final display = SDLDisplay();
    final event = SDLEvent();

    dh = DisplayHandler(
      display: display,
      event: event,
    );

    dh.drawables.add(MouseFollower());

    dh.Start();

    display.Destroy();
    event.Destroy();
  }
}