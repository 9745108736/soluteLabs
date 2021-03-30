import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget CachedNetworkImageWidget({
  @required String imageUrl,
  double heightParam,
  double widthParam,
}) {
return  CachedNetworkImage(
    imageUrl: imageUrl
    // "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
    ,
    height: heightParam ?? 190,
    width: widthParam ?? 190,
    fit: BoxFit.cover,
    placeholder: (BuildContext context, String url) {
      return Center(
        child: Container(
          height: 10,
          width: 10,
          child: CircularProgressIndicator(),
        ),
      );
    },
    errorWidget: (context, url, error) => Icon(
      Icons.error,
      size: 20,
    ),
  );
}
