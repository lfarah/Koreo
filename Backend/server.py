<<<<<<< HEAD
from flask import Flask 
import os
import io,json

app = Flask(__name__)
app.debug = True


data = [
{
    'name':'Algebra 1',
    'block': '1',
    'required': True,
    'area':'Math',
    'teacher':'Ottilie Valverde',
    'description':'This first-year algebra course is designed to provide the student with a basic understanding of the structure of algebra. Emphasis is placed on developing algebraic concepts and the use of these concepts in problem situations. Among the topics studied are the real number system, polynomial and exponential expressions, factoring, solving linear and quadratic equations, systems of equations, graphing in one and two dimensions, radicals, and rational expressions.'
},    
{
    'name':'Advanced Algebra',
    'block':'2',
    'required': True,
    'area':'Math',
    'teacher':'Ottilie Valverde',
    'description':"This course reviews and extends topics of Algebra I and covers advanced topicsin algebra. Among the topics studied are polynomial and radical expressions, factoring, linear systems, quadratic equations and functions, complex numbers, polynomial functions and rational expressions and functions."
},
{
    'name':'Geometry',
    'block':'3',
    'required': True,
    'area':'Math',
    'teacher':'Christopher Dunn',
    'description':'This course emphasizes the ability to reason both in formal mathematics and in the practical applications of mathematics. Among the topics studied are formal proof, plane and solid figures, congruence, similarity, some coordinate geometry and geometric constructions. This course also reviews algebraic concepts in a geometric setting.'
},
{
    'name':'Functions',
    'block':'4',
    'required': True,
    'area':'Math',
    'teacher':'Christopher Dunn',
    'description':'This course is required for all students who wish to take Pre-calculus and/or AP Calculus. Topics include conic sections, exponential and logarithmic functions, and a complete study of trigonometry (including functional trigonometry, circular functions, triangle trigonom- etry, proving trigonometric identities, the laws of sines and cosines and the sum, difference, double- and half-angle formulas).'
},
{
    'name':'Intro to Literature',
    'block':'1',
    'required': True,
    'area':'English',
    'teacher':'Diane Ass',
    'description':'This course is designed to enhance a students appreciation of literature: the novel, the short story, drama, and poetry. Special emphasis is placed on enhancing reading comprehension and analytical skills. Students will read a broad selection of novels, short stories, and a play to learn how to analyze components of literature, such as plot, symbolism, conflict, and characterization. Students will also be introduced to poetry in order to analyze the elements of the arts many forms. Students will compose analytical, comparative, persuasive, and narrative essays.'
},
{
    'name':'Intro to Comp',
    'block':'2',
    'required': True,
    'area':'English',
    'teacher':'Mary Dalton',
    'description':'This course is designed to strengthen a student\'s writing ability by bolstering his skills in grammar, vocabulary, sentence development, paragraph development, and formal composition development. By the end of the course, students will have composed descriptive, narrative, argumentative, and expository essays. Students will read some non-fiction pieces to highlight quality expository writing.'
},
{
    'name':'American Literature',
    'block':'3',
    'required': True,
    'area':'English',
    'teacher':'Kim Loder',
    'description':'This college-preparatory course is designed to build on the reading and writing skills developed in the previous two years of English. Students will survey the poetry and literature of North America and the United States from the pre-Columbian era to the present. Teachers will continue to develop grammar and usage concepts and review those learned in lower division English. The continued focus of the writing portion of this class is on the major types of essays: analytical, persuasive, and comparative, as well as research papers or projects.'
},
{
    'name':'World Literature',
    'block':'4',
    'required': True,
    'area':'English',
    'teacher':'Susan Sutton',
    'description':'This survey course for advanced tenth grade English students will examine literature from an array of ancient and modern civilizations. A key objective will be to explore themes that are applicable to people throughout the world. Students taking this class are expected to read and write at a higher level than sophomores in the non-honors courses and to deal with complex themes from cultures not familiar to them. Composition types will include narrative, analytical, persuasive, and descriptive writing.'
},
{
    'name':'Biology',
    'block':'1',
    'required': True,
    'area':'Science',
    'teacher':'David Cobb',
    'description':'This laboratory course introduces students to the study of the structure and func- tions of living things. Emphasis will be placed on the use of the scientific method, laboratory equipment, and computer technology. Topics of study include evolution and biodiversity, cell structure and function, genetics and bioethical issues, pathogens (including HIV and drug-resistant bacteria), and animal organs and systems. Recent scientific advances are related to the topics being studied.'
},
{
    'name':'Physics',
    'block':'2',
    'required': True,
    'area':'Science',
    'teacher':'Tony Dunn',
    'description':'This course is a general study of topics in physics. Topics include Newtonian mechanics, thermodynamics, gravity, optics, and DC electricity. A premium is placed on the understanding of algebra and basic trigonometry, critical thinking skills, and laboratory exercises. Successful completion of this course enables students to understand the complex natural laws of the physical world, both conceptually and mathematically.'
},
{
    'name':'Chemistry',
    'block':'3',
    'required': True,
    'area':'Science',
    'teacher':'Chasen Mock',
    'description':'This course is designed for the student bound directly for a four-year college after high school. Special emphasis is given to topics in chemistry that form the basis for college-level courses as well as providing general knowledge. The principles of chemistry are taught through an integrated program of lecture, class discussions, and laboratory investigations. Problem-solving skills and the quantitative investigation of matter and its changes are the basis of this course.'
},
{
    'name':'Concenptial Physics',
    'block':'4',
    'required': True,
    'area':'Science',
    'teacher':'Danny Curtin',
    'description':'This course presents a study of the physical and chemical interactions of matter. The chemistry concepts include the atom and its structure, formation of compounds and chemical reactions; and the physics concepts include motion, force, energy, electricity, and magnetism. Laboratory investigations emphasize development of process skills, math skills, and safe manipu- lation of laboratory apparatus and materials. This course serves as a background for subsequent courses in biology, chemistry, and physics.'
},
{
    'name':'Early World History',
    'block':'1',
    'required': True,
    'area':'History',
    'teacher':'Chris Fern',
    'description':'Early World History is a semester long survey course that examines the history of human societies from pre-history to the late 17th century. Emphasis is placed on the interaction between geography and historical developments and the change from isolated civilizations to interconnected regions. Students will use social, political, economic, cultural and economic themes to further their knowledge of the various human societies examined. The course will also stress the development of the following skills: reading primary sources, analyzing art and literature, research, writing formal and informal compositions, and making formal presentations.'
},
{
    'name':'Modern World History',
    'block':'2',
    'required': True,
    'area':'History',
    'teacher':'Jeff Isola',
    'description':'Modern World History presents a chronological narrative of world history from 1550 A.D. to the present. Cultural, religious, economic, political, and social development of various world civilizations are examined, as are the causes and consequences of their interaction. Students will study the political, social, economic, cultural, and religious histories of the world since 1500.'
},
{
    'name':'United States History',
    'block':'3',
    'required': True,
    'area':'History',
    'teacher':'David Elu',
    'description':'This course is a survey of the history of the United States, beginning with Pre-Columbian America and concluding with an examination of the United States as the twenty- first century dawns. Students will examine the American experience from political, diplomatic, cultural, and economic perspectives, acquiring analytical skills in the course of identifying the experiences and ideals that bring Americans together as well as the tensions that fragment them. Emphasizing critical thinking, extensive reading, and formal analytical writing, this course aims to create amateur historians, not merely students reading history.'
},
{
    'name':'Modern American Social History',
    'block':'4',
    'required': True,
    'area':'History',
    'teacher':'Kevin Fordon',
    'description':'This course examines twentieth century America "from the ground up," focusing on cultural, economic, religious, and social qualities of the American nation and its peoples. The course continues the Social Science department\'s emphasis on developing students\' critical thinking through extensive reading and formal analytical writing.'
},
{
    'name':'Spanish 1',
    'block':'1',
    'required': True,
    'area':'Language',
    'teacher':'Armando Castillo',
    'description':'Spanish I introduces the student to the phonetic system of the Spanish language. A sufficient number of basic structure and vocabulary drills are presented to aid the student in building comprehension, listening, and speaking skills in order to establish a rich environment for communication in the target language. Students are exposed to some of the cultural aspects of Spain and Latin America.'
},
{
    'name':'Spanish 2',
    'block':'2',
    'required': True,
    'area':'Language',
    'teacher':'Debra Jensen',
    'description':'Spanish II is a continuation of Spanish I. Additional emphasis is placed on reading comprehension, writing skills, and more communication between students in the target language. The program includes a review of concepts presented in Spanish I; specifically the use of the preterit and imperfect within the same structure. The course also introduces students to more complex grammatical structures of the language in order to facilitate the achievement of a higher level of these skills. Exposure to cultures of Spain and Latin America is included.'
},
{
    'name':'Mandarin 1',
    'block':'3',
    'required': True,
    'area':'Language',
    'teacher':'Yin Shan Yang',
    'description':'Mandarin I introduces the Chinese language and culture. Students will learn basic communication skills in Mandarin Chinese to facilitate simple conversations about daily life. Students will also learn to read, write, speak and understand basic Mandarin Chinese. In addition, students will be exposed to a variety of Mandarin-speaking cultures in Mainland China, Taiwan, Singapore and other locations.'
},
{
    'name':'Mandarin 2',
    'block':'4',
    'required': True,
    'area':'Language',
    'teacher':'Yin Shan Yang',
    'description':'Mandarin II is a continuation of Mandarin I. Students will continue to develop their reading, writing, speaking, and listening skills through various culture-related projects, reading comprehension, role-plays, class presentations, and note writing. Students are expected to use Mandarin as the tool to hold longer conversations and demonstrate social skills.'
},
{
    'name':'Jazz Band',
    'block':'1',
    'required': False,
    'area':'Elective',
    'teacher':'Kyle Hildebrant',
    'description':'An advanced band ensemble with an instrumentation of five saxophones, five trombones, five trumpets, and a percussion section. Instruction includes the history and develop- ment of jazz music. Students will receive coaching in the techniques and theories of Jazz, includ- ing improvisation. There will be tours of several jazz festivals and workshops. The Jazz Band will perform regularly at school functions and in regional Jazz Band competitions. There will be one major tour in the Spring semester.'
},
{
    'name':'Concert Band',
    'block':'2',
    'required': False,
    'area':'Elective',
    'teacher':'Kyle Hildebrant',
    'description':'This course explores and builds upon the skills acquired in the beginning and intermediate band courses. Students will engage in a variety of performance opportunities that include formal concerts, parades, school athletic events, community relations events, and state music festivals. About thirty performances are given each year, some of which include state and national travel. As the most visible travel ensemble on campus, students are expected to maintain the highest standards of instrumental technique, marching skills, and personal/group discipline.'
},
{
    'name':'Graphic Design',
    'block':'3',
    'required': False,
    'area':'Elective',
    'teacher':'George Cockrell',
    'descrption':'This advanced course involves "hands-on" work with Microsoft Office X (for Macintosh), developing sophisticated word-processing, graphic, database, and spreadsheet projects. This course will also provide extensive instruction and self-paced practice with Adobe InDesign and Photoshop. Working within the context of a Graphic Design Studio, students will produce personal projects as well as documents and presentations requested by the various components of the school community. Projects will be solicited from all areas of school life and students will work within a "contract" context to satisfy the graphic design needs of the school. Students will work with scanners, digital cameras, and other peripherals to complete these projects.'
},
{
    'name':'Computer Programming',
    'block':'4',
    'required': False,
    'area':'Elective',
    'teacher':'Jordan Hart',
    'description':'This course is designed to give students a fun, stress-less introduction to computer programming, using two different programming environments, Java and Scratch. Prior knowl- edge of computer programming is not required. Students will work on multiple Scratch projects while learning programming in Java. The Java emphasis is on variables, if-statements, loops, algo- rithms, and the basic concepts of object-oriented programming, as well as the hands-on experi- ence to create interactive figures with Scratch. The class meets five days a week with no written homework and a few quizzes. Students will not be required to do any programming work outside of class, but interested students can continue to work on their projects at home.'
},
{
    'name':'Art 1 & 2',
    'block':'1',
    'required': False,
    'area':'Elective',
    'teacher':'Irman Archibal',
    'description':'Introductory art students learn to use the Elements of Art and Principles of Design. Basic composition skills are taught primarily through drawing and painting in a variety of media. Students first form the basis of their artistic expression with elementary skills and techniques before moving toward self-expression and the exploration of larger concepts. Students are expected to master terminology of visual arts and acquire skills in art criticism. A visit to a local art museum will be required. Students will also be directed to purchase materials for their own art kits, including a sketchbook and drawing supplies.'
},
{
    'name':'Art 3 & 4',
    'block':'2',
    'required': False,
    'area':'Elective',
    'teacher':'Irman Archibal',
    'description':'Engaging in problems of visual communication and aesthetics, students will further the composition and design skills that were introduced in Art I & II through drawing, painting, sculptures, and mixed media works. Students will be more independent in their explorations of contemporary art making problems and techniques. A strong emphasis is placed on collaborative meaning making and art criticism. A visit to a local art museum or galleries will be required. Students will also be directed to purchase materials for their own art kits, including a sketchbook and drawing supplies.'
},
{
    'name':'Theatre Arts',
    'block':'3',
    'required': False,
    'area':'Elective',
    'teacher':"Valerie O'Riordan",
    'description':'This class is designed for the student with little or no experience in theatre arts. The curriculum covers the history, application and appreciation of theatre, through on-your-feet improvisation and scene work; acting terminology, theatre history (primitive society to current day); watching and reviewing plays; composing and reciting a Shakespearean sonnet; vocal dynamics; and the discussion of current events. In the first quarter the \'Creative Research Project\' covers research techniques, outline, bibliography, independent study, and group work skills. The project culminates in an oral presentation in which student groups \'teach\' the class what they have learned about their topic with the help of show and tell objects/presentation aids. The second quarter includes a differentiated Hamlet unit which culminates in a final re-enactment of the story performed (and videotaped) on stage as an ensemble of actors.'
},
{
    'name':'Economics',
    'block':'4',
    'required': False,
    'area':'Elective',
    'teacher':'David Elu',
    'description':'This course will provide a thorough study of both microeconomics and macroeco- nomics by examining the principles of production, distribution, and consumption of wealth in both the American and world economic systems. Marketplace competition, government regulation, consumer demand, stock and bond market investment, and wages and prices will beexamined. The law of supply and demand will be the basis of the course, and the factors de- termining economic policy, including inflation, productivity, deficit spending, unemployment, taxation, and international interdependence, will be analyzed. Four major economic systems that governments employ will be analyzed: monetarism, Keynesianism, economic planning, and supply-side economics. Role-playing, critical thinking and writing, individual and group projects will be among the methods employed. Current world and national events will be examined through an economic lens.'
},
]


@app.route('/')
def index():
    return 'Options: /returninfo/classname,  /returnelectives,  /returnrequired,  /returnsubject/subjectname'

@app.route('/returninfo/<className>')
def returnInfo(className):
    with io.open('database.json', 'r', encoding='utf-8') as f:
        for item in data:
            if item['name']==className:
                return str(item)

@app.route('/returnelectives')
def returnElectives():
    with io.open('database.json', 'r', encoding='utf-8') as f:
        result = []
        for item in data:
            if item['required']==False:
                result.append(item['name'])
        return str(result)

@app.route('/returnrequired')
def returnRequired():
    with io.open('database.json', 'r', encoding='utf-8') as f:
        result = []
        for item in data:
            if item['required']==True:
                result.append(item['name'])
        return str(result)

@app.route('/returnsubject/<subject>')
def returnSubject(subject):
    with io.open('database.json', 'r', encoding='utf-8') as f:
        result = []
        for item in data:
            if item['area']== subject:
                result.append(item['name'])
        return str(result)

if __name__ == '__main__':
    port = int(os.getenv('PORT', 8080)) 
    host = os.getenv('IP', '0.0.0.0') 
    app.run(port=port, host=host)
>>>>>>> cd794dd2351c7a0387e9b1bc4b2a3c609aa15bef
