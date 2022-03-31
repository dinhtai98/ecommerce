part of '../home_screen.dart';

class TagItemWidget extends StatelessWidget {
  final ProductTagDto productTag;
  const TagItemWidget({Key? key, required this.productTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PaintingBinding.instance?.imageCache?.clear();
    PaintingBinding.instance?.imageCache?.clearLiveImages();
    return Container(
      color: ColorUtils.grey.withOpacity(.1),
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2 - 100,
            child: productTag.image != ''
                ? Image.memory(
                    base64.decode(productTag.image),
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/app_logo.png',
                    fit: BoxFit.cover,
                  ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2 - 80,
                  color: ColorUtils.grey.withOpacity(.4),
                  child: const Divider(
                    height: 2,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  productTag.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyleUtils.largeHeading
                      .copyWith(color: ColorUtils.black),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
