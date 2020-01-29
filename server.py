from flask import Flask, render_template,request,redirect, url_for,flash,session
import pymysql.cursors
import pymysql
import os
from werkzeug.utils import secure_filename
from datetime import datetime

conn = pymysql.connect(host='us-cdbr-iron-east-04.cleardb.net',user='be63818bc210f6',password='e9fbc669',db='heroku_0a5cc94ab1f62bc',charset='utf8mb4',cursorclass=pymysql.cursors.DictCursor)
blog = Flask(__name__)
blog.secret_key = 'omolewasteve'
UPLOAD_FOLDER = 'static/uploads/thumbnails/'
ALLOWED_EXTENSIONS = set(['jpg','png','jpeg','gif'])
blog.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER


@blog.route('/')
def home():
	with conn.cursor() as cursor:
		sql = "SELECT * FROM post ORDER BY id DESC"
		cursor.execute(sql)
		result = cursor.fetchall()
		if session and result:
			username = session['username']
			user_id = session['user_id']
			
			return render_template('home.html',session=session, result = result)
		else:
			return render_template('home.html',result = result)


@blog.route('/blog/<blog_id>')
def view(blog_id):
	id = blog_id
	with conn.cursor() as cursor:
		sql = "SELECT * FROM post WHERE id = %s"
		cursor.execute(sql,(id))
		result = cursor.fetchone()
		if session and result:
			username = session['username']
			user_id = session['user_id']
			
			return render_template('view.html',session=session, result = result)
		else:
			return render_template('view.html',result = result)


@blog.route('/about')
def about():
	return render_template('about.html')

def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@blog.route('/post')
def post():
	return render_template('post.html')

@blog.route('/post', methods = ['POST'])
def _post():
	error = None
	success = None
	if request.method == 'POST':
		title = request.form['title']
		content = request.form['content']
		thumbnail = request.files['thumbnail']
		user = session['username']
		createdAt = datetime.now()


		if thumbnail.filename == '':
			error = "No file selected as thumbnail."
			flash(error,'alert alert-danger')
			return redirect(url_for('post'))
		if thumbnail and allowed_file(thumbnail.filename):
			filename = secure_filename(thumbnail.filename)
			path = os.path.join(blog.config['UPLOAD_FOLDER'], filename)
			thumbnail.save(os.path.join(blog.config['UPLOAD_FOLDER'], filename))
			insert = "INSERT INTO post(`title`,`content`,`user`,`createdAt`,`path`)VALUES(%s,%s,%s,%s,%s)"
			with conn.cursor() as cursor:
				cursor.execute(insert,(title,content,user,createdAt,path))
				conn.commit()
				success = "Content Posted Successfully"
				flash(success,'alert alert-success')
				return redirect(url_for('post'))
		else:
			error = "Invalid file extension"
			flash(error,'alert alert-danger')
			return redirect(url_for('post'))
			

					



@blog.route('/logout')
def logout():
	session.clear()
	return redirect(url_for('home'))

@blog.route('/profile')
def profile():
	if session:
		user_id = session['user_id']
		username = session['username']
		email = session['email']
		return render_template('profile.html',session = session)
	else:
		return redirect(url_for())


@blog.route('/login')
def login():
	
	return render_template('login.html')
	

@blog.route('/login', methods=['POST'])
def _login():
	error = None
	if request.method == 'POST':
			username = request.form['username']
			password = request.form['password']

			
			with conn.cursor() as cursor:
				sql = "SELECT * FROM user WHERE username = %s AND password = %s"
				cursor.execute(sql,(username,password))
				result = cursor.fetchone()
			
				
				if result :
					session['user_id'] = result['id']
					session['username'] = result['username']
					session['email'] = result['email']
					
					return redirect(url_for('home'))
				else:
					error = "Invalid username or password. Please try again!"
					flash(error,'alert alert-danger')
					return redirect(url_for('login'))
			

		


@blog.route('/register')
def register():
	return render_template('register.html')

@blog.route('/register', methods = ['POST'])
def _register():  
	error = None
	success = None

	if request.method == 'POST':
				username = request.form['username']
				email = request.form['email']
				password = request.form['password']
				cpassword = request.form['cpassword']

				if password != cpassword:
					error = "Passwords must match"
					flash(error,'alert alert-danger')
				else:
					with conn.cursor() as cursor:
						sql = "SELECT * FROM user WHERE username = %s"
						cursor.execute(sql,(username))
						result = cursor.fetchone()

						sql_ = "SELECT * FROM user WHERE email = %s"
						cursor.execute(sql_,(email))
						result_ = cursor.fetchone()

						if result :
							error = "Username already in use. Try another"
							flash(error,'alert alert-danger')
							return redirect(url_for('register'))
						elif result_:
							error = "Email already associated with another account. Kindly login if yours !"
							flash(error,'alert alert-danger')
							return redirect(url_for('register'))
						else:
							insert = "INSERT INTO user(`username`,`password`,`email`)VALUES(%s,%s,%s)"
							cursor.execute(insert,(username,password,email))
							conn.commit()
							success = "Account registration successful. You may now login"
							flash(success,'alert alert-success')
							return redirect(url_for('register'))


if __name__ == '__main__':
	blog.run(debug = True)