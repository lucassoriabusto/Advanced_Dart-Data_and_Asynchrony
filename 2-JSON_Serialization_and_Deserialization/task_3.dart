import 'dart:convert';

class Customer {
  int id;
  String name;

  Customer(this.id, this.name);

  Customer.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'name': name
    };
  }
}

class Order{
  int orderId;
  Customer customer;
  double total;

  Order(this.orderId, this.customer, this.total);

  Order.fromJson(Map<String, dynamic> json)
      : orderId = json['orderId'],
        customer = Customer.fromJson(json['customer']),
        total = json['total'];

  Map<String, dynamic> toJson(){
    return {
      'orderId': orderId,
      'customer': customer.toJson(),
      'total': total
    };
  }
}


void main(){
  String jsonString = '''
  {
    "orderId": 101,
    "customer": {
      "id": 5,
      "name": "Bob"
    },
    "total": 99.99
  }
  ''';

  Map<String, dynamic> jsonMap = jsonDecode(jsonString);

  Order order = Order.fromJson(jsonMap);
  
  Map<String, dynamic> userMap = order.toJson();
  String encode = jsonEncode(userMap);
  print(encode);
}
