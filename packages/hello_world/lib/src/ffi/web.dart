import 'package:hello_world/src/bridge_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:hello_world/hello_world.dart';

typedef ExternalLibrary = WasmModule;

HelloWorld createWrapperImpl(ExternalLibrary module) =>
    HelloWorldImpl.wasm(module);

WasmModule createLibraryImpl() {
  // TODO add web support. See:
  // https://github.com/fzyzcjy/flutter_rust_bridge/blob/master/frb_example/with_flutter/lib/ffi.web.dart
  throw UnsupportedError('Web support is not provided yet.');
}
