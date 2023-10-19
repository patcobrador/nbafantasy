import streamlit as st
import pandas as pd
import psycopg2

# Function to fetch data based on user input
def fetch_data(query):
    conn = psycopg2.connect(database="postgres", user="postgres", password="OrangE7$", host="localhost", port="5432")
    df = pd.read_sql_query(query, conn)
    conn.close()
    return df

# Streamlit UI
st.title("SQL Query App")

# Text input for user to enter a SQL query
query = st.text_area("Enter your SQL query:", value="SELECT * FROM your_table LIMIT 10;", height=200)

# Button to execute query
if st.button("Execute Query"):
    try:
        result_df = fetch_data(query)
        st.write(result_df)
    except Exception as e:
        st.write("Error: ", e)

# Run the Streamlit app
# streamlit run app.py
