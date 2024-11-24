from flask import Flask, render_template
import os

app = Flask(__name__)

@app.route('/')
def home():
    # Ensure the image exists in the workspace
    image_path = "static/image.png"
    if not os.path.exists(image_path):
        return "Image not found. Please upload an image named 'image.png' in the static folder.", 404

    return render_template('index.html', image_url=image_path)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
