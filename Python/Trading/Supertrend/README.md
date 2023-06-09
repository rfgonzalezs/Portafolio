# Supertrend bot in MQL5 using Python
Using MQL5 broker to manage buying and selling operations of different currencies. The following conditions of use were taken:

1. MetaTrader5 python libraries to connect python with MQL5, NumPy for mathematical operations, pandas for data management, warnings for handling warnings, and librerias_estrategias where the trading functions are located, the Supertrend strategy with which operations will be carried out on the MQL5 platform, matplotlib.dates for converting date values into numeric ones,  DateTime Date Management and Schedule Bot Negotiation Time Management.

2. The connection between Python and MQL5 starts

3. MQL5 data is imported using the function in the libreria_estrategias library. The essential parameters of use are the symbol, the temporality in which they will be operated, and the number of candles (start and end).

4. The data obtained in step 3 is analyzed with the supertrend function.

5. Order handling:

- buy if buy equals True a buy trade is executed with a profit of 0.5:1, 1 profit (TP), and a loss (SL) of 0.5.
- sell if buy equals False a sell trade is executed with a profit of 0.5:1, 1 profit (TP), and a loss (SL) of 0.5.

6. The connection between Python and MQL5 is concluded