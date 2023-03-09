import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcs/blocs/product/product_bloc.dart';
import 'package:mcs/blocs/toggle/index_toggled.dart';
import 'package:mcs/blocs/toggle/toggle_index_bloc.dart';
import 'package:mcs/models/category/category_model.dart';
import 'package:mcs/utils/utils.dart';
import 'package:mcs/widgets/extensions/widget_modifier.dart';

class CatCard extends StatelessWidget {
  const CatCard(
      {Key? key,
      required this.child,
      required this.categoryModel,
      required this.index,
      required this.onTap})
      : super(key: key);
  final Widget child;
  final CategoryModel categoryModel;
  final int index;
  final Function(CategoryModel categoryModel, int index) onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToggleIndexBloc, IndexToggled>(
        builder: (context, state) {
      return InkWell(
        onTap: () {
          /// making first item toggled
          context.read<ToggleIndexBloc>().toggleState(0, false);
          context.read<ProductBloc>().add(ProductEvent.loadProduct(
              cityId: '4', categoryId: categoryModel.id));
          onTap(categoryModel, index);
        },
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 0,
          color: state.isSelected && state.index == index
              ? greenColor
              : Colors.grey[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 50,
                height: double.infinity,
                child: Card(
                  elevation: 0,
                  semanticContainer: true,
                  color: secondaryLight,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  )),
                  child: child,
                ),
              ),
              Text(
                categoryModel.categoryName!,
                style: kLabelStyleBold.copyWith(
                    color: state.isSelected && state.index == index
                        ? secondaryLight
                        : darkColor),
              ).horizontalPadding(8),
            ],
          ),
        ),
      );
    });
  }
}
