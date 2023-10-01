import 'package:api_repository/api_repository.dart';
import 'package:bloc_test/page/view/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(context.read<ApiRepository>())..getData(),
      child: const Homeview(),
    );
  }
}

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter bloc Expo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          switch (state.status) {
            case HomeStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case HomeStatus.succes:
              return GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                padding: const EdgeInsets.fromLTRB(10, 20, 30, 40),
                children: state.apis.map((api) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(api.url, fit: BoxFit.cover)),
                    ),
                  );
                }).toList(),
              );
            case HomeStatus.error:
              return Center(child: Text('${HomeStatus.error}'));
          }
        },
      ),
    );
  }
}
