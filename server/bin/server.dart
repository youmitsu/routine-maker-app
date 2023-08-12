import 'package:grpc/grpc.dart';
import 'package:server/greeter_service.dart';

void main(List<String> arguments) async {
  final server = Server.create(
    services: [GreeterService()],
    codecRegistry: CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  );
  await server.serve(port: 50051);
  print('Server listening on port ${server.port}...');
}
