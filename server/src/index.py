from concurrent import futures
import grpc
import service_pb2_grpc
import service

def serve():
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    service_pb2_grpc.add_GreeterServicer_to_server(
        service.GreeterServicer(), server)
    server.add_insecure_port('[::]:50051')
    server.start()
    print('server started')
    server.wait_for_termination()

if __name__ == '__main__':
    serve()