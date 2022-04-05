import pandas as pd
import numpy as np
#import matplotlib.pyplot as plt

df=pd.read_csv(r"C:\Users\Coditas\Downloads\trades_202204051430.csv")
df.isnull().sum()  #data cleaning
df['contractsize'].fillna(value=df['contractsize'].mean(), inplace=True)
