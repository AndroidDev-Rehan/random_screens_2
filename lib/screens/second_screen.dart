import 'package:flutter/material.dart';

class VenueScreen extends StatelessWidget {
  const VenueScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text("eMcee", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
        actions: const [
          Icon(Icons.comment_bank_outlined,color: Colors.red,),
          SizedBox(width: 8,),
          Icon(Icons.monetization_on_outlined, color: Colors.red,),
          SizedBox(width: 8,),
          Icon(Icons.calendar_today_outlined, color: Colors.red,),
          SizedBox(width: 20,),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children:  [
            SizedBox(height: 20,),
            search(),
            SizedBox(height: 5),
            buttons(),
            SizedBox(height: 10,),
            Text("Browse", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10,),
            imagesGrid(),
            SizedBox(height: 10,),
            categories()
          ],
        ),
      ),
      bottomNavigationBar: bottomBar(),
    );
  }

  bottomBar(){
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: const [
            Icon(Icons.people_outline_sharp),
            Icon(Icons.shopping_basket_outlined),
            Icon(Icons.add_circle_outline, color: Colors.red,size: 50,),
            Icon(Icons.search),
            Icon(Icons.person),
          ],
        ),
      ),
    );
  }

  search(){
    return TextFormField(
      decoration:  InputDecoration(
        fillColor: Colors.grey.withOpacity(0.5),
        filled: true,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
        hintText: "Search...",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        )
      ),
    );
  }

  buttons(){
    return SizedBox(
      height: 30,
      child: Row(
        mainAxisSize: MainAxisSize.max,
//      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ElevatedButton(onPressed: (){},
                child: Text("Venues"),
              style: ElevatedButton.styleFrom(
                primary: Colors.grey
              ),
            ),
          ),
          Expanded(
            child: ElevatedButton(onPressed: (){},
              child: Text("People"),
              style: ElevatedButton.styleFrom(
                  primary: Colors.grey[600]!
              ),
            ),
          )

        ],
      ),
    );
  }

  imagesGrid(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                imageWidget("assets/images/h1.jpg",150,110, ImageInfo(title: "Penthouse view", location: "Washington", price: "100\$", date: "10/11/21")),
                imageWidget("assets/images/h2.jpg",150,140,ImageInfo(title: "Modern Gallery  ", location: "Washington", price: "475\$", date: "08/06/21")),
              ],
            )
        ),
        SizedBox(width: 10,),
        Expanded(
            child: Column(
              children: [
                imageWidget("assets/images/h3.jpg",150,150,ImageInfo(title: "Penthouse view", location: "Washington", price: "100\$", date: "20/5/21")),
                imageWidget("assets/images/h4.jpg",150,100,ImageInfo(title: "Modern Gallery ", location: "Washington", price: "475\$", date: "01/03/22")),
              ],
            )
        )

      ],
    );
  }

  imageWidget(String assetPath, double width, double height, ImageInfo imageInfo){
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: ClipRRect(
        child: Container(
          color: Colors.grey[700],
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(assetPath ,fit: BoxFit.cover,width: width, height: height),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(imageInfo.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                        Text(imageInfo.price, style: TextStyle(color: Colors.red),)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(imageInfo.location, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star, color: Colors.blue, size: 12,),
                            Icon(Icons.star, color: Colors.blue, size: 12,),
                            Icon(Icons.star, color: Colors.blue, size: 12,),
                            Icon(Icons.star, color: Colors.blue, size: 12,),
                            Icon(Icons.star, color: Colors.blue, size: 12,),

                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 4,),
                    Text(imageInfo.date,style: TextStyle(fontSize: 12),)


                  ],
                ),
              )
            ],
          ),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  categories(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Categories", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset("assets/images/h5.jpg", width: 100, height: 80, fit: BoxFit.cover,),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset("assets/images/gym.jpg", width: 100, height: 80, fit: BoxFit.cover,),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset("assets/images/h6.png", width: 100, height: 80, fit: BoxFit.cover,),
              ),

            ],
          )

        ],
      ),
    );
  }

}

class ImageInfo{
  final String title;
  final String location;
  final String price;
  final String date;

  ImageInfo({required this.title,required this.location,required this.price,required this.date});


}
