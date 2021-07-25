import 'package:catalogue_app/models/cart.dart';
import 'package:catalogue_app/models/catalogue.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final Item catalogue;

  const AddToCart({Key? key,required this.catalogue}) : super(key: key);


  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalogue)? true:false;
    return ElevatedButton(
      onPressed: (){
        if(!isInCart){
          isInCart = isInCart.toggle();
          final _catalogue = CatalogueModel();
          _cart.catalogue = _catalogue;
          _cart.add(widget.catalogue);
          setState(() {});
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
        shape: MaterialStateProperty.all(StadiumBorder())
      ),
      child: isInCart? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}