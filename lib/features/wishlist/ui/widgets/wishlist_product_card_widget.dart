import 'package:craftybay/features/common/data/models/product_pagination_model/product_pagination_model.dart';
import 'package:craftybay/features/product/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../../application/app_colors.dart';
import '../../data/models/wishlist_item_list_data_model.dart';

class WishlistProductCardWidget extends StatefulWidget {
  const WishlistProductCardWidget({
    super.key,
    required this.wishlistItem,
  });

  final WishlistItemModel wishlistItem;

  @override
  State<WishlistProductCardWidget> createState() => _WishlistProductCardWidgetState();
}

class _WishlistProductCardWidgetState extends State<WishlistProductCardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductDetailsScreen.name,
            arguments: {
          "productList": widget.wishlistItem
            }
        );
      },
      child: SizedBox(
        width: 150,
        child: Card(
          elevation: 5,
          shadowColor: Colors.black.withValues(alpha: 0.3),
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                    color: AppColors.themeColor.withValues(alpha: 0.2),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)
                    )
                ),
                child: Image.network(
                  (widget.wishlistItem.product?.photos?.isNotEmpty ?? false)
                      ? widget.wishlistItem.product!.photos!.first
                      : "https://fastly.picsum.photos/id/21/3008/2008.jpg?hmac=T8DSVNvP-QldCew7WD4jj_S3mWwxZPqdF0CNPksSko4",
                  fit: BoxFit.cover,
                  width: 150,
                  height: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.wishlistItem.product?.title ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    const SizedBox(height: 2,),
                    Wrap(
                      spacing: 6,
                      children: [
                        Text("\$${widget.wishlistItem.product?.currentPrice ?? ""}", style: const TextStyle(
                          color: AppColors.themeColor,
                          fontWeight: FontWeight.w700,
                        ),),
                         Wrap(
                           children: [
                             const Icon(Icons.star_rounded, color: Colors.amber, size: 18,),
                             Text("${widget.wishlistItem.product?.quantity ?? ""}"),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: AppColors.themeColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.delete_rounded, color: Colors.white, size: 14,),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}