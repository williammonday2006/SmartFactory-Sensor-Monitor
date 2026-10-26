Future<String> fetchSensorMetadata() async {
  return await Future.delayed(
    Duration(seconds: 2),
    () => "Sensor ID: 402 | Location: Warehouse-A",
  );
}

Future<void> main() async {
  String metadata = await fetchSensorMetadata();
  print(metadata);
}
