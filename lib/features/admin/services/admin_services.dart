import 'dart:io';

import 'package:amazon_clone/constrains/error_handling.dart';
import 'package:amazon_clone/constrains/global_variables.dart';
import 'package:amazon_clone/constrains/utils.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AdminServices {
  void sellProducts({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloudnary = CloudinaryPublic('doc819nnq', 'r7sccyov');
      List<String> imagesurls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudnary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name),
        );
        imagesurls.add(res.secureUrl);
      }
      Product product = Product(
          name: name,
          description: description,
          quantity: quantity,
          images: imagesurls,
          category: category,
          price: price);

      http.Response res = await http.post(Uri.parse('$uri/admin/add-product'),
          headers: {
            'Content-Type': "application/json; charset =UTF-8",
            'x-auth-token': userProvider.user.token
          },
          body: product.toJson());

      httpErrorHandle(
          context: context,
          response: res,
          onSuccess: () {
            showSnackBar(context, "Product addedd Successfully!");
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
