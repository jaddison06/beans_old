import 'Display.dart';
import 'Event.dart';
import 'Drawable.dart';
import 'dart_codegen.dart';

class DisplayHandler {
  final Display display;
  final Event event;

  final List<Drawable> drawables = [];

  bool _quit = false;

  DisplayHandler({
    required this.display,
    required this.event,
  });

  void Quit() => _quit = true;

  void Start() {
    while (!_quit) {
      while (event.Poll() > 0) {
        if (event.type == EventType.Quit) Quit();
        for (var drawable in drawables) {
          drawable.OnEvent(event);
        }
      }
      for (var drawable in drawables) {
        drawable.Frame(display);
      }
      display.Flush();
    }
  }
}