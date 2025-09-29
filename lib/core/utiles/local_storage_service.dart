import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unique_supplement/features/cart/data/models/cart_model.dart';
import 'package:unique_supplement/features/home/data/models/product_model/product_model.dart';

class LocalStorageService {
  static const String _cartKey = 'cart_items';
  static const String _favKey = 'fav_items';
  static const String _userInfoKey = 'user_info';

  // ===================== CART =====================

  static Future<void> saveCartItems(List<CartItemModel> items) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(items.map((item) => item.toJson()).toList());
    await prefs.setString(_cartKey, encoded);
  }

  static Future<List<CartItemModel>> loadCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_cartKey);
    if (data == null) return [];
    final decoded = jsonDecode(data) as List;
    return decoded.map((e) => CartItemModel.fromJson(e)).toList();
  }

  static Future<void> clearCart() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_cartKey);
  }

  static Future<void> addToCart(CartItemModel item) async {
    final items = await loadCartItems();
    items.add(item);
    await saveCartItems(items);
  }

  static Future<void> removeFromCart(int productId) async {
    final items = await loadCartItems();
    items.removeWhere((item) => item.product.id == productId);
    await saveCartItems(items);
  }

  // ===================== FAVORITES =====================

  static Future<void> saveFavorites(List<ProductModel> products) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(products.map((p) => p.toJson()).toList());
    await prefs.setString(_favKey, encoded);
  }

  static Future<List<ProductModel>> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_favKey);
    if (data == null) return [];
    final decoded = jsonDecode(data) as List;
    return decoded.map((e) => ProductModel.fromJson(e)).toList();
  }

  static Future<void> clearFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_favKey);
  }

  static Future<void> addToFavorites(ProductModel product) async {
    final favs = await loadFavorites();
    if (!favs.any((p) => p.id == product.id)) {
      favs.add(product);
      await saveFavorites(favs);
    }
  }

  static Future<void> removeFromFavorites(ProductModel product) async {
    final favs = await loadFavorites();
    favs.removeWhere((p) => p.id == product.id);
    await saveFavorites(favs);
  }

  static Future<bool> isFavorite(ProductModel product) async {
    final favs = await loadFavorites();
    return favs.any((p) => p.id == product.id);
  }

  // ===================== USER INFO =====================

  static Future<void> saveUserInfo(Map<String, String> userInfo) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(userInfo);
    await prefs.setString(_userInfoKey, encoded);
  }

  static Future<Map<String, String>> loadUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_userInfoKey);
    if (data == null) return {};
    final decoded = jsonDecode(data);
    return Map<String, String>.from(decoded);
  }

  static Future<void> clearUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userInfoKey);
  }
}
