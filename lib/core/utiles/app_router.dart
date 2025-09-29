import 'package:go_router/go_router.dart';
import 'package:unique_supplement/features/cart/presentation/view/cart_view.dart';
import 'package:unique_supplement/features/home/data/models/product_model/product_model.dart';
import 'package:unique_supplement/features/home/presentation/viwes/category_view.dart';
import 'package:unique_supplement/features/home/presentation/viwes/home_view.dart';
import 'package:unique_supplement/features/home/presentation/viwes/item_details_view.dart';
import 'package:unique_supplement/features/home/presentation/viwes/newest_items_view.dart';
import 'package:unique_supplement/features/main_layout/presentation/views/main_layout.dart';
import 'package:unique_supplement/features/profiel/presentation/views/user_details_view.dart';
import 'package:unique_supplement/features/search/presentation/views/search_view.dart';
import 'package:unique_supplement/features/splash/presentation/views/splash_view.dart';
import 'package:unique_supplement/features/store/presentation/view/store_view.dart';

abstract class AppRouter {
  static const kHomeView = '/home';
  static const kCategoryView = '/categories';
  static const kCartView = '/cart';

  static const kNewestItemsView = '/newestItems';
  static const kItemDetailsView = '/itemDetails';
  static const kSerchView = '/searchview';
  static const kStoreView = '/storeview';
  static const kUserDetailsView = '/userview';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),

      ShellRoute(
        builder: (context, state, child) {
          return const MainLayout();
        },
        routes: [
          GoRoute(
            path: kHomeView,
            builder: (context, state) => const HomeView(),
          ),
        ],
      ),
      GoRoute(path: kCartView, builder: (context, state) => const CartView()),
      GoRoute(
        path: kCategoryView,
        builder: (context, state) => const CategoryView(),
      ),

      GoRoute(
        path: kNewestItemsView,
        builder: (context, state) => const NewestItemsView(),
      ),
      GoRoute(
        path: kItemDetailsView,
        builder: (context, state) {
          final productmodel = state.extra as ProductModel;
          return ItemDetailsView(productmodel: productmodel);
        },
      ),
      GoRoute(
        path: kSerchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(path: kStoreView, builder: (context, state) => const StoreView()),
      GoRoute(
        path: kUserDetailsView,
        builder: (context, state) => const UserDetailsView(),
      ),
    ],
  );
}
