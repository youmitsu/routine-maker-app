import grpc
import service_pb2_grpc
import service_pb2

channel = grpc.insecure_channel('localhost:50051')
stub = service_pb2_grpc.GreeterStub(channel)

feature = stub.SayHello(service_pb2.HelloRequest(name='you'))
print(feature.message)