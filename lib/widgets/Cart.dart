class Cart {
  static var cartList = new Map();

  static var item = {};
  static int x = 0;
  static int cartAmount = 0;
  static bool insideDict = false;
  static var totalPrice = 0.0;

  static void itemAddToCart(String _name, var _qtdeItems, var _productPrice) {
    item = {
      'Name': _name,
      'Quantidade': _qtdeItems,
      'Price': _productPrice,
    };

    if (cartList.isEmpty) {
      x = 0;
      cartAmount = 0;
      cartList[x] = item;
      cartAmount += _qtdeItems;
      x++;
    } else {
      cartList.forEach((key, value) {
        if (value["Name"] == _name) {
          value["Quantidade"] += _qtdeItems;
          value["Price"] += _productPrice;
          insideDict = true;
        }
      });
      if (!insideDict) {
        cartList[x] = item;
        x++;
      }
      insideDict = false;
      cartAmount += _qtdeItems;
    }
    totalPrice += _productPrice;
  }

  static void deleteSelectedCartItem(int _key) {
    if (!cartList.isEmpty) {
      int amountSelected = cartList[_key]["Quantidade"];
      if (amountSelected == null) {
        return;
      } else {
        cartAmount -= amountSelected;
        cartList.remove(_key);
        totalPriceUpdate(_key);
      }
    } else {
      return;
    }
  }

  static void totalPriceUpdate([var _key]) {
    totalPrice -= cartList.values.elementAt(_key)["Price"];
  }
}
