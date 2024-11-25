# AgriSmart App - Farming Assistant

# Description
The AgriSmart App is an innovative solution leveraging machine learning and AI to 
revolutionize agricultural practices. Designed to empower farmers, it delivers real-time, 
location-based insights tailored to specific environmental and soil conditions. By 
integrating AI and ML, the app offers personalized recommendations for suitable crops, 
helping farmers optimize yields and maximize profitability.

The app evaluates critical factors such as soil type, climate, rainfall, temperature, 
humidity, and pH levels to recommend the most appropriate crops for a particular 
region. By analyzing historical data and using predictive models, it enables farmers to 
make informed decisions, ensuring sustainable and efficient farming practices.

In addition to crop recommendations, the AgriSmart App features AI-driven pest and 
plant disease detection. Curated educational blogs on innovative farming techniques 
and real-time weather insights further enhance decision-making and agricultural 
productivity. Together, these features support a holistic approach to modern 
agriculture, blending technology with traditional practices to meet the challenges of 
today’s farming.

# App Screenshots

<p style="margin-bottom: 40px;">
<div style="display: flex; flex-direction: row;">
  <img src="App ScreenShots/Home.png" width="150" />
   &nbsp;
  <img src="App ScreenShots/Navigation.png" width="150" />
   &nbsp;
  <img src="App ScreenShots/blog1.png"  width="150" />
   &nbsp;
  <img src="App ScreenShots/blog2.png"  width="150" />
   &nbsp;
  <img src="App ScreenShots/crop1.png"  width="150" />
   &nbsp;
  <img src="App ScreenShots/crop2.png"  width="150" />
   &nbsp;
  <img src="App ScreenShots/label1.png"  width="150" />
   &nbsp;
   <img src="App ScreenShots/label2.png"  width="150" />
   &nbsp;
  <img src="App ScreenShots/label3.png"  width="150" />
   &nbsp;
  <img src="App ScreenShots/weather1.png"  width="150" />
    &nbsp;
  <img src="App ScreenShots/weather2.png"  width="150" />
</div>
</p>

# Key Features of App
1. **Crop Recommendation System:**
   
 ○ Analyzes soil type, weather conditions, and user preferences.
 
 ○ Suggests the most suitable crops for optimal yield.

 **2. Pest and Plant Detection:**
    
 ○ Uses Google ML kit image Labeller for image recognition and labelling to identify pests and plant.
 
**3. Weather Insights:**
    
 ○ Displays real-time weather data tailored for agricultural activities.
 
 **4. Educational Blogs:**
    
 ○ Curated articles and guides on modern farming practices, pest control, and soil health.
 
 ○ Direct links to external resources for in-depth reading.
 
 **5. User-Friendly Interface:**
    
 ○ Intuitive navigation tailored for ease of use by farmers.
 

# Work Description
**1. Data Source and Preparation**

 ● Utilized a crop recommendation dataset from Kaggle with features like soil nutrients (N, P, K), pH, rainfall, temperature, and 
humidity. Cleaned and preprocessed the dataset.

 **2. Data Exploration and Analysis (EDA)**
    
 ● Performed EDA to identify patterns, trends, and correlations in the dataset, such as the relationship between soil nutrients 
and crop suitability. Visualized the data to gain insights and address any missing or inconsistent values.

 **3. Algorithm Selection**
    
 ● Evaluated multiple ML algorithms (SVM, Decision Tree, Random Forest, Gradient Boosting) for performance and accuracy, 
finally chose Random forest for its robustness and efficiency in handling non-linear relationships.

 **4. Model Preparation**
    
 ● Split the dataset into training and testing sets to ensure unbiased evaluation. Tuned hyperparameters using grid search to 
optimize the model for accurate predictions.

 **5. Application Development**
    
 ● Built a Flutter-based user interface for seamless user interaction and data input. Integrated the machine learning model into 
the app using a backend API for real-time predictions.

**6. Real-Time Weather Integration and  Image-Based Crop and Pest Detection**
     
 ● Incorporated weather APIs to fetch live data (temperature, humidity, rainfall) for location-based predictions.
 
 ● Added an image detection feature using Google ML kit Image Labeller to label  crops or detect pests on leaves

# Technologies Used
**Python:** Programming language used for model development, data preprocessing, and web application development.

**Scikit-learn:** Machine learning library used for model training, evaluation, and prediction. 

**Pandas:** Data manipulation library used for data preprocessing and analysis.

**NumPy:** Library for numerical computing used for handling arrays and mathematical operations. 

**Flask:** Web framework used for building the user interface and handling HTTP requests. 

**Flutter:** For building the mobile application we used flutter as a cross platform application development tool.

**Third-Party APIs:**

 ● Weather API for real-time weather data.
 
 ● External blog sources for educational content.
 


# Future Enhancements
**1. Soil Type Classification**

 ○ Add soil texture classification (e.g., sandy, loamy, clayey) to improve crop suitability predictions. This can be achieved by integrating soil sensor data or a pre-trained model for soil classification.

 **2. Multi-Crop Recommendation**
 
 ○ Suggest a combination of crops for crop rotation or intercropping to maximize yield and soil health. This can be implemented using optimization algorithms.
 
 **3. Fertilizer Recommendation System**
 
 ○ Enhance the model to recommend suitable fertilizers based on soil nutrient levels. This can be achieved by linking nutrient deficiencies to specific fertilizers.
 **4. Pest and Disease Prediction**
 
 ○ Incorporate a module to predict the likelihood of pest infestations or diseases based on weather and crop type. Use image-based datasets and transfer learning models for pest identification.
 
 **5. Yield Prediction**
 
 ○ Extend the model to predict the expected yield of recommended crops, helping farmers make better financial decisions. This can be done by training on historical yield data.



