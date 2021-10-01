// for native types & basic FFI functionality
import 'dart:ffi';
// for string utils
import 'package:ffi/ffi.dart';
// for @mustCallSuper
import 'package:meta/meta.dart';

// ----------FILE: NATIVE/EVENTS.GEN----------

// ----------ENUMS----------

enum EventType {
    None,
    Quit,
    KeyDown,
    KeyUp,
    MouseMove,
    MouseDown,
    MouseUp,
    MouseScroll,
}

EventType EventTypeFromInt(int val) => EventType.values[val];
int EventTypeToInt(EventType val) => EventType.values.indexOf(val);

String EventTypeToString(EventType val) {
    switch (val) {
        case EventType.None: { return 'None'; }
        case EventType.Quit: { return 'Quit'; }
        case EventType.KeyDown: { return 'KeyDown'; }
        case EventType.KeyUp: { return 'KeyUp'; }
        case EventType.MouseMove: { return 'MouseMove'; }
        case EventType.MouseDown: { return 'MouseDown'; }
        case EventType.MouseUp: { return 'MouseUp'; }
        case EventType.MouseScroll: { return 'MouseScroll'; }
    }
}

enum MouseButton {
    Left,
    Right,
    Middle,
    Unknown,
}

MouseButton MouseButtonFromInt(int val) => MouseButton.values[val];
int MouseButtonToInt(MouseButton val) => MouseButton.values.indexOf(val);

String MouseButtonToString(MouseButton val) {
    switch (val) {
        case MouseButton.Left: { return 'Left'; }
        case MouseButton.Right: { return 'Right'; }
        case MouseButton.Middle: { return 'Middle'; }
        case MouseButton.Unknown: { return 'Unknown'; }
    }
}

enum KeyCode {
    A,
    B,
    C,
    D,
    E,
    F,
    G,
    H,
    I,
    J,
    K,
    L,
    M,
    N,
    O,
    P,
    Q,
    R,
    S,
    T,
    U,
    V,
    W,
    X,
    Y,
    Z,
    One,
    Two,
    Three,
    Four,
    Five,
    Six,
    Seven,
    Eight,
    Nine,
    Zero,
    Exclamation,
    Question,
    DoubleQuote,
    SingleQuote,
    Pound,
    Dollar,
    Percent,
    Caret,
    Ampersand,
    Asterisk,
    Hyphen,
    Underscore,
    Equals,
    Plus,
    Pipe,
    Semicolon,
    Colon,
    At,
    Tilde,
    Hash,
    Backtick,
    ForwardSlash,
    BackSlash,
    NormalBracketL,
    NormalBracketR,
    SquareBracketL,
    SquareBracketR,
    CurlyBraceL,
    CurlyBraceR,
    SmallerThan,
    GreaterThan,
    Return,
    Escape,
    Backspace,
    Delete,
    Tab,
    Space,
    Insert,
    Home,
    End,
    PageUp,
    PageDown,
    ArrowRight,
    ArrowLeft,
    ArrowDown,
    ArrowUp,
    NumpadDivide,
    NumpadMultiply,
    NumpadSubtract,
    NumpadAdd,
    NumpadEquals,
    NumpadEnter,
    NumpadDecimalPoint,
    NumpadOne,
    NumpadTwo,
    NumpadThree,
    NumpadFour,
    NumpadFive,
    NumpadSix,
    NumpadSeven,
    NumpadEight,
    NumpadNine,
    NumpadZero,
    Function_F1,
    Function_F2,
    Function_F3,
    Function_F4,
    Function_F5,
    Function_F6,
    Function_F7,
    Function_F8,
    Function_F9,
    Function_F10,
    Function_F11,
    Function_F12,
    LControl,
    RControl,
    LShift,
    RShift,
    LAlt,
    RAlt,
    AudioNext,
    AudioPrev,
    AudioStop,
    AudioPlay,
    Unknown,
}

KeyCode KeyCodeFromInt(int val) => KeyCode.values[val];
int KeyCodeToInt(KeyCode val) => KeyCode.values.indexOf(val);

String KeyCodeToString(KeyCode val) {
    switch (val) {
        case KeyCode.A: { return 'A'; }
        case KeyCode.B: { return 'B'; }
        case KeyCode.C: { return 'C'; }
        case KeyCode.D: { return 'D'; }
        case KeyCode.E: { return 'E'; }
        case KeyCode.F: { return 'F'; }
        case KeyCode.G: { return 'G'; }
        case KeyCode.H: { return 'H'; }
        case KeyCode.I: { return 'I'; }
        case KeyCode.J: { return 'J'; }
        case KeyCode.K: { return 'K'; }
        case KeyCode.L: { return 'L'; }
        case KeyCode.M: { return 'M'; }
        case KeyCode.N: { return 'N'; }
        case KeyCode.O: { return 'O'; }
        case KeyCode.P: { return 'P'; }
        case KeyCode.Q: { return 'Q'; }
        case KeyCode.R: { return 'R'; }
        case KeyCode.S: { return 'S'; }
        case KeyCode.T: { return 'T'; }
        case KeyCode.U: { return 'U'; }
        case KeyCode.V: { return 'V'; }
        case KeyCode.W: { return 'W'; }
        case KeyCode.X: { return 'X'; }
        case KeyCode.Y: { return 'Y'; }
        case KeyCode.Z: { return 'Z'; }
        case KeyCode.One: { return '1'; }
        case KeyCode.Two: { return '2'; }
        case KeyCode.Three: { return '3'; }
        case KeyCode.Four: { return '4'; }
        case KeyCode.Five: { return '5'; }
        case KeyCode.Six: { return '6'; }
        case KeyCode.Seven: { return '7'; }
        case KeyCode.Eight: { return '8'; }
        case KeyCode.Nine: { return '9'; }
        case KeyCode.Zero: { return '0'; }
        case KeyCode.Exclamation: { return '!'; }
        case KeyCode.Question: { return '?'; }
        case KeyCode.DoubleQuote: { return '"'; }
        case KeyCode.SingleQuote: { return '\''; }
        case KeyCode.Pound: { return '£'; }
        case KeyCode.Dollar: { return '\$'; }
        case KeyCode.Percent: { return '%'; }
        case KeyCode.Caret: { return '^'; }
        case KeyCode.Ampersand: { return '&'; }
        case KeyCode.Asterisk: { return '*'; }
        case KeyCode.Hyphen: { return '-'; }
        case KeyCode.Underscore: { return '_'; }
        case KeyCode.Equals: { return '='; }
        case KeyCode.Plus: { return '+'; }
        case KeyCode.Pipe: { return '|'; }
        case KeyCode.Semicolon: { return ';'; }
        case KeyCode.Colon: { return ':'; }
        case KeyCode.At: { return '@'; }
        case KeyCode.Tilde: { return '~'; }
        case KeyCode.Hash: { return '#'; }
        case KeyCode.Backtick: { return '`'; }
        case KeyCode.ForwardSlash: { return '/'; }
        case KeyCode.BackSlash: { return '\\'; }
        case KeyCode.NormalBracketL: { return '('; }
        case KeyCode.NormalBracketR: { return ')'; }
        case KeyCode.SquareBracketL: { return '['; }
        case KeyCode.SquareBracketR: { return ']'; }
        case KeyCode.CurlyBraceL: { return '{'; }
        case KeyCode.CurlyBraceR: { return '}'; }
        case KeyCode.SmallerThan: { return '<'; }
        case KeyCode.GreaterThan: { return '>'; }
        case KeyCode.Return: { return 'Return'; }
        case KeyCode.Escape: { return 'Escape'; }
        case KeyCode.Backspace: { return 'Backspace'; }
        case KeyCode.Delete: { return 'Delete'; }
        case KeyCode.Tab: { return 'Tab'; }
        case KeyCode.Space: { return 'Space'; }
        case KeyCode.Insert: { return 'Insert'; }
        case KeyCode.Home: { return 'Home'; }
        case KeyCode.End: { return 'End'; }
        case KeyCode.PageUp: { return 'PageUp'; }
        case KeyCode.PageDown: { return 'PageDown'; }
        case KeyCode.ArrowRight: { return 'ArrowRight'; }
        case KeyCode.ArrowLeft: { return 'ArrowLeft'; }
        case KeyCode.ArrowDown: { return 'ArrowDown'; }
        case KeyCode.ArrowUp: { return 'ArrowUp'; }
        case KeyCode.NumpadDivide: { return 'NumpadDivide'; }
        case KeyCode.NumpadMultiply: { return 'NumpadMultiply'; }
        case KeyCode.NumpadSubtract: { return 'NumpadSubtract'; }
        case KeyCode.NumpadAdd: { return 'NumpadAdd'; }
        case KeyCode.NumpadEquals: { return 'NumpadEquals'; }
        case KeyCode.NumpadEnter: { return 'NumpadEnter'; }
        case KeyCode.NumpadDecimalPoint: { return 'NumpadDecimalPoint'; }
        case KeyCode.NumpadOne: { return '1'; }
        case KeyCode.NumpadTwo: { return '2'; }
        case KeyCode.NumpadThree: { return '3'; }
        case KeyCode.NumpadFour: { return '4'; }
        case KeyCode.NumpadFive: { return '5'; }
        case KeyCode.NumpadSix: { return '6'; }
        case KeyCode.NumpadSeven: { return '7'; }
        case KeyCode.NumpadEight: { return '8'; }
        case KeyCode.NumpadNine: { return '9'; }
        case KeyCode.NumpadZero: { return '0'; }
        case KeyCode.Function_F1: { return 'F1'; }
        case KeyCode.Function_F2: { return 'F2'; }
        case KeyCode.Function_F3: { return 'F3'; }
        case KeyCode.Function_F4: { return 'F4'; }
        case KeyCode.Function_F5: { return 'F5'; }
        case KeyCode.Function_F6: { return 'F6'; }
        case KeyCode.Function_F7: { return 'F7'; }
        case KeyCode.Function_F8: { return 'F8'; }
        case KeyCode.Function_F9: { return 'F9'; }
        case KeyCode.Function_F10: { return 'F10'; }
        case KeyCode.Function_F11: { return 'F11'; }
        case KeyCode.Function_F12: { return 'F12'; }
        case KeyCode.LControl: { return 'LControl'; }
        case KeyCode.RControl: { return 'RControl'; }
        case KeyCode.LShift: { return 'LShift'; }
        case KeyCode.RShift: { return 'RShift'; }
        case KeyCode.LAlt: { return 'LAlt'; }
        case KeyCode.RAlt: { return 'RAlt'; }
        case KeyCode.AudioNext: { return 'AudioNext'; }
        case KeyCode.AudioPrev: { return 'AudioPrev'; }
        case KeyCode.AudioStop: { return 'AudioStop'; }
        case KeyCode.AudioPlay: { return 'AudioPlay'; }
        case KeyCode.Unknown: { return 'Unknown'; }
    }
}

// ----------FILE: NATIVE/SDL/SDLEVENT.GEN----------

// ----------FUNC SIG TYPEDEFS FOR CLASSES----------

// ----------SDLEVENTRAW----------

// void* SEInit()
typedef _libSDLEvent_class_SDLEventRaw_method_SEInit_native_sig = Pointer<Void> Function();
typedef _libSDLEvent_class_SDLEventRaw_method_SEInit_sig = Pointer<Void> Function();

// void SEDestroy(void* struct_ptr)
typedef _libSDLEvent_class_SDLEventRaw_method_SEDestroy_native_sig = Void Function(Pointer<Void>);
typedef _libSDLEvent_class_SDLEventRaw_method_SEDestroy_sig = void Function(Pointer<Void>);

// int GetX(void* struct_ptr)
typedef _libSDLEvent_class_SDLEventRaw_method_GetX_native_sig = Int32 Function(Pointer<Void>);
typedef _libSDLEvent_class_SDLEventRaw_method_GetX_sig = int Function(Pointer<Void>);

// int GetY(void* struct_ptr)
typedef _libSDLEvent_class_SDLEventRaw_method_GetY_native_sig = Int32 Function(Pointer<Void>);
typedef _libSDLEvent_class_SDLEventRaw_method_GetY_sig = int Function(Pointer<Void>);

// KeyCode GetKey(void* struct_ptr)
typedef _libSDLEvent_class_SDLEventRaw_method_GetKey_native_sig = Int32 Function(Pointer<Void>);
typedef _libSDLEvent_class_SDLEventRaw_method_GetKey_sig = int Function(Pointer<Void>);

// MouseButton GetMouseButton(void* struct_ptr)
typedef _libSDLEvent_class_SDLEventRaw_method_GetMouseButton_native_sig = Int32 Function(Pointer<Void>);
typedef _libSDLEvent_class_SDLEventRaw_method_GetMouseButton_sig = int Function(Pointer<Void>);

// EventType GetType(void* struct_ptr)
typedef _libSDLEvent_class_SDLEventRaw_method_GetType_native_sig = Int32 Function(Pointer<Void>);
typedef _libSDLEvent_class_SDLEventRaw_method_GetType_sig = int Function(Pointer<Void>);

// int Poll(void* struct_ptr)
typedef _libSDLEvent_class_SDLEventRaw_method_Poll_native_sig = Int32 Function(Pointer<Void>);
typedef _libSDLEvent_class_SDLEventRaw_method_Poll_sig = int Function(Pointer<Void>);

// ----------CLASS IMPLEMENTATIONS----------

class SDLEventRaw {
    Pointer<Void> structPointer = nullptr;

    void _validatePointer(String methodName) {
        if (structPointer.address == 0) {
            throw Exception('SDLEventRaw.$methodName was called, but structPointer is a nullptr.');
        }
    }

    static _libSDLEvent_class_SDLEventRaw_method_SEInit_sig? _SEInit;
    static _libSDLEvent_class_SDLEventRaw_method_SEDestroy_sig? _SEDestroy;
    static _libSDLEvent_class_SDLEventRaw_method_GetX_sig? _GetX;
    static _libSDLEvent_class_SDLEventRaw_method_GetY_sig? _GetY;
    static _libSDLEvent_class_SDLEventRaw_method_GetKey_sig? _GetKey;
    static _libSDLEvent_class_SDLEventRaw_method_GetMouseButton_sig? _GetMouseButton;
    static _libSDLEvent_class_SDLEventRaw_method_GetType_sig? _GetType;
    static _libSDLEvent_class_SDLEventRaw_method_Poll_sig? _Poll;

    void _initRefs() {
        if (
            _SEInit == null ||
            _SEDestroy == null ||
            _GetX == null ||
            _GetY == null ||
            _GetKey == null ||
            _GetMouseButton == null ||
            _GetType == null ||
            _Poll == null
        ) {
            final lib = DynamicLibrary.open('build/native/SDL/libSDLEvent.so');

            _SEInit = lib.lookupFunction<_libSDLEvent_class_SDLEventRaw_method_SEInit_native_sig, _libSDLEvent_class_SDLEventRaw_method_SEInit_sig>('SEInit');
            _SEDestroy = lib.lookupFunction<_libSDLEvent_class_SDLEventRaw_method_SEDestroy_native_sig, _libSDLEvent_class_SDLEventRaw_method_SEDestroy_sig>('SEDestroy');
            _GetX = lib.lookupFunction<_libSDLEvent_class_SDLEventRaw_method_GetX_native_sig, _libSDLEvent_class_SDLEventRaw_method_GetX_sig>('GetX');
            _GetY = lib.lookupFunction<_libSDLEvent_class_SDLEventRaw_method_GetY_native_sig, _libSDLEvent_class_SDLEventRaw_method_GetY_sig>('GetY');
            _GetKey = lib.lookupFunction<_libSDLEvent_class_SDLEventRaw_method_GetKey_native_sig, _libSDLEvent_class_SDLEventRaw_method_GetKey_sig>('GetKey');
            _GetMouseButton = lib.lookupFunction<_libSDLEvent_class_SDLEventRaw_method_GetMouseButton_native_sig, _libSDLEvent_class_SDLEventRaw_method_GetMouseButton_sig>('GetMouseButton');
            _GetType = lib.lookupFunction<_libSDLEvent_class_SDLEventRaw_method_GetType_native_sig, _libSDLEvent_class_SDLEventRaw_method_GetType_sig>('GetType');
            _Poll = lib.lookupFunction<_libSDLEvent_class_SDLEventRaw_method_Poll_native_sig, _libSDLEvent_class_SDLEventRaw_method_Poll_sig>('Poll');
        }
    }

    SDLEventRaw() {
        _initRefs();
        structPointer = _SEInit!();
    }

    SDLEventRaw.fromPointer(Pointer<Void> ptr) {
        _initRefs();
        structPointer = ptr;
    }

    @mustCallSuper
    void Destroy() {
        _validatePointer('Destroy');
        final out = _SEDestroy!(structPointer);

        // this method invalidates the pointer, probably by freeing memory
        structPointer = nullptr;

        return out;
    }

    int get x {
        _validatePointer('x');
        return _GetX!(structPointer);
    }

    int get y {
        _validatePointer('y');
        return _GetY!(structPointer);
    }

    KeyCode get key {
        _validatePointer('key');
        return KeyCodeFromInt(_GetKey!(structPointer));
    }

    MouseButton get mouseButton {
        _validatePointer('mouseButton');
        return MouseButtonFromInt(_GetMouseButton!(structPointer));
    }

    EventType get type {
        _validatePointer('type');
        return EventTypeFromInt(_GetType!(structPointer));
    }

    int Poll() {
        _validatePointer('Poll');
        return _Poll!(structPointer);
    }

}

// ----------FILE: NATIVE/SDL/SDLDISPLAY.GEN----------

// ----------ENUMS----------

enum SDLInitErrorCode {
    Success,
    InitVideo_Fail,
    CreateWindow_Fail,
    CreateRenderer_Fail,
}

SDLInitErrorCode SDLInitErrorCodeFromInt(int val) => SDLInitErrorCode.values[val];
int SDLInitErrorCodeToInt(SDLInitErrorCode val) => SDLInitErrorCode.values.indexOf(val);

String SDLInitErrorCodeToString(SDLInitErrorCode val) {
    switch (val) {
        case SDLInitErrorCode.Success: { return 'Success'; }
        case SDLInitErrorCode.InitVideo_Fail: { return 'SDL_InitVideo() failed'; }
        case SDLInitErrorCode.CreateWindow_Fail: { return 'SDL_CreateWindow() failed'; }
        case SDLInitErrorCode.CreateRenderer_Fail: { return 'SDL_CreateRenderer() failed'; }
    }
}

// ----------FUNC SIG TYPEDEFS FOR CLASSES----------

// ----------SDLDISPLAYRAW----------

// void* SDInit(char* title)
typedef _libSDLDisplay_class_SDLDisplayRaw_method_SDInit_native_sig = Pointer<Void> Function(Pointer<Utf8>);
typedef _libSDLDisplay_class_SDLDisplayRaw_method_SDInit_sig = Pointer<Void> Function(Pointer<Utf8>);

// SDLInitErrorCode SDGetErrorCode(void* struct_ptr)
typedef _libSDLDisplay_class_SDLDisplayRaw_method_SDGetErrorCode_native_sig = Int32 Function(Pointer<Void>);
typedef _libSDLDisplay_class_SDLDisplayRaw_method_SDGetErrorCode_sig = int Function(Pointer<Void>);

// int SDGetFrameCount(void* struct_ptr)
typedef _libSDLDisplay_class_SDLDisplayRaw_method_SDGetFrameCount_native_sig = Int32 Function(Pointer<Void>);
typedef _libSDLDisplay_class_SDLDisplayRaw_method_SDGetFrameCount_sig = int Function(Pointer<Void>);

// void SDDestroy(void* struct_ptr)
typedef _libSDLDisplay_class_SDLDisplayRaw_method_SDDestroy_native_sig = Void Function(Pointer<Void>);
typedef _libSDLDisplay_class_SDLDisplayRaw_method_SDDestroy_sig = void Function(Pointer<Void>);

// void GetSize(void* struct_ptr, int* width, int* height)
typedef _libSDLDisplay_class_SDLDisplayRaw_method_GetSize_native_sig = Void Function(Pointer<Void>, Pointer<Int32>, Pointer<Int32>);
typedef _libSDLDisplay_class_SDLDisplayRaw_method_GetSize_sig = void Function(Pointer<Void>, Pointer<Int32>, Pointer<Int32>);

// void Flush(void* struct_ptr)
typedef _libSDLDisplay_class_SDLDisplayRaw_method_Flush_native_sig = Void Function(Pointer<Void>);
typedef _libSDLDisplay_class_SDLDisplayRaw_method_Flush_sig = void Function(Pointer<Void>);

// void DrawPoint(void* struct_ptr, int x, int y, int r, int g, int b)
typedef _libSDLDisplay_class_SDLDisplayRaw_method_DrawPoint_native_sig = Void Function(Pointer<Void>, Int32, Int32, Int32, Int32, Int32);
typedef _libSDLDisplay_class_SDLDisplayRaw_method_DrawPoint_sig = void Function(Pointer<Void>, int, int, int, int, int);

// void DrawLine(void* struct_ptr, int x1, int y1, int x2, int y2, int r, int g, int b)
typedef _libSDLDisplay_class_SDLDisplayRaw_method_DrawLine_native_sig = Void Function(Pointer<Void>, Int32, Int32, Int32, Int32, Int32, Int32, Int32);
typedef _libSDLDisplay_class_SDLDisplayRaw_method_DrawLine_sig = void Function(Pointer<Void>, int, int, int, int, int, int, int);

// void DrawRect(void* struct_ptr, int x, int y, int w, int h, int r, int g, int b)
typedef _libSDLDisplay_class_SDLDisplayRaw_method_DrawRect_native_sig = Void Function(Pointer<Void>, Int32, Int32, Int32, Int32, Int32, Int32, Int32);
typedef _libSDLDisplay_class_SDLDisplayRaw_method_DrawRect_sig = void Function(Pointer<Void>, int, int, int, int, int, int, int);

// void FillRect(void* struct_ptr, int x, int y, int w, int h, int r, int g, int b)
typedef _libSDLDisplay_class_SDLDisplayRaw_method_FillRect_native_sig = Void Function(Pointer<Void>, Int32, Int32, Int32, Int32, Int32, Int32, Int32);
typedef _libSDLDisplay_class_SDLDisplayRaw_method_FillRect_sig = void Function(Pointer<Void>, int, int, int, int, int, int, int);

// ----------CLASS IMPLEMENTATIONS----------

class SDLDisplayRaw {
    Pointer<Void> structPointer = nullptr;

    void _validatePointer(String methodName) {
        if (structPointer.address == 0) {
            throw Exception('SDLDisplayRaw.$methodName was called, but structPointer is a nullptr.');
        }
    }

    static _libSDLDisplay_class_SDLDisplayRaw_method_SDInit_sig? _SDInit;
    static _libSDLDisplay_class_SDLDisplayRaw_method_SDGetErrorCode_sig? _SDGetErrorCode;
    static _libSDLDisplay_class_SDLDisplayRaw_method_SDGetFrameCount_sig? _SDGetFrameCount;
    static _libSDLDisplay_class_SDLDisplayRaw_method_SDDestroy_sig? _SDDestroy;
    static _libSDLDisplay_class_SDLDisplayRaw_method_GetSize_sig? _GetSize;
    static _libSDLDisplay_class_SDLDisplayRaw_method_Flush_sig? _Flush;
    static _libSDLDisplay_class_SDLDisplayRaw_method_DrawPoint_sig? _DrawPoint;
    static _libSDLDisplay_class_SDLDisplayRaw_method_DrawLine_sig? _DrawLine;
    static _libSDLDisplay_class_SDLDisplayRaw_method_DrawRect_sig? _DrawRect;
    static _libSDLDisplay_class_SDLDisplayRaw_method_FillRect_sig? _FillRect;

    void _initRefs() {
        if (
            _SDInit == null ||
            _SDGetErrorCode == null ||
            _SDGetFrameCount == null ||
            _SDDestroy == null ||
            _GetSize == null ||
            _Flush == null ||
            _DrawPoint == null ||
            _DrawLine == null ||
            _DrawRect == null ||
            _FillRect == null
        ) {
            final lib = DynamicLibrary.open('build/native/SDL/libSDLDisplay.so');

            _SDInit = lib.lookupFunction<_libSDLDisplay_class_SDLDisplayRaw_method_SDInit_native_sig, _libSDLDisplay_class_SDLDisplayRaw_method_SDInit_sig>('SDInit');
            _SDGetErrorCode = lib.lookupFunction<_libSDLDisplay_class_SDLDisplayRaw_method_SDGetErrorCode_native_sig, _libSDLDisplay_class_SDLDisplayRaw_method_SDGetErrorCode_sig>('SDGetErrorCode');
            _SDGetFrameCount = lib.lookupFunction<_libSDLDisplay_class_SDLDisplayRaw_method_SDGetFrameCount_native_sig, _libSDLDisplay_class_SDLDisplayRaw_method_SDGetFrameCount_sig>('SDGetFrameCount');
            _SDDestroy = lib.lookupFunction<_libSDLDisplay_class_SDLDisplayRaw_method_SDDestroy_native_sig, _libSDLDisplay_class_SDLDisplayRaw_method_SDDestroy_sig>('SDDestroy');
            _GetSize = lib.lookupFunction<_libSDLDisplay_class_SDLDisplayRaw_method_GetSize_native_sig, _libSDLDisplay_class_SDLDisplayRaw_method_GetSize_sig>('GetSize');
            _Flush = lib.lookupFunction<_libSDLDisplay_class_SDLDisplayRaw_method_Flush_native_sig, _libSDLDisplay_class_SDLDisplayRaw_method_Flush_sig>('Flush');
            _DrawPoint = lib.lookupFunction<_libSDLDisplay_class_SDLDisplayRaw_method_DrawPoint_native_sig, _libSDLDisplay_class_SDLDisplayRaw_method_DrawPoint_sig>('DrawPoint');
            _DrawLine = lib.lookupFunction<_libSDLDisplay_class_SDLDisplayRaw_method_DrawLine_native_sig, _libSDLDisplay_class_SDLDisplayRaw_method_DrawLine_sig>('DrawLine');
            _DrawRect = lib.lookupFunction<_libSDLDisplay_class_SDLDisplayRaw_method_DrawRect_native_sig, _libSDLDisplay_class_SDLDisplayRaw_method_DrawRect_sig>('DrawRect');
            _FillRect = lib.lookupFunction<_libSDLDisplay_class_SDLDisplayRaw_method_FillRect_native_sig, _libSDLDisplay_class_SDLDisplayRaw_method_FillRect_sig>('FillRect');
        }
    }

    SDLDisplayRaw(String title) {
        _initRefs();
        structPointer = _SDInit!(title.toNativeUtf8());
    }

    SDLDisplayRaw.fromPointer(Pointer<Void> ptr) {
        _initRefs();
        structPointer = ptr;
    }

    SDLInitErrorCode get errorCode {
        _validatePointer('errorCode');
        return SDLInitErrorCodeFromInt(_SDGetErrorCode!(structPointer));
    }

    int get frameCount {
        _validatePointer('frameCount');
        return _SDGetFrameCount!(structPointer);
    }

    @mustCallSuper
    void Destroy() {
        _validatePointer('Destroy');
        final out = _SDDestroy!(structPointer);

        // this method invalidates the pointer, probably by freeing memory
        structPointer = nullptr;

        return out;
    }

    void GetSize(Pointer<Int32> width, Pointer<Int32> height) {
        _validatePointer('GetSize');
        return _GetSize!(structPointer, width, height);
    }

    void Flush() {
        _validatePointer('Flush');
        return _Flush!(structPointer);
    }

    void DrawPoint(int x, int y, int r, int g, int b) {
        _validatePointer('DrawPoint');
        return _DrawPoint!(structPointer, x, y, r, g, b);
    }

    void DrawLine(int x1, int y1, int x2, int y2, int r, int g, int b) {
        _validatePointer('DrawLine');
        return _DrawLine!(structPointer, x1, y1, x2, y2, r, g, b);
    }

    void DrawRect(int x, int y, int w, int h, int r, int g, int b) {
        _validatePointer('DrawRect');
        return _DrawRect!(structPointer, x, y, w, h, r, g, b);
    }

    void FillRect(int x, int y, int w, int h, int r, int g, int b) {
        _validatePointer('FillRect');
        return _FillRect!(structPointer, x, y, w, h, r, g, b);
    }

}

