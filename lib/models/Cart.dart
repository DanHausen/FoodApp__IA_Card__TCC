//TODO Estou fazendo o map do carrinho funcionar

class Cart {
  static var cartList = new Map();

  static var item = {};
  static int x = 0;
  static bool inDict = false;

  static void ItemAddToCart(String _name, var _qtdeItems) {
    item = {
      'Name': _name,
      'Quantidade': _qtdeItems,
    };

    if (cartList.isEmpty) {
      x = 0;
      cartList[x] = item;
      x++;
    } else {
      cartList.forEach((key, value) {
        if (value["Name"] == _name) {
          value["Quantidade"] += _qtdeItems;
          inDict = true;
        }
      });
      if (!inDict) {
        cartList[x] = item;
        x++;
      }
      inDict = false;
    }
    print(cartList);
  }

  static void DeleteCartItems() {
    for (var i = 0; i < cartList.length; i++) {
      cartList.remove(i);
    }
  }
}
