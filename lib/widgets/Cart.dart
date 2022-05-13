class Cart {
  static var cartList = new Map();

  static var item = {};
  static int x = 0;
  static int cartAmount = 0;
  static bool insideDict = false;

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
    // print(cartList);
    // print(cartList[1]["Name"]);
  }

  static void deleteCartItems() {
    for (var i = 0; i < cartList.length; i++) {
      cartList.remove(i);
    }
  }

  static void deleteSelectedCartItem(var _key) {
    cartAmount -= cartList[_key]["Quantidade"];
    cartList.remove(_key);
  }
}

// class CartCard {
//   final String titleName;
//   final int productAmount;
//   final double productPrice;

//   CartCard(this.titleName, this.productAmount, this.productPrice);
// }
