## Phase 1: The Market Model

In Phase 1, I worked with an immutable Stock model and started building the StockBloc class to handle stock price changes.

The difference between directly changing a field and using copyWith is that directly changing a field modifies the existing object, while copyWith creates a new object with updated values.

I think copyWith is useful because it allows the app to work with updated stock data without modifying the original object. This also makes state changes easier to track.

The most challenging part was understanding how the input and output streams work together. The input receives actions, while the output sends updated stock information to the UI.

## Phase 2: The Ticker Tape

In Phase 2, I created the StockPage widget and connected it to StockBloc using StreamBuilder.

StreamBuilder listens to the stock data stream and automatically rebuilds its widget when new stock information arrives.

This is different from using setState because I don't have to manually tell Flutter to rebuild the screen. Instead, the stream sends updated data, and StreamBuilder handles displaying it.

I think this approach is useful because it separates the stock calculations from the user interface and makes the code easier to organize.

