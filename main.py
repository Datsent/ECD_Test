from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
    return 'Hello MSD.'

app.run(host='0.0.0.0', port=81)
