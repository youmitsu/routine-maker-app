import 'package:grpc/grpc.dart';

import '../proto/generated/service.pbgrpc.dart';

class GrpcGreeterService {
  static Future<String> sayHello(ClientChannel channel, String name) async {
    final client = GreeterClient(channel);
    final res = await client.sayHello(
      HelloRequest()..name = name,
      options: CallOptions(timeout: Duration(seconds: 30)),
    );
    return res.message;
  }
}
