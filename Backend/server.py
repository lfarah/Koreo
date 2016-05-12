<<<<<<< HEAD
import io, json


data = [
{"subjectName":"20th Century Novel",
"subjectDescription":"",
"teacherName":"Vezzali",
"teacherDescription":"",
"area":"English",
"block":1
},
{"subjectName":"Pre Calculus",
"subjectDescription":"",
"teacherName":"Freeman",
"teacherDescription":"",
"area":"Math",
"block":1
},
{"subjectName":"Anatomy",
"subjectDescription":"",
"teacherName":"Curtin",
"teacherDescription":"",
"area":"Science",
"block":1
},
{"subjectName":"Chemistry",
"subjectDescription":"",
"teacherName":"Mock",
"teacherDescription":"",
"area":"Science",
"block":1
},
{"subjectName":"Adv Video",
"subjectDescription":"",
"teacherName":"Rossam",
"teacherDescription":"",
"area":"Art",
"block":1
},
]
with io.open('database.json', 'w', encoding='utf-8') as f:
  f.write(unicode(json.dumps(data, ensure_ascii=False)))

with io.open('database.json', 'r', encoding='utf-8') as f:
  dic = json.load(f)
  print dic[0]

=======
from flask import Flask
app = Flask(__name__)

@app.route('/name/<name>/<isFuckboy>')
def hello_world(name,isFuckboy):
    return "Fuck off, " + name + isFuckboy

if __name__ == '__main__':
	app.run(host='0.0.0.0')
>>>>>>> cd794dd2351c7a0387e9b1bc4b2a3c609aa15bef
