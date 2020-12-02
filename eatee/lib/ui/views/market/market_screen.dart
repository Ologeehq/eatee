import 'package:eatee/core/providers/market_provider.dart';
import 'package:eatee/ui/core/search_container.dart';
import 'package:eatee/ui/core/styles.dart';
import 'package:eatee/ui/views/base_view.dart';
import 'package:flutter/material.dart';

class MarketScreen extends StatelessWidget {
  final Key key;
  MarketScreen({this.key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return BaseView<MarketProvider>(
      builder: (context, provider, child) => Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchContainer(width: width),
                SizedBox(height: 12.0),
                CustomGridView(
                  width: width,
                  height: height,
                  provider: provider,
                  title: 'Top Categories',
                ),
                SizedBox(height: 20.0),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(color: Colors.black12, width: 1.5),
                            ),
                          ),
                          child: Text('Best sell', style: kBodyText4),
                        ),
                        Text('See All', style: kBodyText4),
                      ],
                    ),
                    SizedBox(height: 12.0),
                    Container(
                      height: height * .19,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: provider.newIn.length,
                        itemBuilder: (context, index) => Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: width * .3,
                              height: height * .13,
                              margin: EdgeInsets.only(right: 8.0),
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          provider.newIn[index].imageUrl))),
                            ),
                            Text(
                              provider.newIn[index].name ?? '',
                              style: kBodyText4.copyWith(fontSize: 12.0),
                            ),
                            Text(
                              provider.newIn[index].price ?? '',
                              style: kBodyText4,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  height: height * .25,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.green.withOpacity(.06),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text('Top brands'),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8.0),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: provider.topBrands.length,
                            itemBuilder: (context, i) => InkWell(
                              onTap: () {},
                              child: CircleAvatar(
                                radius: width * .15,
                                backgroundImage:
                                    AssetImage(provider.topBrands[i].imageUrl),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                RecommendedGridView(
                  width: width,
                  height: height,
                  provider: provider,
                  title: 'Recommended for you',
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    Key key,
    @required this.width,
    @required this.height,
    @required this.provider,
    @required this.title,
  }) : super(key: key);

  final double width;
  final double height;
  final provider;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title ?? 'Top Categories', style: kBodyText4),
        SizedBox(height: 12.0),
        Wrap(
          spacing: width * .02,
          runSpacing: width * .02,
          children: <Widget>[
            ...provider.topCategories
                .map((e) => Container(
                      width: width * .215,
                      height: height * .11,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(e.imageUrl))),
                    ))
                .toList(),
          ],
        ),
      ],
    );
  }
}

class RecommendedGridView extends StatelessWidget {
  const RecommendedGridView({
    Key key,
    @required this.width,
    @required this.height,
    @required this.provider,
    @required this.title,
  }) : super(key: key);

  final double width;
  final double height;
  final provider;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title ?? 'Top Categories', style: kBodyText4),
        SizedBox(height: 12.0),
        Wrap(
          spacing: width * .02,
          runSpacing: width * .03,
          children: <Widget>[
            ...provider.topCategories
                .map(
                  (e) => Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: width * .275,
                        height: height * .13,
                        margin: EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(e.imageUrl))),
                      ),
                      Text(
                        e.name ?? '',
                        style: kBodyText4.copyWith(fontSize: 12.0),
                      ),
                      Text(
                        e.price ?? '',
                        style: kBodyText4,
                      ),
                    ],
                  ),
                )
                .toList(),
          ],
        ),
      ],
    );
  }
}
