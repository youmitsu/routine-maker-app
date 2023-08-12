# Dartのprotoファイルを生成
protoc --dart_out=grpc:app/lib/proto/generated -Iprotos protos/service.proto

# Pythonのprotoファイルを生成
cd server
source ./bin/activate
python -m pip install -r requirements.txt
python -m grpc_tools.protoc -I../protos/ --python_out=./proto --pyi_out=./proto --grpc_python_out=./proto ../protos/service.proto