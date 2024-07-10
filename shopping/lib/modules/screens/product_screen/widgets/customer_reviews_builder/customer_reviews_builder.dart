import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jars/jars.dart';
import 'package:shared/models.dart';
import 'package:readmore/readmore.dart';
import 'package:shopping/modules/screens/product_screen/widgets/customer_reviews_builder/customer_reviews_cubit.dart';

class CustomerReviewCard extends StatelessWidget {
  final Review review;
  final VoidCallback? onReport;
  const CustomerReviewCard({
    super.key,
    required this.review,
    this.onReport,
  });

  @override
  Widget build(BuildContext context) {
    var label = context.textTheme.labelMedium;
    var ratingBar = RatingBarIndicator(
      rating: review.rating!.toRoundPrecision(1).toDouble(),
      itemSize: 12,
      itemBuilder: (context, index) => const Icon(Icons.star, color: Colors.amber),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(),
        Row(children: [
          const Icon(Icons.account_circle_rounded, size: 12),
          2.gap,
          Text(review.reviewedBy!, style: label),
          const Spacer(),
          Text(review.lastUpdateAt.format().yMMMd(), style: label),
        ]),
        2.gap,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ratingBar,
            4.gap,
            Text(
              'Verified Purchase',
              style: label?.copyWith(color: context.theme.primaryColor),
            ),
            const Spacer(),
            InkWell(
              onTap: onReport,
              child: Text(
                'Report',
                style: label?.copyWith(color: context.colorScheme.error, fontWeight: FontWeight.normal),
              ),
            )
          ],
        ),
        Text(review.title).paddingOnly(top: 4),
        // if (review.imageUrls.isNotEmpty)
        //   SizedBox(
        //     height: 68,
        //     child: ListView.builder(
        //       scrollDirection: Axis.horizontal,
        //       itemCount: review.imageUrls.length,
        //       itemBuilder: (context, i) => CachedNetworkImage(
        //         imageUrl: review.imageUrls[i],
        //         height: 68,
        //         width: 68,
        //         fit: BoxFit.cover,
        //       ).paddingOnly(right: 8),
        //     ),
        //   ).paddingVertical(4),
        if (review.text != null) ReadMoreText(review.text!),
      ],
    );
  }
}

class CustomerReviewsBuilder extends StatelessWidget {
  final String productId;
  final double rating;
  final String totalReviews;

  const CustomerReviewsBuilder({
    super.key,
    required this.productId,
    required this.rating,
    required this.totalReviews,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerReviewsCubit(productId: productId),
      child: ListView(
          shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), children: buildItems(context)),
    );
  }

  List<Widget> buildItems(BuildContext context) {
    var titleMedium = context.textTheme.titleMedium;
    // var label = context.textTheme.labelMedium;

    var ratingBar = RatingBarIndicator(
      rating: rating,
      itemSize: 18,
      itemBuilder: (context, index) => const Icon(Icons.star, color: Colors.amber),
    );

    return [
      Text('CUSTOMER REVIEWS', style: titleMedium),
      24.gap,
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(mainAxisSize: MainAxisSize.min, children: [
            ratingBar,
            8.gap,
            Text(
              '$rating out of 5',
              style: titleMedium,
            ),
          ]),
          const Divider(
            indent: 50,
            endIndent: 50,
          ),
          Text('$totalReviews reviews'),
        ],
      ),
      24.gap,
      customerReviewsCard(),
    ];
  }

  BlocBuilder<CustomerReviewsCubit, BlocState<dynamic>> customerReviewsCard() {
    return BlocBuilder<CustomerReviewsCubit, BlocState>(
      builder: (context, state) => state.on(
          onInitial: const CircularProgressIndicator(),
          onSuccess: (state) => state.data.isEmpty
              ? const SizedBox.shrink()
              : ListView.builder(
                  itemCount: state.data.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, i) => CustomerReviewCard(review: state.data[i]))),
    );
  }
}
