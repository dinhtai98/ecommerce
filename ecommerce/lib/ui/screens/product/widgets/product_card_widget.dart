import 'dart:convert';

import 'package:ecommerce/core/dtos/product/product_dto.dart';
import 'package:ecommerce/global/global_data.dart';
import 'package:ecommerce/global/locator.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductDto product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PaintingBinding.instance?.imageCache?.clear();
    PaintingBinding.instance?.imageCache?.clearLiveImages();
    return SizedBox(
      height: 85,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, bottom: 8),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xff979797),
                width: .5,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              product.image != ""
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: SizedBox(
                        height: 60,
                        width: 60,
                        child: Image.memory(
                          base64.decode(product.image),
                          fit: BoxFit.fill,
                          gaplessPlayback: true,
                          cacheHeight: 60,
                          cacheWidth: 60,
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: SizedBox(
                        height: 60,
                        width: 60,
                        child: Image.asset(
                          "assets/image-coming-soon.jpg",
                          fit: BoxFit.fill,
                          cacheHeight: 60,
                          cacheWidth: 60,
                        ),
                      ),
                    ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(
                  product.name,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 3,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 17),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                locator<GlobalData>().currencySymbol + "${product.price}",
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
              ),
              const SizedBox(
                width: 5,
              ),
              // Consumer<IBasketViewModel>(builder: (_, _viewModel, __) {
              //   return _viewModel.getQtyProductInList(product) == 0
              //       ? Container(
              //           width: 85,
              //           height: 40,
              //           decoration: BoxDecoration(
              //             color: Color(0xffEFCD11),
              //             borderRadius: BorderRadiusDirectional.only(
              //                 topStart: Radius.circular(30.0),
              //                 bottomStart: Radius.circular(30.0)),
              //           ),
              //           child: InkWell(
              //             onTap: () async {
              //               //TODO
              //             },
              //             child: Center(
              //               child: Text(
              //                 "Add",
              //                 style: TextStyle(
              //                     fontWeight: FontWeight.w400, fontSize: 17),
              //               ),
              //             ),
              //           ))
              //       : Row(
              //           children: [
              //             Container(
              //               width: 80,
              //               height: 37,
              //               decoration: BoxDecoration(
              //                 border: Border.all(width: .5),
              //                 borderRadius:
              //                     BorderRadius.all(Radius.circular(5)),
              //               ),
              //               child: Row(
              //                 children: [
              //                   Expanded(
              //                     child: Material(
              //                       color: Colors.transparent,
              //                       child: InkWell(
              //                           child: Center(
              //                             child: Icon(
              //                               Icons.remove,
              //                               size: 17,
              //                             ),
              //                           ),
              //                           onTap: () async {
              //                             //TODO
              //                           }),
              //                     ),
              //                   ),
              //                   Container(
              //                       height: 20,
              //                       width: 25,
              //                       decoration: BoxDecoration(
              //                           border: Border(
              //                         left: BorderSide(
              //                           color: Colors.black,
              //                           width: .5,
              //                         ),
              //                         right: BorderSide(
              //                           color: Colors.black,
              //                           width: .5,
              //                         ),
              //                       )),
              //                       child: Center(
              //                         child: Text(
              //                           _viewModel
              //                               .getQtyProductInList(product)
              //                               .toString(),
              //                           style: TextStyle(fontSize: 17),
              //                         ),
              //                       )),
              //                   Expanded(
              //                       child: Material(
              //                     color: Colors.transparent,
              //                     child: InkWell(
              //                         child: Center(
              //                             child: Icon(
              //                           Icons.add,
              //                           size: 17,
              //                         )),
              //                         onTap: () async {
              //                           //TODO
              //                         }),
              //                   ))
              //                 ],
              //               ),
              //             ),
              //             SizedBox(
              //               width: 5,
              //             )
              //           ],
              //         );
              // }),
            ],
          ),
        ),
      ),
    );
  }
}
