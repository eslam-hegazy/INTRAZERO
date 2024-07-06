import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:tappyfi/core/routes/app_route.dart';
import 'package:tappyfi/core/theme/app_fonts.dart';
import 'package:tappyfi/features/home/presentation/bloc/character_bloc.dart';
import 'package:tappyfi/features/home/presentation/widgets/custom_item.dart';
import 'package:tappyfi/features/home/presentation/widgets/custom_loading_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  Future<void> onFresh(context) async {
    return BlocProvider.of<CharacterBloc>(context).add(RefreshCharacterEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterBloc, CharacterState>(
      builder: (context, state) {
        if (state is LoadingCharacterState) {
          return const CustomLoadingScreen();
        } else if (state is SuccessCharacterState) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Star Wars",
                style: AppFonts.normalStyle(),
              ),
            ),
            body: RefreshIndicator(
              onRefresh: () => onFresh(context),
              child: ListView.separated(
                itemBuilder: (__, index) {
                  return ListTile(
                    onTap: () {
                      Get.toNamed(AppRoute.rCharacterDetailsScreen,
                          arguments: [state.characters[index],index]);
                    },
                    leading: CircleAvatar(
                      child: Text((index + 1).toString()),
                    ),
                    title: Text(
                      state.characters[index].name,
                      style: AppFonts.normalStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customItem(
                            title: "Hair Color ",
                            value: state.characters[index].hairColor),
                        customItem(
                            title: "Skin Color ",
                            value: state.characters[index].skinColor),
                        customItem(
                            title: "Eye Color ",
                            value: state.characters[index].eyeColor),
                        customItem(
                            title: "Birth Year ",
                            value: state.characters[index].birthYear),
                        customItem(
                            title: "Gender ",
                            value: state.characters[index].gender),
                      ],
                    ),
                  );
                },
                separatorBuilder: (__, index) => const Divider(),
                itemCount: state.characters.length,
              ),
            ),
          );
        }
        return const CustomLoadingScreen();
      },
    );
  }

 
}
