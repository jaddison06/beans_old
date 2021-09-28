import 'dart_codegen.dart';
import 'V2.dart';

void main(List<String> arguments) {
  final display = SDLDisplay('Test');

  final event = SDLEvent();
  var quit = false;
  var mouse = V2(0, 0);
  while (!quit) {
    while (event.Poll() > 0) {
      switch (event.type) {
        case SDLEventType.Quit: {
          quit = true;
          break;
        }
        case SDLEventType.MouseMove: {
          mouse.x = event.x;
          mouse.y = event.y;
          break;
        }
        case SDLEventType.KeyDown: {
          if (event.key == KeyCode.Escape) quit = true;
          break;
        }
        default: {}
      }
    }

    display.FillRect(mouse.x, mouse.y, 60, 60, 255, 255, 0);
    display.Flush();
  }
}
