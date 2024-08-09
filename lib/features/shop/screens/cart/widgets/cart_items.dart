import 'package:ecommerce/common/widgets/products/cart/add_remove_button.dart';
import 'package:ecommerce/common/widgets/products/cart/cart_item.dart';
import 'package:ecommerce/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) =>
          const SizedBox(height: TSizes.spaceBtwSections),
      itemCount: 4,
      itemBuilder: (_, index) => Column(
        children: [
          /// Cart Item
          const TCartItem(),
          if (showAddRemoveButtons) const SizedBox(height: TSizes.spaceBtwItems),

          /// Add or remove Row with total price
          if (showAddRemoveButtons)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    /// Extra space
                    SizedBox(width: 70),

                    /// Add remove buttons
                    TProductQuantityWithAddRemoveButton(),
                  ],
                ),

                /// Product total price
                TProductPriceText(price: '256')
              ],
            )
        ],
      ),
    );
  }
}
