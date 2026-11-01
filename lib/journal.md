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

## Phase 3: The Trading Floor

In Phase 3, I added three buttons to control the stock price: Bull Market, Bear Market, and Reset.

When a button is pressed, the onPressed event sends a StockAction into the BLoC's input sink. The StockBloc receives the action, calculates the new price, and uses copyWith to create an updated Stock object.

The updated stock is then sent through the output sink. StreamBuilder receives the new data and rebuilds the part of the screen displaying the stock information.

The rebuild happens inside StreamBuilder when its stream receives a new event. I didn't need to use setState because the stream handles the updates automatically.

This helped me understand how the BLoC pattern connects user interactions to business logic while keeping them separate from the interface.

## Phase 4: Validation & Reflection

In Phase 4, I tested the Market Watcher app to make sure the stock prices updated correctly.

I tested the Bull Market, Bear Market, and Reset buttons to verify that the price and text color changed as expected. I also checked how the app handled rapid button presses.

The BLoC pattern helps separate business logic from the user interface. StockBloc handles the stock price calculations, while StockPage handles displaying the information.

If I wanted to redesign the app to look like a professional trading terminal, I could change the widgets, colors, and layout without changing the price calculation logic inside StockBloc.

One thing I learned is that StreamControllers need to be closed when they are no longer being used to prevent memory leaks.

Overall, the BLoC pattern makes the app easier to organize because the logic and interface are kept separate.