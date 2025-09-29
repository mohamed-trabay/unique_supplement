import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unique_supplement/core/theme/app_theme.dart';
import 'package:unique_supplement/core/utiles/app_router.dart';
import 'package:unique_supplement/features/fav/presentation/manger/fav_cubit/fav_cubit.dart';

class UniqueSupplement extends StatelessWidget {
  const UniqueSupplement({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavCubit()..loadFavorites(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,

        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,

          routerConfig: AppRouter.router,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          // ignore: avoid_redundant_argument_values
          themeMode: ThemeMode.system,
          builder: (context, child) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: child!,
            );
          },
        ),
      ),
    );
  }
}
