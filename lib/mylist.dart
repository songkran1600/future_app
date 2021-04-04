import 'package:flutter/material.dart';

void main()=>runApp(MyListPage());

class Product{
  int id;
  String name;
  double price;
  String picture;

  Product(int id, String name, double price,String picture){
    this.id = id;
    this.name = name;
    this.price = price;
    this.picture = picture;
    }
  }

class MyListPage extends StatefulWidget {
  @override
  _MyListPageState createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
 // List<String> myProducts = ['Chocolate', 'Strawberry', 'Kiwi', 'Apple',];
  List<Product> product = [
    Product(1, "Anemone", 75,"https://f.ptcdn.info/968/002/000/1362844823-anemone6-o.jpg"),
    Product(2, "Cattleya", 50,"https://sarusandaorchid.com/wp-content/uploads/2019/03/Cattleya-labiata.jpg"),
    Product(3, "Carnation", 41,"https://dy1yydbfzm05w.cloudfront.net/media/catalog/product/cache/39b52c4cabb46819553175347e38b212/1/1/117732_carnation.pinklemonade.cut_car_nul_plp_prd_001_1.jpg"),
    Product(4, "Gardenia ", 85,"https://www.gardenia.net/storage/app/public/guides/detail/19587224_m.jpg"),
    Product(5, "Gerbera ", 40,"https://www.ikea.com/th/en/images/products/smycka-artificial-flower-gerbera-pink__0903344_pe685480_s5.jpg?f=s"),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('All Flower'),
        ),
        body: Column(
        //  children: myProducts.map((prd) => Text(prd)).toList()
          children: product.map((p) {
            return ListTile(
              leading: Image.network(p.picture,height: 100,width: 100,),
              title: Text(p.name),
              subtitle: Text("Price : ฿"+ p.price.toString()),
            );
          }).toList(),
        ),
      ),
    );
  }
}
