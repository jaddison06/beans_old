// for native types & basic FFI functionality
import 'dart:ffi';
// for string utils
import 'package:ffi/ffi.dart';
// for @mustCallSuper
import 'package:meta/meta.dart';

// ----------FILE: NATIVE/TEST.GEN----------

// ----------FUNCTION SIGNATURE TYPEDEFS----------

// int hello()
typedef _libTest_func_hello_native_sig = Int32 Function();
typedef _libTest_func_hello_sig = int Function();

// ----------LIBTEST----------

class libTest {

    static _libTest_func_hello_sig? _hello;

    void _initRefs() {
        if (
            _hello == null
        ) {
            final lib = DynamicLibrary.open('build/native/libTest.so');

            _hello = lib.lookupFunction<_libTest_func_hello_native_sig, _libTest_func_hello_sig>('hello');
        }
    }

    libTest() {
        _initRefs();
    }

    int hello() {
        return _hello!();
    }

}


