from flask import Flask,jsonify,request,render_template,make_response
from flaskext.mysql import MySQL
import jwt
import json
import bcrypt
import datetime
from functools import wraps

FlightsAPlenty = Flask(__name__)

mysql = MySQL()
FlightsAPlenty.config['MYSQL_DATABASE_USER'] ='benjamin.bland'
FlightsAPlenty.config['MYSQL_DATABASE_PASSWORD'] = 'USGSBM5H'
FlightsAPlenty.config['MYSQL_DATABASE_DB'] = 'benjaminbland'
FlightsAPlenty.config['SECRET_KEY']='simplekey'
mysql.init_app(FlightsAPlenty)
conn = mysql.connect()
cursor = conn.cursor()


@FlightsAPlenty.after_request
def after_request(response):
	response.headers.add('Access-Control-Allow-Origin', '*')
	response.headers.add('Access-Control-Allow-Headers', 'Content-Type, Authorization')
	response.headers.add('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,OPTIONS')
	return response
    

@FlightsAPlenty.route("/PostTest", methods = ['GET', 'POST'])
def PostTest():
    firstName = request.form['firstName']
    lastName = request.form['lastName']
    output = firstName + " " + lastName
    return jsonify({'output':output})

@FlightsAPlenty.route("/registration", methods = ['GET', 'POST'])
def register():
    username = request.form['username']
    password = request.form ['password']
    salt = bcrypt.gensalt()
    hashed = bcrypt.hashpw(password.encode('utf-8'), salt).decode('utf-8')
    
    sql = "INSERT INTO accounts (username, password) VALUES (%s, %s)"
    cursor.execute (sql, (username, hashed))

    conn.commit()
    return jsonify ("sucess")
@FlightsAPlenty.route("/getDestination", methods = ['GET', 'POST'])
def getDestination():
    destId = request.form['destQuery']
    size = 0

    for c in destId:
        size = size + 1
    
    if size == 9: 
        destIdValue = destId[-1:]
    elif size == 10:
        destIdValue = destId[-2:]
    destContent = []

    sql = "SELECT * FROM destinations WHERE destId = %s"
    cursor.execute(sql, (destIdValue))
    conn.commit()

    result = cursor.fetchone()
    return jsonify(result)


@FlightsAPlenty.route("/getDestAdminClient", methods = ['GET', 'POST'])
def getDestAdminClient():
    destQuery = request.form['destQuery']
    
    sql = "SELECT * FROM destinations WHERE name = %s"
    cursor.execute(sql,(destQuery))
    conn.commit
    result = cursor.fetchone()
    return jsonify(result)
@FlightsAPlenty.route ("/AddDestination", methods = ['GET', 'POST'])
def addDestination():
    name =  request.form['name']
    feature1 = request.form['feature1']
    feature1Description = request.form['feature1Description']
    feature2 = request.form['feature2']
    feature2Description = request.form['feature2Description']
    
    sql = 'INSERT INTO destinations (name, feature1, feature1Description, feature2, feature2Description) VALUES (%s, %s, %s, %s, %s)'
    cursor.execute(sql, (name, feature1, feature1Description, feature2, feature2Description))
    conn.commit()

    return jsonify("success")
@FlightsAPlenty.route ("/updateDestination", methods = ['PUT'])
def updateDestination():
    destId = request.form['destId']
    name = request.form['name']
    feature1 = request.form['feature1']
    feature1Description = request.form['feature1Description']
    feature2 = request.form['feature2']
    feature2Description = request.form['feature2Description']

    sql = "UPDATE destinations SET name = %s, feature1 = %s, feature1Description = %s, feature2 = %s, feature2Description = %s WHERE destId = %s"
    cursor.execute(sql, (name, feature1, feature1Description, feature2, feature2Description, destId))
    conn.commit()


    return jsonify("Sucesss")

@FlightsAPlenty.route("/getReviews", methods = ['GET', 'POST'])
def getReviews():
    destId = request.form['destQuery']
    sql = "SELECT * FROM reviews WHERE destId = %s"
    cursor.execute(sql, (destId))
    results = cursor.fetchall()
    return jsonify(results)

@FlightsAPlenty.route("/getHotelReviews", methods = ['GET', 'POST'])
def getHotelReviews():
    hotelId = request.form['hotelQuery']

    sql = "SELECT * FROM hotelReviews WHERE hotelId = %s"
    cursor.execute(sql, (hotelId))
    
    results = cursor.fetchall()
    return jsonify(results)

@FlightsAPlenty.route("/saveReview", methods = ['GET', 'POST'])
def saveReview():
    review = request.form['review']
    destId = request.form['destId']

    sql = "INSERT INTO reviews (destId, review) VALUES (%s, %s)"
    cursor.execute(sql, (destId, review))
    conn.commit()

    return jsonify("success")

@FlightsAPlenty.route("/saveHotelReview", methods = ['GET', 'POST'])
def saveHotelReview():
    review = request.form['review']
    hotelId = request.form['hotelId']
    sql = "INSERT INTO hotelReviews (hotelId, review) VALUES (%s, %s)"

    cursor.execute(sql, (hotelId, review))
    conn.commit()
    
    return jsonify("Success")
    
@FlightsAPlenty.route("/getHotels", methods = ['GET', 'POST'])
def getHotels():
    hotelId = request.form['hotelQuery']
    sql = "SELECT * FROM hotels WHERE hotelId = %s"
    cursor.execute(sql, (hotelId))
    conn.commit()

    result = cursor.fetchone()
    return jsonify (result)


@FlightsAPlenty.route("/loadRelatedHotels", methods  = ['GET', 'POST'])
def loadHotels():
    destId = request.form['destQuery']
    sql = "SELECT hotelId, name, feature1Description,imageURL FROM hotels WHERE destId = %s"
    cursor.execute(sql, (destId))
    conn.commit()
    result = cursor.fetchall()
    return jsonify (result)

@FlightsAPlenty.route("/displayAllDestinations", methods = ['GET'])
def getAllDests():
    sql = "SELECT * FROM destinations"
    cursor.execute(sql)
    results = cursor.fetchall()
    return jsonify(results)

@FlightsAPlenty.route("/getSearchResults", methods = ['GET', 'POST'])
def getSearchResults():
    searchQuery = request.form['searchQuery']

    if searchQuery is None:
        sql = "SELECT * FROM destinations"
        cursor.execute(sql)
    else:
        sql = "SELECT * FROM destinations WHERE name LIKE %s"
        cursor.execute(sql,('%' + searchQuery + '%'))
    
    results = cursor.fetchall()

    return jsonify(results)

@FlightsAPlenty.route("/CheckIfSaved", methods = ['GET', 'POST'])
def checkSaved():
    username = request.form['username']
    destId = request.form['destId']

    sql = "SELECT * FROM favouriteDest WHERE username = %s and destId = %s"
    cursor.execute(sql, (username, destId))
   
    result = cursor.fetchone()
    if result is None:
        return jsonify(None)
    else:
        return jsonify ("Saved")

@FlightsAPlenty.route("/CheckIfHotelSaved", methods = ['GET', 'POST'])
def checkHotelSaved():
    username = request.form['username']
    hotelId = request.form['hotelId']

    sql = "SELECT * FROM favouriteHotels WHERE username = %s and hotelId = %s"
    cursor.execute (sql, (username, hotelId))

    result = cursor.fetchone()

    if result is None:
        return jsonify(None)
    else:
        return jsonify("Saved")

@FlightsAPlenty.route("/saveDestination", methods = ['GET','POST'])
def saveDest():
    username = request.form['username']
    destId = request.form['destId']
    sql = "INSERT INTO favouriteDest (username, destId) VALUES (%s, %s)"
    cursor.execute (sql, (username, destId))
    conn.commit()
    return jsonify("Success")

@FlightsAPlenty.route("/unsaveDestination", methods = ['GET', 'POST'])
def unsaveDest():
    username = request.form['username']
    destId = request.form['destId']
    sql = "DELETE FROM favouriteDest WHERE username = %s and destId = %s"
    cursor.execute(sql, (username, destId))
    conn.commit()
    return jsonify("Success")

@FlightsAPlenty.route("/saveHotel", methods = ['GET', 'POST'])
def saveHotel():
    username = request.form['username']
    hotelId = request.form['hotelId']
    
    sql = "INSERT INTO favouriteHotels (username, hotelId) VALUES (%s, %s)"
    cursor.execute(sql, (username, hotelId))
    conn.commit()
    return jsonify("Success")

@FlightsAPlenty.route("/unsaveHotel", methods = ['GET', 'POST'])
def unsaveHotel():
    username = request.form['username']
    hotelId = request.form['hotelId']
    sql = "DELETE FROM favouriteHotels WHERE username = %s and hotelId = %s"
    cursor.execute(sql, (username, hotelId))
    conn.commit()
    return jsonify ("Success")

@FlightsAPlenty.route("/getToken", methods  = ['GET', 'POST'])
def getToken():
    username = request.form ['username']
    password = request.form ['password']
    sql = "SELECT * FROM accounts WHERE username = %s"
    cursor.execute(sql, (username))
    account = cursor.fetchone()
    if account is None:
        return jsonify(None)
    else:
        hashed = account[1]
        if bcrypt.checkpw(password.encode('utf-8'), hashed.encode('utf-8')):
            token = jwt.encode({'user' : username, 'exp' : datetime.datetime.utcnow()+datetime.timedelta(minutes=30)}, FlightsAPlenty.config['SECRET_KEY'])
            return jsonify({'token':token})        
        else: 
            return jsonify(None)
       

def read_token(f):
    @wraps(f)
    def tokenised(*args, **kwargs):
        token = request.args.get('token')
        if not token:
            return jsonify({'response': 'Token is missing'}), 403
        try:
            data = jwt.decode(token, FlightsAPlenty.config['SECRET_KEY'])
            return jsonify(data)
        except:
            print("invalid token")
            return jsonify({'response': 'Token is invalid'}), 403
        return f(*args, **kwargs)
    return tokenised

@FlightsAPlenty.route("/validateToken",  methods = ['GET', 'POST'])
@read_token
def tokentest():
    return({'response': 'Welcome user'})

@FlightsAPlenty.route("/getUserInfo", methods = ['GET', 'POST'])
def getUser():
    args = request.args.get('username')

    sql = "SELECT * FROM accounts WHERE username = %s"
    sql2 = "SELECT * FROM favouriteDest WHERE username = %s"
    cursor.execute(sql, (args))
    accountInfo = cursor.fetchone()
    cursor.execute(sql2, (args))
    favouriteDestinations = cursor.fetchall()
    
    return jsonify(favouriteDestinations)

@FlightsAPlenty.route("/updateUsername", methods = ['GET', 'POST'])
def updateUsername():
    currentUsername = request.form['currentUsername']
    newUsername = request.form['newUsername']
    sql = "UPDATE accounts SET username = %s WHERE username = %s"
    cursor.execute(sql,(newUsername, currentUsername))
    conn.commit()
    token = jwt.encode({'user' : newUsername, 'exp' : datetime.datetime.utcnow()+datetime.timedelta(minutes=30)}, FlightsAPlenty.config['SECRET_KEY'])
    return jsonify({'token':token})

@FlightsAPlenty.route("/updatePassword", methods = ['GET', 'POST'])
def updatePassword():
    currentUsername = request.form['currentUsername']
    newPassword = request.form['newPassword']
    hashedpw = bcrypt.hashpw(newPassword.encode('utf-8'), bcrypt.gensalt())
    sql = "UPDATE accounts SET password = %s WHERE username = %s"
    cursor.execute(sql, (hashedpw, currentUsername))
    conn.commit()
    return jsonify("done")

FlightsAPlenty.run(host='cs2s.yorkdc.net', port=5012, debug = True)

