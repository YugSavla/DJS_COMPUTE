import streamlit as st
import pickle
import numpy as np

with open('linear_model.pkl', 'rb') as f:
    model = pickle.load(f)

# Streamlit app layout
st.title('Linear Regression Model Deployment')

# Input features from the user
feature1 = st.number_input('Feature 1:')
feature2 = st.number_input('Feature 2:')

# Prediction button
if st.button('Predict'):
    # Prepare the input data
    input_data = np.array([[feature1, feature2]])

    # Make prediction
    prediction = model.predict(input_data)

    # Display the result
    st.success(f'The predicted value is: {prediction[0]}')
