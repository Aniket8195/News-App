import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

Widget showShimmer(BuildContext context){
  return Column(
    children: [
      Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.3,
              width: double.infinity,
              color: Colors.white,
            ),
            const SizedBox(height: 10,),

            Container(
              height: MediaQuery.of(context).size.height*0.05,
              width: double.infinity,
              color: Colors.white,
            ),
            const SizedBox(height: 10,),

            Container(
              height: MediaQuery.of(context).size.height*0.2,
              width: double.infinity,
              color: Colors.white,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.1,
                  width: double.infinity,
                  color: Colors.white,
                ),
              ],
            )
          ],
        )


      ),
    ],
  );
}