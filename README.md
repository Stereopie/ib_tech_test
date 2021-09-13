# ib_tech_test

Independent Reserve tech test

Wasn't too sure how to test painting on the canvas. Would usually use automation testing to confirm
labels were in the correct position, and manual regression testing using a known curve/ chart and
manually confirming the chart looks correct.

Could potentially generate a golden file for a specific curve, and run on a device which we know the
exact size of the canvas which the chart's being drawn.

- Tests can be run using:
flutter test