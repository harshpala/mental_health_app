import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_preview_generator/link_preview_generator.dart';
import 'package:mental_health_app/res/colors.dart';
import 'package:mental_health_app/screens/root/header.dart';
import '../root/app_drawer.dart';
import '/globals.dart' as globals;

class ArticleScreen extends StatefulWidget {
  final selectedIndex;
  final Function(int) onItemTapped;
  const ArticleScreen({
    Key? key,
    this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

List<String> models = [];

class _ArticleScreenState extends State<ArticleScreen> {
  List<int> number = [1, 2, 3, 4, 5];
  List<String> Articles = [
    "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4527955/",
    "https://www.helpguide.org/articles/mental-health/building-better-mental-health.htm/ ",
    "https://ijmhs.biomedcentral.com/articles/10.1186/s13033-023-00577-8/",
    "https://www.accreditedschoolsonline.org/resources/student-mental-health-resources/ ",
    "https://www.frontiersin.org/articles/10.3389/fpsyg.2020.01226/full/",
    "https://www.wgu.edu/heyteach/article/importance-mental-health-awareness-schools1810.html/"
  ];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    setState(() {
      globals.isArticleopen = ModalRoute.of(context)!.isCurrent;
    });

    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: false,
      drawer: ClipRRect(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(16.r)),
          child: SizedBox(
              width: 220.w,
              child: AppDrawer(
                selectedIndex: widget.selectedIndex,
                onItemTapped: widget.onItemTapped,
              ))),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.customblue, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Header(scaffoldkey: scaffoldKey),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ListView.builder(
                  itemCount: Articles.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, left: 16.0, right: 16.0),
                      child: LinkPreviewGenerator(
                        bodyMaxLines: 5,
                        link: Articles[index],
                        linkPreviewStyle: LinkPreviewStyle.large,
                        showGraphic: true,
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
