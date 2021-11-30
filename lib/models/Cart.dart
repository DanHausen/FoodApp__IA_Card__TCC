class Cart {
  static var cartList = {};

  static var item = new Map();

  static void ItemAddToCart(String name, var qtdeItems) {
    item = {
      'Name': name,
      'Quantidade': qtdeItems,
    };
    Cart.cartList = item;
    print(Cart.cartList);
  }
}
