import 'package:flutter/material.dart';
import 'package:steamy_draw/data/repository/app_repository.dart';
import 'package:steamy_draw/presentation/pages/widget/main_button.dart';
import 'package:steamy_draw/resources.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController pageStartController;
  late Animation<Offset> firstButtonAnim;
  late Animation<Offset> secondButtonAnim;
  late Animation<Offset> headerAnim;

  @override
  void initState() {
    AppRepository().getAppData();
    pageStartController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    firstButtonAnim = Tween<Offset>(
      begin: const Offset(1.5, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: pageStartController,
        curve: const Interval(
          0.1,
          0.3,
          curve: Curves.ease,
        ),
      ),
    );
    secondButtonAnim = Tween<Offset>(
      begin: const Offset(-1.5, 0.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: pageStartController,
        curve: const Interval(
          0.2,
          0.4,
          curve: Curves.ease,
        ),
      ),
    );
    headerAnim = Tween<Offset>(
      begin: const Offset(0.0, -1.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: pageStartController,
        curve: const Interval(
          0.4,
          0.7,
          curve: Curves.ease,
        ),
      ),
    );
    pageStartController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/home_background.jpg",
            fit: BoxFit.cover,
          ),
          Align(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SlideTransition(
                    position: firstButtonAnim,
                    child: const MainButton(
                      text: 'شروع با تصاویر برنامه',
                      icon: Icons.collections,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SlideTransition(
                    position: secondButtonAnim,
                    child: const MainButton(
                      text: 'شروع با گالری یا دوربین',
                      icon: Icons.camera,
                      iconOnRight: false,
                    ),
                  )
                ],
              ),
            ),
            alignment: const Alignment(0.0, 0.4),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SlideTransition(
              position: headerAnim,
              child: SizedBox(
                height: 40,
                child: ColoredBox(
                  color: Colors.black38,
                  child: Row(
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          child: SizedBox(
                            width: 48,
                            height: 40,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: const [
                                Icon(
                                  Icons.star,
                                  size: 20,
                                  color: AppColors.secondary,
                                ),
                                Text(
                                  'امتیاز',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: AppColors.secondary,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
