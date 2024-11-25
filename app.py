from flask import Flask, request, jsonify
import numpy as np
import pickle

# Load models and scalers
model = pickle.load(open('model.pkl', 'rb'))
sc = pickle.load(open('standscaler.pkl', 'rb'))
ms = pickle.load(open('minmaxscaler.pkl', 'rb'))

# Create Flask app
app = Flask(__name__)

@app.route('/')
def index():
    return "Welcome to the Crop Recommendation System!"

@app.route("/predict", methods=['POST'])
def predict():
    data = request.get_json()  # Receive JSON data from the Flutter app

    # Extract parameters from the received JSON
    N = float(data['nitrogen'])
    P = float(data['phosphorus'])
    K = float(data['potassium'])
    temp = float(data['temperature'])
    humidity = float(data['humidity'])
    ph = float(data['ph'])
    rainfall = float(data['rainfall'])
    print(f"Received data: {N}, {P}, {K}, {temp}, {humidity}, {ph}, {rainfall}")

    feature_list = [N, P, K, temp, humidity, ph, rainfall]
    single_pred = np.array(feature_list).reshape(1, -1)

    # Scaling the input data
    scaled_features = ms.transform(single_pred)
    final_features = sc.transform(scaled_features)
    prediction = model.predict(final_features)

    # Crop dictionary
    crop_dict = {1: "Rice", 2: "Maize", 3: "Jute", 4: "Cotton", 5: "Coconut", 6: "Papaya", 7: "Orange",
                 8: "Apple", 9: "Muskmelon", 10: "Watermelon", 11: "Grapes", 12: "Mango", 13: "Banana",
                 14: "Pomegranate", 15: "Lentil", 16: "Blackgram", 17: "Mungbean", 18: "Mothbeans",
                 19: "Pigeonpeas", 20: "Kidneybeans", 21: "Chickpea", 22: "Coffee"}

    # Get the recommendation based on the prediction
    crop = crop_dict.get(prediction[0], "Unknown crop")
    
    # Return the result as a JSON response
    return jsonify({'crop': crop})

if __name__ == "__main__":
    app.run(debug=True)
