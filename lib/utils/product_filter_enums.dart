enum ProductFilterType {
  priceToLow(filterName: 'Price-Low'),
  priceToHigh(filterName: 'Price-High'),
  veg(filterName: 'Veg'),
  nonVeg(filterName: 'Non-Veg');

  const ProductFilterType({required this.filterName});
  final String filterName;
}
