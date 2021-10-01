import 'Display.dart';
import 'V2.dart';
import 'Event.dart';

abstract class Drawable {
  void Frame(Display display);
  void OnEvent(Event event);
}