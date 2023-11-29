import json
from db import db
from flask import Flask, request
from db import Course, Assignment, User

app = Flask(__name__)
db_filename = "cms.db"

app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///%s" % db_filename
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["SQLALCHEMY_ECHO"] = True

db.init_app(app)
with app.app_context():
    db.create_all()

# generalized response formats
def success_response(data, code=200):
    return json.dumps(data), code

def failure_response(message, code=404):
    return json.dumps({"error": message}), code

# -- COURSE ROUTES --

@app.route("/")
@app.route("/api/courses/")
def get_courses():
    """
    Endpoint for getting all courses
    """
    courses = [course.serialize() for course in Course.query.all()]
    return success_response({"courses": courses})

@app.route("/api/courses/", methods=["POST"])
def create_course():
    """
    Endpoint for creating a new course
    """
    body = json.loads(request.data)
    new_course = Course(code = body.get("code"), name = body.get("name"))
    db.session.add(new_course)
    db.session.commit()
    return success_response(new_course.serialize(), 201)

@app.route("/api/courses/<int:course_id>/")
def get_course(course_id):
    """
    Endpoint for getting a course by id
    """
    course = Course.query.filter_by(id=course_id).first()
    if course is None:
        return failure_response("Course not found")
    return success_response(course.serialize())

@app.route("/api/courses/<int:course_id>/", methods=["DELETE"])
def delete_course(course_id):
    """
    Endpoint for deleting a task by id
    """
    course = Course.query.filter_by(id=course_id).first()
    if course is None:
        return failure_response("Course not found")
    db.session.delete(course)
    db.session.commit()
    return success_response(course.serialize())

# -- USER ROUTES --

@app.route("/api/users/", methods=["POST"])
def create_user():
    """
    Endpoint for creating a new User
    """
    body = json.loads(request.data)
    new_user = User(name=body.get("name"), netid=body.get("netid"))
    db.session.add(new_user)
    db.session.commit()
    return success_response(new_user.serialize(), 201)

@app.route("/api/users/<int:user_id>/")
def get_user(user_id):
    """
    Endpoint for getting a user by id
    """
    user = User.query.filter_by(id=user_id).first()
    if user is None:
        return failure_response("User not found")
    return success_response(user.serialize())

@app.route("/api/courses/<int:course_id>/add/", methods=["POST"])
def add_user_to_course(course_id):
    """
    Endpoint for adding user by id to a course by id and 
    assigning student or instructor status
    """
    body = json.loads(request.data)
    user_id = body.get("user_id")
    type = body.get("type")
    user = User.query.filter_by(id=user_id).first()
    course = Course.query.filter_by(id=course_id).first()
    if user is None:
        return failure_response("User not found")
    if course is None:
        return failure_response("Course not found")
    # Add to users
    course.users.append(user)
    # if type == "instructor":
    #     course.set_role(True)
    # elif type == "student":
    #     course.set_role(False)
    # else:
    #     return failure_response("Incorrect input in 'type' field", 400)
    db.session.commit()
    course = Course.query.filter_by(id=course_id).first()
    return success_response(course.serialize())

# -- ASSIGNMENT ROUTES --

@app.route("/api/courses/<int:course_id>/assignment/", methods=["POST"])
def create_assignment(course_id):
    """
    Endpoint for creating an assignment under a course
    """
    course = Course.query.filter_by(id=course_id).first()
    if course is None:
        return failure_response("Course not found")
    body = json.loads(request.data)
    title = body.get("title")
    due_date = body.get("due_date")
    if title is None:
        return failure_response("Title field is empty", 400)
    if due_date is None:
        return failure_response("Due date field is empty", 400)

    # Create new assignment
    assignment = Assignment(title=title, due_date=due_date, course_id=course_id)
    course.assignments.append(assignment)
    db.session.commit()
    return success_response(assignment.serialize())

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)
