import numpy as np
import pandas as pd
import yfinance as yf
import ta
from ta.volatility import BollingerBands
import matplotlib.dates as mpl_dates
import warnings
warnings.filterwarnings("ignore")

class Estrategia_SuperTrend:
    def SuperTrend(df):
        #ATR
        high_low = np.abs(df['high'] - df['low'])
        high_pc = np.abs(df['high'] - df['close'].shift())
        low_pc = np.abs(df['low'] - df['close'].shift())

        ranges = pd.concat([high_low, high_pc, low_pc],axis=1)
        true_range = np.max(ranges, axis=1)
        df['atr'] = true_range.ewm(alpha=1/14,min_periods=14).mean() #5 14

        multiplier = 2.5
        df['upperband'] = ((df.high + df.low) / 2) + (multiplier * df.atr)
        df['lowerband'] = ((df.high + df.low) / 2) - (multiplier * df.atr)
        df['SuperTrend'] = True

        for actual in range(1, len(df.index)):
            anterior = actual - 1

            if df['close'][actual] > df['upperband'][anterior]:
                df['SuperTrend'][actual] = True
            elif df['close'][actual] < df['lowerband'][anterior]:
                df['SuperTrend'][actual] = False
            else:
                df['SuperTrend'][actual] = df['SuperTrend'][anterior]

                if df['SuperTrend'][actual] == True and df['lowerband'][actual] < df['lowerband'][anterior]:
                    df['lowerband'][actual] = df['lowerband'][anterior]

                if df['SuperTrend'][actual] == False and df['upperband'][actual] > df['upperband'][anterior]:
                    df['upperband'][actual] = df['upperband'][anterior]

            if df.SuperTrend[actual] == True:
                df.upperband[actual] = np.nan
            else:
                df.lowerband[actual] = np.nan

        return df
    
    def  Heikin_Ashi(df):
        dt = pd.DataFrame(index=df.index)
        dt['close'] = (df['high'] + df['low'] + df['open'] + df['close']) / 4
        dt['time'] = df['time']
        dt['open'] = df['open']

        for actual in range(1,len(df.index)):
            anterior = actual - 1
            dt['open'][actual] = (df.open[anterior] + df.close[anterior]) / 2

        dt['high'] = df['high']
        dt['high'] = dt[['high','open','close']].max(axis=1)
        dt['low']  = df['low']
        dt['low']  = dt[['low','open','close']].min(axis=1)        

        return dt