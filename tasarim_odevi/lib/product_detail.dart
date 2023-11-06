import 'package:flutter/material.dart';
import 'package:tasarim_odevi/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {

    var d = AppLocalizations.of(context)!;
    var screenInfo = MediaQuery.of(context);
    var screenWidth = screenInfo.size.width;
    var screenHeight = screenInfo.size.height;

    return Scaffold(
      appBar: AppBar(title: Text(d.pageTitle, style: TextStyle(color: lightColor),), centerTitle: true, backgroundColor: primaryColor,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
               child: SizedBox(
                   width: screenWidth/1.5,
                   child: Image.asset("assets/images/product_image.png")
               ),
             ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    smallText(content: d.categoryText, fontsize: 13, color: mediumColor),
                    bigText(content: d.productNameText, fontsize: 22, color: darkColor),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    smallText(content: d.priceText, fontsize: 13, color: mediumColor),
                    bigText(content: d.priceInfotext, fontsize: 22, color: darkColor),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    bigText(content: d.sizeText, fontsize: 17, color: darkColor),
                    smallText(content: d.sizeGuideText, fontsize: 13, color: mediumColor),
                  ],
                ),
                SizedBox(height: screenHeight/100,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    sizeBox(title: d.small),
                    sizeBox(title: d.medium),
                    sizeBox(title: d.large),
                    sizeBox(title: d.xlarge),
                    sizeBox(title: d.xxlarge),
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bigText(content: d.descriptionText, fontsize: 17, color: darkColor),
                SizedBox(height: screenHeight/80,),
                smallText(content: d.descriptionInfoText, fontsize: 13, color: mediumColor)
              ],
            ),
            SizedBox(
              width: screenWidth,
              child: TextButton(
                onPressed: (){},
                style: TextButton.styleFrom( backgroundColor: primaryColor,),
                child: bigText(content: d.buttonText, fontsize: 13, color: lightColor),
              ),
            )

          ],
        ),
      ),
    );
  }
}

class smallText extends StatelessWidget {

  String content;
  double fontsize;
  Color color;

  smallText({
    required this.content, 
    required this.fontsize, 
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Text(content, style:
      TextStyle(
          fontFamily: "Inter",
          fontWeight: FontWeight.normal,
          fontSize: fontsize,
          color: color
      ),
    );
  }
}

class bigText extends StatelessWidget {

  String content;
  double fontsize;
  Color color;

  bigText({
    required this.content,
    required this.fontsize,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Text(content, style:
      TextStyle(
          fontFamily: "Inter",
          fontWeight: FontWeight.bold,
          fontSize: fontsize,
          color: color
      ),
    );
  }
}

class sizeBox extends StatelessWidget {
  String title;

  sizeBox({required this.title});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight/15,
      child: TextButton(
        onPressed: (){},
        style: TextButton.styleFrom(backgroundColor: mediumLightColor,),
        child: bigText(content: title, fontsize: 17, color: darkColor),
      ),
    );
  }
}

