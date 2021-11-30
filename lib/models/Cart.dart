class Cart {
  static var cartList = new Map();

  static var item = new Map();
  static int x = 0;

  static void ItemAddToCart(String name, var qtdeItems) {
    item = {
      'Name': name,
      'Quantidade': qtdeItems,
    };
    Cart.cartList[x] = item;
    x++;
    // Cart.cartList.forEach((key, value) {
    //   print(key);
    // });
    print(cartList);
  }
}
