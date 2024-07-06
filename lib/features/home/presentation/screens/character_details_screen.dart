import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappyfi/core/animations/fade_inside_animation.dart';
import 'package:tappyfi/core/theme/app_fonts.dart';
import 'package:tappyfi/features/home/domain/entities/character.dart';
import 'package:tappyfi/features/home/presentation/widgets/custom_item.dart';

class CharacterDetailsScreen extends StatefulWidget {
  const CharacterDetailsScreen({super.key});

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  late Character character;
  late int index;
  @override
  void initState() {
    character = Get.arguments[0];
    index = Get.arguments[1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeInSlide(
              duration: 2,
              direction: FadeSlideDirection.ltr,
              child: CircleAvatar(
                radius: context.height * 0.1,
                child: Text(index.toString(),style: AppFonts.normalStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
            ),
            SizedBox(height: context.height * 0.01),
            Text(character.name,style: AppFonts.normalStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(height: context.height * 0.03),
            customItem(title: "Hair Color ", value: character.hairColor),
            SizedBox(height: context.height * 0.02),
            customItem(title: "Skin Color ", value: character.skinColor),
            SizedBox(height: context.height * 0.02),
            customItem(title: "Eye Color ", value: character.eyeColor),
            SizedBox(height: context.height * 0.02),
            customItem(title: "Birth Year ", value: character.birthYear),
            SizedBox(height: context.height * 0.02),
            customItem(title: "Gender ", value: character.gender),
          ],
        ),
      ),
    );
  }
}
