from flask import Flask  # Import the Flask framework
import os  # Import os module to access environment variables

app = Flask(__name__)  # Initialize a Flask application

@app.route('/')  # Define a route for the home page
def home():
    return f"Hello, Flask is running in a Docker container! Database: {os.getenv('DATABASE_URL')}"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)  # Run the app, accessible from all network interfaces
