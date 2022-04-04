import 'package:ecommerce/core/dtos/product/product_dto.dart';
import 'package:ecommerce/core/dtos/product_tag/product_tag_dto.dart';
import 'package:ecommerce/core/utils/string_extension.dart';
import 'package:ecommerce/core/view_models/interfaces/iproduct_screen_view_model.dart';
import 'package:ecommerce/ui/common_widgets/custom_appbar.dart';
import 'package:ecommerce/ui/screens/product/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:uuid/uuid.dart';

class ProductScreenArguments {
  final String selectedTagId;
  final List<ProductTagDto> productsInTag;
  ProductScreenArguments({
    required this.selectedTagId,
    required this.productsInTag,
  });
}

class ProductScreen extends StatefulWidget {
  final ProductScreenArguments arguments;
  const ProductScreen({Key? key, required this.arguments}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  TextEditingController textController = TextEditingController();
  late IProductScreenViewModel _viewModel;
  late String _instanceId;
  @override
  void initState() {
    _viewModel = context.read<IProductScreenViewModel>();
    _instanceId = const Uuid().v4();
    Future.delayed(Duration.zero, () async {
      await _viewModel.initData(
        instanceId: _instanceId,
        tagId: widget.arguments.selectedTagId,
        products: widget.arguments.productsInTag,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.disposeViewModel(_instanceId);
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppbar(
              title: "Products",
              backFunc: () {
                Get.back();
              },
              basketActive: true,
            ),
            Selector<IProductScreenViewModel, int>(
              selector: (_, __) => _viewModel.tagButtonsListener,
              builder: (_, __, ___) {
                return SizedBox(
                  height: 60,
                  child: ScrollablePositionedList.builder(
                    scrollDirection: Axis.horizontal,
                    itemScrollController: _viewModel
                        .getInstanceModel(_instanceId)
                        ?.tagButtonsItemScrollController,
                    itemCount: _viewModel.productInTags.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () async {
                        await _viewModel.selectTag(indexProductGroup: index);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            minWidth: 150.0,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: _viewModel.position == index
                                  ? const LinearGradient(
                                      colors: [
                                        Color(0xffA40303),
                                        Color(0xffD30606),
                                      ],
                                    )
                                  : const LinearGradient(colors: [
                                      Color(0xffEDEDED),
                                      Color(0xffEDEDED)
                                    ]),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(35.0),
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _viewModel.productInTags[index].name,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: _viewModel.position == index
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 17),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            Selector<IProductScreenViewModel, int>(
              selector: (_, __) => _viewModel.searchesListener,
              builder: (_, __, ___) {
                return Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    textInputAction: TextInputAction.search,
                    onSubmitted: (value) {
                      _viewModel.isSearched = true;
                      _viewModel.onSearch(textController.text);
                    },
                    style: const TextStyle(fontSize: 17),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 20),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(235, 235, 235, 1),
                        ),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(235, 235, 235, 1),
                        ),
                      ),
                      suffixIcon: SizedBox(
                        width: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            textController.text.isNullOrEmpty()
                                ? const SizedBox.shrink()
                                : InkWell(
                                    onTap: () {
                                      _viewModel.isSearched = false;
                                      textController.text = "";
                                      _viewModel.productDisplay.clear();
                                      _viewModel.productDisplay.clear();
                                      FocusScope.of(context).unfocus();
                                    },
                                    child: const Icon(
                                      Icons.clear,
                                      size: 20,
                                    ),
                                  ),
                            InkWell(
                              onTap: () {
                                _viewModel.isSearched = true;
                                _viewModel.onSearch(textController.text);
                                FocusScope.of(context).unfocus();
                              },
                              child: const Icon(
                                Icons.search,
                                size: 20,
                                color: Color.fromRGBO(34, 0, 255, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      hintText: 'Search...',
                      hintStyle: const TextStyle(
                          color: Color.fromRGBO(34, 0, 255, 1), fontSize: 17),
                    ),
                    controller: textController,
                  ),
                );
              },
            ),
            Selector<IProductScreenViewModel, int>(
              selector: (_, __) => _viewModel.searchesListener,
              builder: (_, __, ___) {
                return Expanded(
                  child: _viewModel.productDisplay.isNotEmpty
                      ? ListView(
                          children: [
                            ..._viewModel.productDisplay.map(
                              (x) => ProductCard(
                                product: x,
                                tagId: '',
                              ),
                            ),
                          ],
                        )
                      : _viewModel.isSearched
                          ? textController.text.isNullOrEmpty()
                              ? listProducts
                              : const Center(
                                  child: Text(
                                    'No item found!',
                                  ),
                                )
                          : listProducts,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget get listProducts => Selector<IProductScreenViewModel, int>(
        selector: (_, __) => _viewModel.productGroupsListener,
        builder: (_, __, ___) {
          return ScrollablePositionedList.builder(
            itemCount: _viewModel.productInTags.length,
            itemBuilder: (context, index) {
              var productInTag = _viewModel.productInTags[index];
              return _ProductGroup(
                tagName: productInTag.name,
                productList: productInTag.products,
                tagId: productInTag.id,
              );
            },
            itemScrollController: _viewModel
                .getInstanceModel(_instanceId)
                ?.productGroupsItemScrollController,
            itemPositionsListener: _viewModel
                .getInstanceModel(_instanceId)
                ?.productGroupsItemPositionsListeners,
            scrollDirection: Axis.vertical,
          );
        },
      );
}

class _ProductGroup extends StatelessWidget {
  final String tagName;
  final String tagId;
  final List<ProductDto> productList;
  const _ProductGroup({
    Key? key,
    required this.tagName,
    required this.productList,
    required this.tagId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return productList.isNotEmpty
        ? SizedBox(
            height: (productList.length * 100.h).toDouble() + 26,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    tagName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
                ...productList
                    .map((x) => ProductCard(
                          product: x,
                          tagId: tagId,
                        ))
                    .toList()
              ],
            ),
          )
        : const SizedBox.shrink();
  }
}
