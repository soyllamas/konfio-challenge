import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:konfio_challenge/presentation/home/home_cubit.dart';
import 'package:konfio_challenge/presentation/widgets/dog_tile.dart';
import 'package:konfio_challenge/presentation/widgets/loading_page.dart';
import 'package:konfio_challenge/util/build_context_extension.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.title),
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state.error == HomeError.network) {
            showMessage(context, context.l10n.networkError);
            context.read<HomeCubit>().didShowError();
            return;
          }

          if (state.error == HomeError.unknown) {
            showMessage(context, context.l10n.unknownError);
            context.read<HomeCubit>().didShowError();
            return;
          }
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const LoadingPage();
          }

          return CustomScrollView(slivers: [
            SliverSafeArea(
              sliver: SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                sliver: SliverList.builder(
                  itemCount: state.dogs.length,
                  itemBuilder: (context, index) {
                    final dog = state.dogs[index];
                    return DogTile(
                      name: dog.name,
                      imageUrl: dog.imageUrl,
                      description: dog.description,
                      years: dog.age,
                    );
                  },
                ),
              ),
            ),
          ]);
        },
      ),
    );
  }

  void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: context.colorScheme.error,
      ),
    );
  }
}
