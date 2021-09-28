import 'V2.dart';
import 'Colour.dart';

abstract class Display {
  V2 GetSize();
  V2 Flush();

  void DrawPoint(V2 pos, Colour colour);
  void DrawLine(V2 start, V2 end, Colour colour);
  void DrawRect(V2 start, V2 size, Colour colour);
  void FillRect(V2 start, V2 size, Colour colour);
}