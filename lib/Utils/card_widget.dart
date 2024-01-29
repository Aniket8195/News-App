import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:news/Screens/web_view.dart';
import '../Models/news.dart';
Widget showNews(BuildContext context,List<News>newsList){
   return Swiper(
     itemBuilder: (BuildContext context,int index){
       return Column(
         children: [
           SizedBox(
              height: MediaQuery.of(context).size.height*0.3,
              width: MediaQuery.of(context).size.width*1,
               child: Image.network(newsList[index].image,fit: BoxFit.cover,
               errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                 return const  Image(image:AssetImage("assets/images/placeholder.png"),fit: BoxFit.cover,);
               }
               ),
           ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(newsList[index].title,style:const  TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text("Time:"),
                  Text(newsList[index].date.toString().substring(11,19)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(newsList[index].body,textAlign:TextAlign.justify,),
            ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Row(
               children: [
                 const Text("Source:",),
                 Text(newsList[index].source)
               ],
             ),
           ),
           Expanded(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 GestureDetector(
                   onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WebView(url: newsList[index].url)));
                   },
                   child: Container(
                     height: MediaQuery.of(context).size.height*0.07,
                     width: MediaQuery.of(context).size.width* 1,
                     decoration: const BoxDecoration(
                       color: Colors.blueGrey,
                     ),
                     child: const Padding(
                       padding: EdgeInsets.all(8.0),
                       child: Text(
                         "Tap to read more",
                         style: TextStyle( decoration: TextDecoration.underline,),
                       ),
                     ),

                   ),
                 ),
               ],
             ),
           )

         ],
       );
     },
     itemCount: newsList.length,
     scrollDirection: Axis.vertical,
     // pagination: SwiperPagination(),
     // control: SwiperControl(),
   );
}