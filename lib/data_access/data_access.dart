library data_access;

import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:flutter_demo/core/app_exception.dart';
import 'package:flutter_demo/model/model.dart';

part 'app_repository/abstract_repository.dart';
part 'app_repository/concrete_repository.dart';
part 'app_repository/mock_repository.dart';
part 'app_repository/request_service.dart';
part 'app_repository/interceptors.dart';