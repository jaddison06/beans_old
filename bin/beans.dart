import 'dart_codegen.dart';

void main(List<String> arguments) {
  print('Hello world!');
  final return_val = libTest().hello();
  print(return_val);
}
