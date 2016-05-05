from flask import Flask
app = Flask(__name__)

@app.route('/name/<name>/<isFuckboy>')
def hello_world(name,isFuckboy):
    return "Fuck off, " + name + isFuckboy

if __name__ == '__main__':
	app.run(host='0.0.0.0')
