import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/products_cubit.dart';
import '../models/product_info.dart';
import '../repository/products_repository.dart';
import '../views/product_detail_view.dart';

import '../../colors.dart';
import '../../utils.dart';

class ProductListPage extends StatelessWidget {

  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsCubit>(
      create: (_) => ProductsCubit(
        repository: ProductsRepository(),
      )..load(),
      child: _ProductListWidget(key: const Key("products")),
    );
  }
}

class _ProductListWidget extends StatefulWidget {

  const _ProductListWidget({super.key});

  @override
  State<_ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<_ProductListWidget> {

  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _CustomAppBar(
        key: Key("#appbar"),
        controller: _textEditingController,
        focusNode: _focusNode,
      ),
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          switch (state) {
            case ProductsInitialState():
            case ProductsLoadingState():
              return Center(child: CircularProgressIndicator());
            case ProductEmptyState():
              return Center(child: Text("oops.. not found anything"));
            case ProductsDataState():
              final List<ProductInfo> values = state.values;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: values.length,
                itemBuilder: (context, index) => ProductCard(product: values[index]),
              );
          }
        },
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  const _CustomAppBar({super.key, required this.controller, required this.focusNode});

  final TextEditingController controller;
  final FocusNode focusNode;

  Future<void> search(BuildContext context, String text) async {
    await context.read<ProductsCubit>().load(keyword: text.isEmpty ? null : text);
  }

  void unfocus() {
    focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) => AppBar(
    centerTitle: true,
    title: SizedBox(
      height: 56,
      width: MediaQuery.of(context).size.width - 80,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        autofocus: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35.0),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          fillColor: colorF5F5F5,
          filled: true,
          hintText: "Search",
          hintStyle: TextStyle(color: Colors.black, fontSize: 18),
          contentPadding: const EdgeInsets.only(left: 14.0, bottom: 10.0, top: 12.0),
          prefixIcon: Padding(
            padding: EdgeInsets.only(top: 0.0, left: 10), // add padding to adjust icon
            child: InkWell(
              onTap: () async {
                unfocus();
                await search(context, controller.text);
              },
              child: Icon(Icons.search_outlined, size: 28, color: colorB3B3B3),
            ),
          ),
        ),
        onFieldSubmitted: (String text) async {
          unfocus();
          await search(context, text);
        },
      ),
    ),
    titleSpacing: 0,
    automaticallyImplyLeading: false,
    elevation: 0,
  );

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class ProductCard extends StatelessWidget {

  const ProductCard({super.key, required ProductInfo product}) : _product = product;

  final ProductInfo _product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: colorFAFAFA,
        borderRadius: BorderRadius.circular(5)
      ),
      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ProductDetailPage(product: _product)),
        ),
        child: Row(
          children: <Widget>[
            SizedBox(width: 20),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: AspectRatio(
                aspectRatio: 160 / 220,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      alignment: FractionalOffset.topCenter,
                      image: NetworkImage(_product.productImage!),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Text(
                        _product.productMarketName!,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          currencyFormatter.format(_product.productFinalPrice),
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Icon(Icons.favorite_outline, color: colorB3B3B3),
                            SizedBox(width: 5),
                            Icon(Icons.shopping_cart_outlined, color: colorB3B3B3)
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}