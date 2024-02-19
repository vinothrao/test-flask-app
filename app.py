from flask import Flask, jsonify, request


app = Flask(__name__)



@app.route('/')
def hello_world():
    return "Hello World from Jenkins CI!"


if __name__ == "__main__":
    app.run(host="0.0.0.0")
