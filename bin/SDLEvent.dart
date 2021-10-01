import 'dart_codegen.dart';
import 'V2.dart';
import 'Event.dart';

class SDLEvent extends SDLEventRaw implements Event {
  @override
  V2 get pos => V2(x, y);
}