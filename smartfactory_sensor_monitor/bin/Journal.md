# Phase 1:

I created an asynchronous function that fetches sensor metadata after a two-second delay. Using await lets the program wait for the completed value instead of returning the Future itself.

# Phase 2

I created an async stream that yields five temperature readings over time. The await for loop checks each reading and converts temperatures above 35°C to Fahrenheit. Unlike return, yield can emit multiple values.

# Phase 3

I added a StreamController to receive and distribute temperature readings. I registered the listener before sending readings so every event could be processed as it arrived. I closed the controller after dispatching all readings.

# Phase 4

I used addError() to simulate a sensor malfunction. The onError callback reports the error without stopping the stream, allowing later readings to be processed. Unlike try-catch, onError handles errors delivered through a stream.