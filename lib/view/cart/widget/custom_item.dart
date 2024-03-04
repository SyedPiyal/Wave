import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartViewListWidget extends StatefulWidget {
  final List<Map<String, dynamic>> cartList;
  const CartViewListWidget({
    Key? key, required this.cartList,
  }) : super(key: key);

  @override
  State<CartViewListWidget> createState() => _CartViewListWidgetState();
}

class _CartViewListWidgetState extends State<CartViewListWidget> {
  int currentValue = 1;
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = currentValue.toString();
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 430, // Adjust the height as needed
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.cartList.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            //margin: EdgeInsets.symmetric(horizontal: 10),
            elevation: 1.5,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.circular(14),
                onTap: () {},
                child: Row(
                  children: [

                    //product image
                    Image.asset(
                      widget.cartList[index]['image']!,
                      height: 100,
                    ),
                    Column(
                      children: [
                        Text(

                          //product name
                          widget.cartList[index]['text']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),

                        //product rating
                        const Row(
                          children: [
                            Icon(Icons.star,color: Colors.blue,),
                            Text('(4.5)',style: TextStyle(color: Colors.blue),)
                          ],
                        ),

                        Row(
                          children: [
                            IconButton(onPressed: () {
                              if (currentValue > 1) {
                                currentValue--;
                                controller.text = currentValue.toString();
                              }
                            }, icon: const Icon(CupertinoIcons.minus),),

                            SizedBox(
                              height: 30,
                              width: 30,
                              child: TextFormField(
                                controller: controller,
                                readOnly: true,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration:  const InputDecoration(
                                  contentPadding: EdgeInsets.all(2),
                                  fillColor: Colors.transparent,
                                  filled: true,
                                  enabledBorder:OutlineInputBorder(borderSide: BorderSide.none) ,
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                                  border: OutlineInputBorder(borderSide: BorderSide.none),
                                ),
                              ),
                            ),
                            IconButton(onPressed: () {
                              currentValue++;
                              controller.text = currentValue.toString();
                            },
                              icon: const Icon(CupertinoIcons.plus),),

                          ],
                        )

                      ],
                    ),
                    const Spacer(),


                    Column(crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        //delete icon
                        const Icon(Icons.delete),
                        const SizedBox(height: 20,),

                        //product price
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '\$  ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Colors.deepOrange,
                              ),
                            ),
                            Text(
                              '${widget.cartList[index]['price'] ?? 0}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(width: 15,)
                  ],
                )
              ),
            ),
          );
        },
      ),
    );
  }
}
