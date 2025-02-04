import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_clean_architecture/core/constants/app_colors.dart';
import 'package:my_clean_architecture/core/theme/app_theme.dart';
import 'package:my_clean_architecture/features/home/data/models/post_model.dart';
import 'package:my_clean_architecture/features/home/presentation/bloc/home_bloc.dart';

@RoutePage()
class PostDetailPage extends StatelessWidget {
  const PostDetailPage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: HomeBloc()..add(GetPostByID(id)),
        builder: (context, state) {
          if (state is GetPostByIDFetched) return _Body(postModel: state.post);
          if (state is GetPostByIDLoading) return const CircularProgressIndicator.adaptive().toCenter();
          if (state is GetPostByIDFailure) return Center(child: Text(state.error.message));
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.postModel,
  });
  final PostModel postModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            postModel.title ?? '',
            style: APP_THEME(context).textTheme.titleLarge?.copyWith(fontSize: 24),
          ),
          12.verticalSpace,
          Container(
            height: 200.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: AppColors.primaryLight(context),
              image: DecorationImage(
                image: NetworkImage(postModel.image ?? ''),
                fit: BoxFit.cover,
              ),
            ),
          ),
          6.verticalSpace,
          Text(
            postModel.publishedAt ?? '',
            style: APP_THEME(context).textTheme.labelSmall?.copyWith(color: AppColors.gray),
          ),
          12.verticalSpace,
          Text(
            postModel.content ?? '',
            style: APP_THEME(context).textTheme.bodyLarge?.copyWith(fontSize: 15),
          ),
        ],
      ).paddingAll(12.sp),
    );
  }
}
