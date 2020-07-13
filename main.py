from flask import Flask, render_template, request,session,redirect
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from werkzeug.utils import secure_filename
import json
import os
import math

with open('parameters.json','r') as c:
    param=json.load(c)["params"]
local=True

app = Flask(__name__)
app.config['SECRET_KEY'] = 'the random string' 
if(local):
    app.config['SQLALCHEMY_DATABASE_URI'] = param['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = param['prod_uri']
db = SQLAlchemy(app)


class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(20), nullable=False)
    phone = db.Column(db.String(12), nullable=False)
    msg = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(15))

class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    slug = db.Column(db.String(20), nullable=False)
    author = db.Column(db.String(40), nullable=False)
    title = db.Column(db.String(50), nullable=False)
    contents = db.Column(db.String(1000), nullable=False)
    date = db.Column(db.String(15))
    imgfile = db.Column(db.String(20), nullable=False)
    

@app.route("/")
def home():
    page=request.args.get('page')
    if(not str(page).isnumeric()):
        page=1
    page=int(page)
    post = Posts.query.filter_by().all()
    t_post=len(post)
    last=math.ceil(t_post/param['ppr'])
    start=(page-1)*param['ppr']
    if page > 1:
        prev="/?page="+str(page-1)
    else:
        prev="/"
    if page == last:
        nxt="/"
    else:
        nxt="/?page="+str(page+1)
    pst = Posts.query.filter_by().order_by(Posts.sno.desc()).all()[start:start+param['ppr']]
    return render_template('index.html',param=param,posts=pst,nxt=nxt,prev=prev)

@app.route("/post/<string:post_slug>", methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    if post is None:
        return redirect("/")
    else:
        return render_template('post.html',param=param,post=post)

@app.route("/dashboard", methods=['GET','POST'])
def dash():
    if 'user' in session and session['user'] == param['username']:
        post = Posts.query.all()
        return render_template('adminpannel.html',param=param,post=post)
    if request.method == 'POST':
        user=request.form.get('username')
        password=request.form.get('password')
        if user == param['username'] and password == param['password']:
            session['user']=param['username']
            post = Posts.query.all()
            return render_template('adminpannel.html',param=param,post=post)
        else:
            return render_template('login.html',param=param,error="Wrong username or password")

    return render_template('login.html',param=param,error="")


@app.route("/about")
def about():
    return render_template('about.html',param=param)


@app.route("/contact", methods = ['GET', 'POST'])
def contact():
    if(request.method=='POST'):
        '''Add entry to the database'''
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('msg')
        entry = Contacts(name=name, email = email, phone = phone, msg = message, date=datetime.now())
        db.session.add(entry)
        db.session.commit()
    return render_template('contact.html',param=param)

@app.route("/edit/<string:sno>",methods=['GET','POST'])
def edit(sno):
    if 'user' in session and session['user'] == param['username']:
        if request.method == 'POST':
            tit=request.form.get('title')
            content=request.form.get('contents')
            slug=request.form.get('slug')
            imgfile=request.files['imgfile']
            author=request.form.get('author')
            post = Posts.query.filter_by(sno=sno).first()
            if imgfile.filename != '':
                basepath = os.path.dirname(__file__)
                img="uploads/"+secure_filename(imgfile.filename)
                print(img)
                file_path = os.path.join(basepath, 'static/uploads', secure_filename(imgfile.filename))
                imgfile.save(file_path)
                post.imgfile=img
            post.title=tit
            post.contents=content
            post.slug=slug
            post.author=author
            posta= Posts.query.all();
            return redirect("/dashboard")

        p = Posts.query.filter_by(sno=sno).first()
        return render_template("edit.html",param=param,post=p)
    else:
        return redirect("/dashboard")

@app.route("/delete/<string:sno>",methods=['GET','POST'])
def delete(sno):
    if 'user' in session and session['user'] == param['username']:
         post = Posts.query.filter_by(sno=sno).first()
         db.session.delete(post)
         db.session.commit();
         return redirect('/dashboard')
    return redirect('dashboard')




@app.route("/logout")
def logout():
    session.pop('user')
    return redirect("/dashboard")

@app.route('/add',methods=['GET','POST'])
def add():
    if 'user' in session and session['user'] == param['username']:
        if request.method == 'POST':
            title=request.form.get('title')
            contents=request.form.get('contents')
            slug=request.form.get('slug')
            author=request.form.get('author')
            imgfile=request.files['imgfile']
            if imgfile.filename == '':
                p = Posts(title=title,contents=contents,slug=slug,imgfile='uploads/dummy.jpg',author=author,date=datetime.now())
            else:
                basepath = os.path.dirname(__file__)
                img="uploads/"+secure_filename(imgfile.filename)
                print(img)
                file_path = os.path.join(basepath, 'static/uploads', secure_filename(imgfile.filename))
                imgfile.save(file_path)
                p = Posts(title=title,contents=contents,slug=slug,imgfile=img,author=author,date=datetime.now())
            db.session.add(p)
            db.session.commit()
            return redirect('/dashboard')
        return render_template("addblog.html",param=param)
    return redirect('/dashboard')



app.run(debug=True)
