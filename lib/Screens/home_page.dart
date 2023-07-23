import 'package:bashakam_barawzanko/Screens/kamtrin_konmra/kamtrin_konmra_page.dart';
import 'package:bashakam_barawzanko/constantes/them_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/my_card.dart';
import '../components/my_homepage_appbar.dart';
import '../helpers/systemUi_overlay_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SystemUiOverlayHelper uiOverlayFunc = SystemUiOverlayHelper();

  @override
  void initState() {
    super.initState();
    uiOverlayFunc.setSystemUiOverlayStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.kBodyColor,
      appBar: const HomePageAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              SvgPicture.asset(
                'assets/images/cats.svg',
                width: 200,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'ڕیزبەندی بکە لەگەڵ ئەپڵیکەیشنی',
                style: TextStyle(
                  fontSize: 18,
                  color: ThemeColors.kWhiteTextColor,
                  fontFamily: 'rabarBold',
                ),
              ),
              const Text(
                '🎓 بەشەکەم',
                style: TextStyle(
                  fontSize: 18,
                  color: ThemeColors.kWhiteTextColor,
                  fontFamily: 'rabarBold',
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'ڕیزبەندی بکە، ڕیزبەندیەکانت ببینە، زانیاری لەسەر بەشەکان ببینە',
                style: TextStyle(
                  color: ThemeColors.kGreyTextColor,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyCard(
                    imageAsset: 'assets/images/list3.svg',
                    buttonTitle: 'ببینە',
                    color: ThemeColors.kWhiteTextColor,
                    text: 'کەمترین کۆنمرە',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const KamtrinKonmra()),
                      );
                    },
                  ),
                  MyCard(
                    imageAsset: 'assets/images/id.svg',
                    buttonTitle: 'ببینە',
                    color: ThemeColors.kWhiteTextColor,
                    text: 'نمرەکانم',
                    onTap: () {},
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyCard(
                    imageAsset: 'assets/images/zarabin.svg',
                    buttonTitle: 'ببینە',
                    color: ThemeColors.kWhiteTextColor,
                    text: 'ڕیزبەندیەکانم',
                  ),
                  MyCard(
                    imageAsset: 'assets/images/departments.svg',
                    buttonTitle: 'ببینە',
                    color: ThemeColors.kWhiteTextColor,
                    text: 'بەشەکان',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
