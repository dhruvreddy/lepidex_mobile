import 'package:dio/dio.dart';
import 'package:lepidex/core/network/dio_helper_scan.dart';
import 'package:lepidex/core/network/dio_helper_upload.dart';

final class DioClient {
  static Dio? _dioScan;
  static Dio? _dioUpload;

  static Dio get getDioScan {
    _dioScan ??= Dio(BaseOptions(baseUrl: "http://65.2.142.172/"));
    _dioScan!.interceptors.add(DioHelperScan());
    return _dioScan!;
  }

  static Dio get getDioUpload {
    _dioUpload ??= Dio(BaseOptions(baseUrl: ""));
    _dioUpload!.interceptors.add(DioHelperUpload());
    return _dioUpload!;
  }
}
