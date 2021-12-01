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

    // for (var i = 0; i < 15; i++) {
    //   cartList.remove(i);
    // }
    if (cartList.isEmpty) {
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

  static void DeleteCartItems() {}
}
