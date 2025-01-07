import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/main_cubit.dart';
import '../widgets/quote_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<MainCubit>(context).initHome(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(builder: (context, state) {
      final cubit = BlocProvider.of<MainCubit>(context);
      return Scaffold(
          appBar: AppBar(title: const Text('Random Quote')),
          floatingActionButton: FloatingActionButton(
            onPressed: () => cubit.getQuoteData(context, refresh: true),
            child: const Icon(Icons.refresh_outlined),
          ),
          body: cubit.quoteData == null
              ? const SizedBox()
              : QuoteCard(cubit.quoteData!));
    });
  }
}
