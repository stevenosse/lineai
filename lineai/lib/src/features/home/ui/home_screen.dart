import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lineai/src/core/theme/dimens.dart';
import 'package:lineai/src/features/home/logic/counter_cubit.dart';
import 'package:lineai/src/shared/components/gap.dart';
import 'package:lineai/src/shared/extensions/context_extensions.dart';

@RoutePage()
class HomeScreen extends StatefulWidget implements AutoRouteWrapper {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (_) => CounterCubit(),
        child: this,
      );
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FractionallySizedBox(
          widthFactor: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap.vertical(height: Dimens.spacing),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return Text(
                    '${state.value}',
                    style: context.textTheme.headlineLarge,
                  );
                },
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.read<CounterCubit>().increment(),
          child: const Icon(Icons.add),
        ));
  }
}
