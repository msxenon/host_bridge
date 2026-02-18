gen:
	@dart run build_runner build -d

install_local:
	-@dart pub global deactivate host_bridge
	@dart pub global activate --source path .