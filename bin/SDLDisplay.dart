import 'dart_codegen.dart';
import 'Display.dart';
import 'V2.dart';
import 'Colour.dart';

class SDLDisplay implements Display {
  final SDLDisplayRaw _display;

  SDLDisplay() :
    _display = SDLDisplayRaw('SDLDisplay');
  
  void Destroy() {
    _display.Destroy();
  }

  @override
  V2 get size => V2.fromPointers((x, y) => _display.GetSize(x, y));

  @override
  int get frameCount => _display.frameCount;

  @override
  void Flush() {
    _display.Flush();
  }

  @override
  void DrawPoint(V2 pos, Colour colour) {
    _display.DrawPoint(pos.x, pos.y, colour.r, colour.g, colour.b);
  }

  @override
  void DrawLine(V2 start, V2 end, Colour colour) {
    _display.DrawLine(start.x, start.y, end.x, end.y, colour.r, colour.g, colour.b);
  }

  @override
  void DrawRect(V2 start, V2 size, Colour colour) {
    _display.DrawRect(start.x, start.y, size.x, size.y, colour.r, colour.g, colour.b);
  }

  @override
  void FillRect(V2 start, V2 size, Colour colour) {
    _display.FillRect(start.x, start.y, size.x, size.y, colour.r, colour.g, colour.b);
  }
}