import 'dart:ffi';
import 'dart:io';

import 'package:hello_world/src/bridge_generated.dart';

typedef ExternalLibrary = DynamicLibrary;

HelloWorld createWrapperImpl(ExternalLibrary dylib) =>
    HelloWorldImpl(dylib);

DynamicLibrary createLibraryImpl() {
  const base = 'library_name';

  if (Platform.isIOS || Platform.isMacOS) {
    return DynamicLibrary.executable();
  } else if (Platform.isWindows) {
    return DynamicLibrary.open('$base.dll');
  } else {
    return DynamicLibrary.open('lib$base.so');
  }
}
