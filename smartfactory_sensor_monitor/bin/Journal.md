# Phase 1:

I created an asynchronous function that fetches sensor metadata after a two-second delay. Using await lets the program wait for the completed value instead of returning the Future itself.

# Phase 2

I created an async stream that yields five temperature readings over time. The await for loop checks each reading and converts temperatures above 35°C to Fahrenheit. Unlike return, yield can emit multiple values.