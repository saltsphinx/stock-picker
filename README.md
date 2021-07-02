What is the problem?
Create a program(method) that accepts an order list(array) of numbers(intergers) representing stock prices of a each day, and produces an ordered list of two numbers representing the best day to buy and the best day to sell.

Interface? No.

What are the inputs, where do they come from?
The input is an array of intergers, they come from the user.

Whats the desired output?
An array of two intergers. The first one of the best day to buy which will be a low price, and the best day to sell being the highest profit. The buying index should always be before the selling index.

Given the inputs, what are the steps needed to produce the output?
Thinking of a way to compare all of the prices in a way that doesn't need altering of the arrays order.
Create a sorted array from least to greatest value and check if least is the last day and if the most is the first day. If so, then make least day the next lowest amount and visa versa for highest

Create sorted list of lowest to lowest prices. Return lowest price that isn't the last index, and is the closet to the 0 index

Create method that iterates through the lowest_price_array, and checks each value if they're in the soonest_day_array and returns the prices that first qualifies