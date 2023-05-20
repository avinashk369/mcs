part of order_detail_screen;

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: greyColor.withOpacity(.2))),
      child: Center(
        child: CachedNetworkImage(
          imageUrl: productModel.productImage ??
              ' https://picsum.photos/250?image=9 ',
          errorWidget: (_, __, ___) => Image.asset('assets/images/logo.png'),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
