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

