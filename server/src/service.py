import service_pb2_grpc
import service_pb2

class GreeterServicer(service_pb2_grpc.GreeterServicer):
    def SayHello(self, request, context):
        return service_pb2.HelloReply(message='Hello, {}!'.format(request.name))
