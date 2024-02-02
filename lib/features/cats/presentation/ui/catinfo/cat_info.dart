import 'package:cached_network_image/cached_network_image.dart';
import 'package:cats_ca/features/cats/domain/entities/cat_entity.dart';
import 'package:flutter/material.dart';

import '../../widget/linear_progress_indicator.dart';

class CatInfo extends StatefulWidget {
  final CatEntity? cat;
  const CatInfo({super.key, required this.cat});

  @override
  State<CatInfo> createState() => _CatInfoState();
}

class _CatInfoState extends State<CatInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(widget.cat!.name!),
              background: CachedNetworkImage(
                height: 155,
                imageUrl: widget.cat!.imageLink!,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: [
                _buildCatParamInfo(widget.cat!.origin!, "Cat breed origin:"),
                _buildCatParamInfo(
                  "from ${widget.cat!.minLifeExpectancy} to ${widget.cat!.maxLifeExpectancy}",
                  'Life expectancy range:',
                ),
                _buildCatParamInfo(widget.cat!.length!, 'Cat length:'),
                _buildCatParamInfo(
                    "from ${widget.cat!.minWeight} to ${widget.cat!.maxWeight}",
                    'Weight range:'),
                _buildCatParamChart(
                    widget.cat!.familyFriendly!, 'Family firendly:'),
                _buildCatParamChart(
                  widget.cat!.shedding!,
                  'Shedding:',
                ),
                _buildCatParamChart(
                  widget.cat!.generalHealth!,
                  'General health:',
                ),
                _buildCatParamChart(
                  widget.cat!.playfulness!,
                  'Playfulness:',
                ),
                _buildCatParamChart(
                    widget.cat!.childrenFriendly!, 'Children friendly:'),
                _buildCatParamChart(widget.cat!.grooming!, 'Grooming:'),
                _buildCatParamChart(
                  widget.cat!.intelligence!,
                  'intelligence:',
                ),
                _buildCatParamChart(
                    widget.cat!.otherPetsFriendly!, 'Other pets friendly:'),
              ]),
            ),
          )
        ],
      ),
    );
  }

  _buildCatParamInfo(String catParam, String title) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(50, 237, 150, 189),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                catParam,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _buildCatParamChart(int paramValue, String title) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(50, 237, 150, 189),
              ),
              child: LinearIndicator(
                currentValue: paramValue,
              )),
        ),
      ],
    );
  }
}
