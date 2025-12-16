import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fintech/features/portfolio/presentation/cubit/portfolio_cubit.dart';
import 'package:fintech/core/di/service_locator.dart'; // Assuming service_locator is accessible

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  @override
  void initState() {
    super.initState();
    // Fetch prices for a few cryptos on initialization
    sl<PortfolioCubit>().fetchCryptoPrices(['bitcoin', 'ethereum', 'cardano']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Portfolio'),
      ),
      body: BlocProvider(
        create: (_) => sl<PortfolioCubit>(),
        child: BlocBuilder<PortfolioCubit, PortfolioState>(
          builder: (context, state) {
            if (state is PortfolioLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PortfolioLoaded) {
              return ListView.builder(
                itemCount: state.cryptoPrices.length,
                itemBuilder: (context, index) {
                  final crypto = state.cryptoPrices[index];
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            crypto.id.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Price: \$${crypto.usdPrice.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            '24h Change: ${crypto.usd24hrChange.toStringAsFixed(2)}%',
                            style: TextStyle(
                              fontSize: 16,
                              color: crypto.usd24hrChange >= 0
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is PortfolioError) {
              return Center(
                child: Text(
                  'Error: ${state.message}',
                  style: const TextStyle(color: Colors.red, fontSize: 18),
                ),
              );
            }
            return const Center(child: Text('Press button to load portfolio'));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // You might want to allow refreshing the data
          sl<PortfolioCubit>().fetchCryptoPrices(['bitcoin', 'ethereum', 'cardano']);
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}