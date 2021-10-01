import 'dart:ffi';
import 'package:ffi/ffi.dart';

class V2 {
  static Pointer<Int32> xPtr = nullptr, yPtr = nullptr;

  static void _initPointers() {
    if (xPtr.address == 0) xPtr = malloc<Int32>();
    if (yPtr.address == 0) yPtr = malloc<Int32>();
  }
  
  static void Destroy() {
    if (xPtr.address != 0) {
      malloc.free(xPtr);
      xPtr = nullptr;
    }
    if (yPtr.address != 0) {
      malloc.free(yPtr);
      yPtr = nullptr;
    }
  }

  int x, y;
  V2(this.x, this.y);

  static V2 square(int size) => V2(size, size);

  static V2 fromPointers(void Function(Pointer<Int32>, Pointer<Int32>) populate) {
    _initPointers();
    populate(xPtr, yPtr);
    return V2(xPtr.value, yPtr.value);
  }
}