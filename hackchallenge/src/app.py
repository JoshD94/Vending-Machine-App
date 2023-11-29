import json
from db import db
from flask import Flask, request
from db import Machine, Item, User, Transaction
import datetime

app = Flask(__name__)
db_filename = "vending.db"

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

# -- MACHINE ROUTES -- 
@app.route("/")
@app.route("/api/machines/")
def get_machines():
    """
    Endpoint for getting all machine
    """
    machines = [machine.serialize() for machine in Machine.query.all()]
    return success_response({"machines": machines})

@app.route("/api/machines/<int:machine_id>/")
def get_machine(machine_id):
    """
    Endpoint for getting a machine by id
    """
    machine = Machine.query.filter_by(id=machine_id).first()
    if machine is None:
        return failure_response("Machine not found")
    return success_response(machine.serialize())

@app.route("/api/machines/", methods=["POST"])
def create_machine():
    """
    Endpoint for creating a new machine
    """
    body = json.loads(request.data)
    new_machine = Machine(
        location = body.get("location"),
        takes_brbs = body.get("takes_brbs"),
        takes_card = body.get("takes_card"),
        takes_cash = body.get("takes_cash"),
        image_url = body.get("image_url")
        )
    
    db.session.add(new_machine)
    db.session.commit()
    return success_response(new_machine.serialize(), 201)

@app.route("/api/machines/<int:machine_id>/", methods=["POST"])
def update_machine(machine_id):
    """
    Endpoint for updating a machine by id
    """
    body = json.loads(request.data)
    location = body.get("location")
    takes_brbs = body.get("takes_brbs")
    takes_card = body.get("takes_card")
    takes_cash = body.get("takes_cash")
    image_url = body.get("image_url")
    machine = Machine.query.filter_by(id=machine_id).first()
    if machine is None:
        return failure_response("Machine not found")
    machine.location = location
    machine.takes_brbs = takes_brbs
    machine.takes_card = takes_card
    machine.takes_cash = takes_cash
    machine.image_url = image_url
    db.session.commit()
    return success_response(machine.serialize(), 201)

@app.route("/api/machines/<int:machine_id>/", methods=["DELETE"])
def delete_machine(machine_id):
    """
    Endpoint for deleting a machine by id
    """
    machine = Machine.query.filter_by(id=machine_id).first()
    if machine is None:
        return failure_response("Machine not found")
    db.session.delete(machine)
    db.session.commit()
    return success_response(machine.serialize())


# -- ITEM ROUTES -- 
@app.route("/api/items/<int:item_id>/")
def get_item(item_id):
    """
    Endpoint for getting an item by id
    """
    item = Item.query.filter_by(id=item_id).first()
    if item is None:
        return failure_response("Item not found")
    return success_response(item.serialize())

@app.route("/api/items/", methods=["POST"])
def create_item():
    """
    Endpoint for creating an new item
    """
    body = json.loads(request.data)
    new_item = Item(
        name = body.get("name"),
        price = body.get("price"),
        quantity = body.get("quantity"),
        machine_id = body.get("machine_id"),
        image_url = body.get("image_url")
        )
    db.session.add(new_item)
    db.session.commit()
    return success_response(new_item.serialize(), 201)

@app.route("/api/items/<int:item_id>/", methods=["POST"])
def update_item(item_id):
    """
    Endpoint for updating an item by id
    """
    body = json.loads(request.data)
    name = body.get("name")
    price = body.get("price")
    quantity = body.get("quantity")
    machine_id = body.get("machine_id")
    image_url = body.get("image_url")
    item = Item.query.filter_by(id=item_id).first()
    if item is None:
        return failure_response("Item not found")
    item.name = name
    item.price = price
    item.quantity = quantity
    item.machine_id = machine_id
    item.image_url = image_url
    db.session.commit()
    return success_response(item.serialize(), 201)

@app.route("/api/items/<int:item_id>/", methods=["DELETE"])
def delete_item(item_id):
    """
    Endpoint for deleting an item by id
    """
    item = Item.query.filter_by(id=item_id).first()
    if item is None:
        return failure_response("Item not found")
    db.session.delete(item)
    db.session.commit()
    return success_response(item.serialize())

# -- USER ROUTES -- 
@app.route("/api/users/<int:user_id>/")
def get_user(user_id):
    """
    Endpoint for getting a user by id
    """
    user = User.query.filter_by(id=user_id).first()
    if user is None:
        return failure_response("User not found")
    return success_response(user.serialize())

@app.route("/api/users/", methods=["POST"])
def create_user():
    """
    Endpoint for creating a new User
    """
    body = json.loads(request.data)
    new_user = User(name=body.get("name"), balance=20)
    db.session.add(new_user)
    db.session.commit()
    return success_response(new_user.serialize(), 201)

@app.route("/api/users/<int:user_id>/", methods=["POST"])
def update_balance(user_id):
    """
    Endpoint for updating a User's balance
    """
    user = User.query.filter_by(id=user_id).first()
    if user is None:
        return failure_response("User not found")
    body = json.loads(request.data)
    user.balance += body.get("amount")
    db.session.commit()
    return success_response(user.serialize())

@app.route("/api/users/<int:user_id>/", methods=["DELETE"])
def delete_user(user_id):
    """
    Endpoint for deleting a user by id
    """
    user = User.query.filter_by(id=user_id).first()
    if user is None:
        return failure_response("User not found")
    db.session.delete(user)
    db.session.commit()
    return success_response(user.serialize())

# -- TRANSACTION ROUTES -- 
@app.route("/api/trxns/<int:trxn_id>/")
def get_trxn(trxn_id):
    """
    Endpoint for getting a transaction by id
    """
    trxn = Transaction.query.filter_by(id=trxn_id).first()
    if trxn is None:
        return failure_response("trxn not found")
    return success_response(trxn.serialize())

@app.route("/api/trxns/", methods=["POST"])
def create_trxn():
    """
    Endpoint for creating an new trxn
    """
    body = json.loads(request.data)
    new_trxn = Transaction(
        time = str(datetime.datetime.now()),
        user_id = body.get("user_id"),
        machine_id = body.get("machine_id"),
        item_id = body.get("item_id")
    )
    
    item = Item.query.filter_by(id=new_trxn.item_id).first()
    user = User.query.filter_by(id=new_trxn.user_id).first()
    if(item.quantity > 0 and user.balance >= item.price):
        item.quantity -= 1
        user.balance -= item.price
    else:
        return failure_response("Item out of stock or you don't have sufficient funds!", 401)

    db.session.add(new_trxn)
    db.session.commit()
    return success_response(new_trxn.serialize(), 201)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)
