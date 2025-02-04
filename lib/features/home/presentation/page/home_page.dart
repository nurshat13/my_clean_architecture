import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_clean_architecture/core/constants/app_colors.dart';
import 'package:my_clean_architecture/core/navigation/app_router.dart';
import 'package:my_clean_architecture/core/theme/app_theme.dart';
import 'package:my_clean_architecture/core/widgets/peimary_text_field.dart';
import 'package:my_clean_architecture/features/home/data/models/post_model.dart';
import 'package:my_clean_architecture/features/home/presentation/bloc/home_bloc.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? _debounce;

  void _onSearchChanged(String query) {
    // Cancel the previous timer if still active
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    // Set a new debounce timer
    _debounce = Timer(const Duration(milliseconds: 500), () {
      context.read<HomeBloc>().add(GetPosts(searchId: query));
    });
  }

  @override
  void dispose() {
    // Dispose of the timer when the widget is disposed
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            PrimaryTextField(
              labelText: 'Пойск по ID',
              keyboardType: TextInputType.number,
              onChanged: _onSearchChanged,
            ).paddingAll(12.sp),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is GetPostsFetched) {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      PostModel post = state.posts[index];
                      return InkWell(
                        onTap: () async {
                          await context.router.push(PostDetailRoute(id: post.id ?? 0));
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.r),
                          margin: EdgeInsets.symmetric(horizontal: 12.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: AppColors.primaryLight(context),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(post.thumbnail ?? ''),
                                onBackgroundImageError: (exception, stackTrace) {},
                              ),
                              12.horizontalSpace,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 250.w,
                                    child: Text(
                                      post.title ?? '',
                                      //  overflow: TextOverflow.ellipsis,
                                      style: APP_THEME(context).textTheme.labelLarge,
                                    ),
                                  ),
                                  8.verticalSpace,
                                  Text(
                                    post.publishedAt ?? '',
                                    style: APP_THEME(context).textTheme.labelSmall?.copyWith(color: AppColors.gray),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return 8.verticalSpace;
                    },
                    itemCount: state.posts.length,
                  ).expanded();
                }

                if (state is GetPostsLoading) return const CircularProgressIndicator.adaptive().toCenter();
                if (state is GetPostsFailure) return Text(state.error.message).toCenter();
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
