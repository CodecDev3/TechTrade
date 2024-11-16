from tradingview_ta import TA_Handler, Interval
import firebase_admin
from firebase_admin import credentials, firestore

import pandas as pd
import numpy as np

df = pd.read_excel('nifty50.xlsx')


year_high = df[(df['lastPrice'] > (df['yearHigh'] - (df['yearHigh']*0.02)) ) & (df['lastPrice'] < (df['yearHigh'] + (df['yearHigh']*0.02)) )]
year_low = df[(df['lastPrice'] > (df['yearLow'] - (df['yearLow']*0.02)) ) & (df['lastPrice'] < (df['yearLow'] + (df['yearLow']*0.02)) )]

# for high
symbol_high = np.array(year_high['symbol'])
price_high = np.array(year_high['lastPrice'])
result_high = []

for i in range(len(symbol_high)):
    result_high.append(f"{symbol_high[i]} : {price_high[i]}")
    
 
# for low
symbol_low = np.array(year_low['symbol'])
price_low = np.array(year_low['lastPrice'])
result_low = []

for i in range(len(symbol_low)):
    result_high.append(f"{symbol_low[i]} : {price_low[i]}")

# Initialize Firebase Admin SDK
if not firebase_admin._apps:
    cred = credentials.Certificate("tech-t.json")
    firebase_admin.initialize_app(cred)

db = firestore.client()

symbols = [
        "NIFTY", "COALINDIA", "SBIN", "NTPC", "ADANIENT", "BAJAJ_AUTO",
        "INFY", "APOLLOHOSP", "RELIANCE", "EICHERMOT", "HCLTECH", "HDFCLIFE",
        "AXISBANK", "NESTLEIND", "TATAMOTORS", "WIPRO", "ADANIPORTS", "MARUTI",
        "M_M", "POWERGRID", "ONGC", "GRASIM", "TATASTEEL", "BHARTIARTL",
        "SUNPHARMA", "LT", "INDUSINDBK", "HDFCBANK", "LTIM", "SBILIFE",
        "TATACONSUM", "BAJFINANCE", "CIPLA", "HINDALCO", "ICICIBANK", "TECHM",
        "BPCL", "HEROMOTOCO", "ASIANPAINT", "TITAN", "BRITANNIA", "DIVISLAB",
        "TCS", "ULTRACEMCO", "UPL", "BAJAJFINSV", "JSWSTEEL", "KOTAKBANK",
        "ITC", "HINDUNILVR", "DRREDDY"
]

above_ema20 = []  # for ema
below_ema20 = []
above_ema50 = []
below_ema50 = []
above_ema100 = []
below_ema100 = []
above_ema200 = []
below_ema200 = []

above_60 = []  # for rsi
below_40 = []
between = []
    
positive = []  # for macd
negative = []


for symbol in symbols:
        output = TA_Handler(symbol=symbol,
                            screener='India',
                            exchange='NSE',
                            interval=Interval.INTERVAL_1_DAY)

        indi = output.get_analysis().indicators # get indicators

        ema20 =  round(indi['EMA20'], 2)  # macd ----------
        ema50 =  round(indi['EMA50'], 2)
        ema100 =  round(indi['EMA100'], 2)
        ema200 =  round(indi['EMA200'], 2)
        op = round(indi['open'], 2)
        
        rsi = round(indi['RSI'], 2) # rsi ----------
        
        macd = round((indi['MACD.macd'] - indi['MACD.signal']) , 2)  # macd ----------
        
        
        print(f"{symbol} :")
        print(f"RSI : {rsi}")
        print(f"EMA ->  EMA20 : {ema20}   EMA50:{ema50}   EMA100:{ema100}   EMA200:{ema200}")
        print(f"MACD : {macd}")
        print("-----------------------------------------")


    
# conditions
# ------------------------------------------------------------------------------------------------------------------------

        # --- conditions for ema ----
# ema20  
        if op >= ema20 :
            above_ema20.append(f"{symbol} : {ema20}  ->  LTP : {op}")
        elif ema20 < op:
            below_ema20.append(f"{symbol} : {below_ema20}  ->  LTP : {op}")
# ema50
        if op >= ema50 :
            above_ema50.append(f"{symbol} : {ema50}  ->  LTP : {op}")
        elif ema50 < op:
            below_ema50.append(f"{symbol} : {below_ema50}  ->  LTP : {op}")
# ema100
        if op >= ema100 :
            above_ema100.append(f"{symbol} : {ema100}  ->  LTP : {op}")
        elif ema100 < op:
            below_ema100.append(f"{symbol} : {below_ema100}  ->  LTP : {op}")
# ema200
        if op >= ema200 :
            above_ema200.append(f"{symbol} : {ema200}  ->  LTP : {op}")
        elif ema200 < op:
            below_ema200.append(f"{symbol} : {below_ema200}  ->  LTP : {op}")
     
    
        
        # ------ conditions for rsi -------
            
        if rsi >= 70 :
            above_60.append(f"{symbol} : {rsi}")
        elif rsi < 30:
            below_40.append(f"{symbol} : {rsi}")
        else:
            between.append(f"{symbol} : {rsi}")
    
    
        # --- conditions for macd ----
        if macd >= 0 :
            positive.append(f"{symbol} : {macd}")
        else:
            negative.append(f"{symbol} : {macd}")
# -----------------------------------------------------------------------------------------------------------------------

    
    
#     for replacement
# --------------------------------------------------------------------------------------------------------------------------
        # ----------  replace ema  -------------------------------------
def replace_ema( document_id, new_array1, new_array2,new_array3, new_array4,new_array5, new_array6,new_array7, new_array8):
        # Fetch the document
    doc_ref = db.collection('EMA').document(document_id)
    doc = doc_ref.get()

    if doc.exists:
            # Update the array field
        doc_ref.update({'above_ema20': new_array1})
        doc_ref.update({'below_ema20': new_array2}) #-----
        doc_ref.update({'above_ema50': new_array3})
        doc_ref.update({'below_ema50': new_array4}) #-----
        doc_ref.update({'above_ema100': new_array5})
        doc_ref.update({'below_ema100': new_array6}) #-----
        doc_ref.update({'above_ema200': new_array7})
        doc_ref.update({'below_ema200': new_array8}) #-----
        print(f"Array in document {document_id} replaced successfully.")
    else:
        print(f"Document {document_id} not found.")

replace_ema('ema', above_ema20,below_ema20, above_ema50,below_ema50, above_ema100,below_ema100, above_ema200, below_ema200)

print("ema replaced successfully")


        # ----------- replace rsi --------------------------------
def replace_rsi(document_id, new_array1, new_array2, new_array3):
    # Fetch the document
    doc_ref = db.collection('RSI').document(document_id)
    doc = doc_ref.get()

    if doc.exists:
        # Update the array field
        doc_ref.update({'above_60': new_array1})
        doc_ref.update({'below_40': new_array2})
        doc_ref.update({'between': new_array3})
        print(f"Array in document {document_id} replaced successfully.")
    else:
        print(f"Document {document_id} not found.")


replace_rsi('rsi', above_60, below_40, between)

print("rsi replaced successfully")


        # ------------ replace macd ---------------------------
def replace_macd( document_id, new_array1, new_array2):
    # Fetch the document
    doc_ref = db.collection('MACD').document(document_id)
    doc = doc_ref.get()

    if doc.exists:
        # Update the array field
        doc_ref.update({'positive': new_array1})
        doc_ref.update({'negative': new_array2})
        print(f"Array in document {document_id} replaced successfully.")
    else:
        print(f"Document {document_id} not found.")


replace_macd( 'macd', positive, negative)
print("macd replaced successfully")



        # ------------ replace year_high_low ---------------------------
def replace_yhl( document_id, new_array1, new_array2):
    # Fetch the document
    doc_ref = db.collection('YEAR_HIGH_LOW').document(document_id)
    doc = doc_ref.get()

    if doc.exists:
        # Update the array field
        doc_ref.update({'high_52': new_array1})
        doc_ref.update({'low_52': new_array2})
        print(f"Array in document {document_id} replaced successfully.")
    else:
        print(f"Document {document_id} not found.")



replace_yhl( 'year_high_low', result_high, result_low)
print("year high low replaced successfully")
# --------------------------------------------------------------------------------------------------------------------------
print("all set")