from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class Machine(db.Model):
    '''
    Machine model
    '''
    __tablename__ = "machine"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    location = db.Column(db.String, nullable=False)
    takes_brbs = db.Column(db.Boolean, nullable=False)
    takes_card = db.Column(db.Boolean, nullable=False)
    takes_cash = db.Column(db.Boolean, nullable=False)
    items = db.relationship("Item",  cascade="delete")
    transactions = db.relationship("Transaction", cascade="delete")
    image_url = db.Column(db.String, nullable=False)

    def __init__(self, **kwargs):
        '''
        Initialize a Machine object
        '''
        self.location = kwargs.get("location", "")
        self.takes_brbs = kwargs.get("takes_brbs", "")
        self.takes_card = kwargs.get("takes_card", "")
        self.takes_cash = kwargs.get("takes_cash", "")
        self.image_url = kwargs.get("image_url", "")

    def serialize(self):
        '''
        Serialize a Machine object
        '''
        return {
            "id": self.id,
            "location": self.location,
            "takes_brbs": self.takes_brbs,
            "takes_card": self.takes_card,
            "takes_cash": self.takes_cash,
            "items": [i.serialize() for i in self.items],
            "transactions": [t.serialize() for t in self.transactions],
            "image_url": self.image_url
        }
    
class Item(db.Model):
    '''
    Item model
    '''
    __tablename__ = "item"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String, nullable=False)
    price = db.Column(db.Float, nullable=False)
    quantity = db.Column(db.Integer, nullable=False)
    machine_id = db.Column(db.Integer, db.ForeignKey("machine.id"), nullable=False)
    image_url = db.Column(db.String, nullable=False)

    def __init__(self, **kwargs):
        '''
        Initialize an Item object
        '''
        self.name = kwargs.get("name", "")
        self.price = kwargs.get("price", 0.0)
        self.quantity = kwargs.get("quantity", 0)
        self.machine_id = kwargs.get("machine_id")
        self.image_url = kwargs.get("image_url", "")

    def serialize(self):
        '''
        Serialize an Item object
        '''
        return {
            "id": self.id,
            "name": self.name,
            "price": self.price,
            "quantity": self.quantity,
            "machine_id": self.machine_id,
            "image_url": self.image_url
        }

class User(db.Model):
    '''
    User model
    '''
    __tablename__ = "user"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String, nullable=False)
    balance = db.Column(db.Float, nullable=False)
    transactions = db.relationship("Transaction",  cascade="delete")

    def __init__(self, **kwargs):
        '''
        Initialize a User object
        '''
        self.name = kwargs.get("name", "")
        self.balance = kwargs.get("balance", 0.0)
        
    def serialize(self):
        '''
        Serialize a User object
        '''
        return {
            "id": self.id,
            "name": self.name,
            "balance": self.balance,
            "transactions": [t.serialize() for t in self.transactions]
        }

class Transaction(db.Model):
    '''
    Transaction model
    '''
    __tablename__ = "transaction"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    time = db.Column(db.String, nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey("user.id"), nullable=False)
    machine_id = db.Column(db.Integer, db.ForeignKey("machine.id"), nullable=False)
    item_id = db.Column(db.Integer, db.ForeignKey("item.id"), nullable=False)

    def __init__(self, **kwargs):
        '''
        Initialize a Transaction object
        '''
        self.time = kwargs.get("time", "")
        self.user_id = kwargs.get("user_id")
        self.machine_id = kwargs.get("machine_id")
        self.item_id = kwargs.get("item_id")

    def serialize(self):
        '''
        Serialize a Transaction object
        '''
        return {
            "id": self.id,
            "time": self.time,
            "user_id": self.user_id,
            "machine_id": self.machine_id,
            "item_id": self.item_id
        }