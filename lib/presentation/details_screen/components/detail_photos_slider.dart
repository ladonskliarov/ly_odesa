import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class DetailPhotosSlider extends StatelessWidget {
  const DetailPhotosSlider({required this.images, Key? key}) : super(key: key);

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        width: double.infinity,
        child: ListView.builder(
          itemCount: images.length,
          itemBuilder: (context, index) => SizedBox(
            width: 200,
            height: 150,
            child: InkWell(
              child: ImagesGallery(image: images[index],),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute<OnTapGallery>(
                    builder: (_) => OnTapGallery(
                        images: images, index: index, context: context,
                    ),
                ));
              },
            ),
          ),
          //itemCount: widget.product!.images!.length,
          scrollDirection: Axis.horizontal,
        )
    );
  }
}

class ImagesGallery extends StatelessWidget{

  final String image;
  final int index;

  const ImagesGallery({Key? key, required this.image, this.index = 0}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(image, height: double.infinity, width: double.infinity, fit: BoxFit.fill)),
    );
  }
}

class OnTapGallery extends StatefulWidget{
  final PageController pageController;
  final List<String>? images;
  final int index;
  final BuildContext context;

  OnTapGallery({super.key,
    required this.images,
    this.index = 1,
    required this.context}) : pageController = PageController(initialPage: index);

  @override
  State<OnTapGallery> createState() => _OnTapGalleryState();
}

class _OnTapGalleryState extends State<OnTapGallery> {
  late int index = widget.index;
  @override
  late final BuildContext context = widget.context;

  @override
  void dispose() {
    super.dispose();
    widget.pageController.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          PhotoViewGallery.builder(
            pageController: widget.pageController,
            itemCount: widget.images!.length,
            builder: (context, index) {
              final urlImage = widget.images![index];
              return PhotoViewGalleryPageOptions(
                  imageProvider: NetworkImage(urlImage),
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.contained * 4
              );
            },
            onPageChanged: (index) => setState(() {this.index = index;}),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SafeArea(
                child: InkWell(
                  onTap: () {Navigator.pop(context);},
                  child: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 25,),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('${index + 1}/${widget.images!.length}', style: const TextStyle(color: Colors.white, fontSize: 20),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}