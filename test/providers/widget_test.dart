import 'package:books_api/helpers/request_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() => WidgetsFlutterBinding.ensureInitialized());
  test('request_provider_test', () {
    RequestUtil provider = RequestUtil();
    const initialString = ' My Example Here ';
    var request = provider.buildRequest(initialString);
    expect(request.query, 'q=my%2Bexample%2Bhere');
    expect(request.host, 'openlibrary.org');
    expect(request.path, '/search.json');
  });
}
