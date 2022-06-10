import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumiaa/views/categroy/cubits/controller.dart';
import 'package:jumiaa/views/categroy/states/states.dart';

class CatrgoryBlock extends StatefulWidget {

  @override
  _CatrgoryBlockState createState() => _CatrgoryBlockState();
}

class _CatrgoryBlockState extends State<CatrgoryBlock> {
  @override
  Widget build(BuildContext context) {
    final category = CategoryController.of(context);


    return BlocBuilder(
      bloc: category,
      builder: (context, state) {
        if (state is CategoryLoading)
          return Text("gggggggg");
        final categories=category.categoryModel!.data!.data!;
        return Column(
                children:[ Row(
          children: [
            Image.network(categories[0].image!, height: 100,),
            Text("Category"),
            Spacer(),
            Icon(Icons.arrow_back_ios_new),
          ],
        ),
      ]
              );

      },
    );
  }
}
//Row(
//           children: [
//             Image.network(categories[1].image!, height: 100,),
//             Text("Category"),
//             Spacer(),
//             Icon(Icons.arrow_back_ios_new),
//           ],
//         );