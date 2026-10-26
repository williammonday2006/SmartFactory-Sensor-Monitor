import 'dart:async';

Future<String> fetchSensorMetadata() async {
  return await Future.delayed(
    Duration(seconds: 2),
    () => "Sensor ID: 402 | Location: Warehouse-A",
  );
}

Stream<double> temperatureStream() async* {
  List<double> readings = [22.5, 28.0, 36.5, 32.0, 40.0];

  for (double reading in readings) {
    yield reading;
    await Future.delayed(Duration(seconds: 1));
  }
}

Future<void> main() async {
  String metadata = await fetchSensorMetadata();
  print(metadata);

  final controller = StreamController<double>();

  controller.stream.listen(
    (reading) {
      if (reading > 35.0) {
        double fahrenheit = reading * 1.8 + 32;
        print("WARNING: ${reading}°C / ${fahrenheit}°F");
      } else {
        print("Normal temperature: ${reading}°C");
      }
    },
    onError: (error) {
      print("ALERT: Pipeline caught an error -> $error");
    },
    onDone: () {
      print("Sensor pipeline closed.");
    },
    cancelOnError: false,
  );

  int counter = 0;

  await for (final reading in temperatureStream()) {
    counter++;

    if (counter == 4) {
      controller.addError(
        Exception('Sensor Malfunction: Signal Lost'),
      );
    } else {
      controller.add(reading);
    }
  }

  await controller.close();
}
