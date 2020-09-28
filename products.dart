import 'package:flutter/material.dart';

//constants
import 'package:puranapustaks/constants/customColor.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  var productsList = [
    {
      "Name": "Radha",
      "Old Price": 500,
      "Picture": "images/registered/nepali/R1.jpg",
      "Numbers": 2,
      "Category":"NEPALI"
    },
    {
      "Name": "Seto Dharti",
      "Old Price": 500,
      "Picture": "images/registered/nepali/SD1.jpg",
      "Numbers": 3,
      "Category":"NEPALI"
    },
    {
      "Name": "A Tale of Two Cities",
      "Old Price": 600,
      "Picture": "images/registered/foreign/ATOTC1.jpg",
      "Numbers": 2,
      "Category":"FOREIGN"
    },
    {
      "Name": "One Hundred Years of Solitude",
      "Old Price": 1000,
      "Picture": "images/registered/foreign/OHYOS1.jpg",
      "Numbers": 2,
      "Category":"FOREIGN"
    },
    {
      "Name": "War and Peace",
      "Old Price": 2000,
      "Picture": "images/registered/foreign/WAP1.jpg",
      "Numbers": 2,
      "Category":"FOREIGN"
    },
    {
      "Name": "Moral Science IV",
      "Old Price": 2000,
      "Picture": "images/registered/school/MSIV1.jpg",
      "Numbers": 2,
      "Category":"SCHOOL"
    },
    {
      "Name": "Social Studies VIII",
      "Old Price": 2000,
      "Picture": "images/registered/school/SSVIII1.jpg",
      "Numbers": 2,
      "Category":"SCHOOL"
    },
    {
      "Name": "Principles of Physics XI",
      "Old Price": 2000,
      "Picture": "images/registered/college/POPXI1.jpg",
      "Numbers": 5,
      "Category":"COLLEGE"
    },
    {
      "Name": "Let us C",
      "Old Price": 700,
      "Picture": "images/registered/university/LUC1.jpg",
      "Numbers": 7,
      "Category":"UNIVERSITY"
    },
    {
      "Name": "Japanese the Spoken Language",
      "Old Price": 700,
      "Picture": "images/registered/language/JTSL1.jpg",
      "Numbers": 2,
      "Category":"LANGUAGE"
    },
    {
      "Name": "Samiksha Complete Biology",
      "Old Price": 1000,
      "Picture": "images/registered/entrance/SCB1.jpg",
      "Numbers": 10,
      "Category":"ENTRANCE"
    },
    {
      "Name": "Collins Pocket English Dictionary",
      "Old Price": 500,
      "Picture": "images/registered/others/CPED1.jpg",
      "Numbers": 5,
      "Category":"OTHERS"
    },
    {
      "Name": "Oxford Encyclopedia of World History",
      "Old Price": 3000,
      "Picture": "images/registered/others/OEOWH1.jpg",
      "Numbers": 5,
      "Category":"OTHERS"
    },
    {
      "Name": "Philip World Atlas",
      "Old Price": 1000,
      "Picture": "images/registered/others/PWA1.jpg",
      "Numbers": 5,
      "Category":"OTHERS"
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*(1/2),
      child: GridView.builder(
          itemCount: productsList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index){
            return SingleProduct(
              name: productsList[index]["Name"],
              oldPrice: productsList[index]["Old Price"],
              picture: productsList[index]["Picture"],
              numbers: productsList[index]["Numbers"],
              category: productsList[index]["Category"],
            );
          }
      ),
    );
  }
}

class SingleProduct extends StatelessWidget {

  final String name;
  final int oldPrice;
  final String picture;
  final int numbers;
  final String category;

  SingleProduct({
    this.name,
    this.oldPrice,
    this.picture,
    this.numbers,
    this.category
});

  @override
  Widget build(BuildContext context) {
    var naming;
    if (name.length < 15){
      naming = name + " "*(15 - name.length);
    }else{
      naming = name.substring(0,12) + "...";
    }
    return Card(
      child: Hero(
          tag: name,
          child: Material(
            child: GridTile(
                child: InkWell(
                  onTap: (){},
                  child: GridTile(
                      footer: Container(
                        color: createMaterialColor(Color(0xCCFFFFFF)),
                        child: ListTile(
                          leading: Text(
                              naming, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),
                              textAlign: TextAlign.left
                          ),
                          title: Text(
                              "Rs."+(oldPrice*0.5).toInt().toString(),
                            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 10.0),
                              textAlign: TextAlign.right
                          ),
                          subtitle: Text(
                              "Rs."+oldPrice.toString(),
                            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 10.0, decoration: TextDecoration.lineThrough),
                              textAlign: TextAlign.right
                          ),
                        ),
                      ),
                    child: Image.asset(picture, fit: BoxFit.cover,),
                  ),
                )),
          )
      ),
    );
  }
}
