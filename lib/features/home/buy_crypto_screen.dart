import 'package:flutter/material.dart';


class BuyCryptoScreen extends StatefulWidget {
  static const String routeName = '/buy-crypto';

  const BuyCryptoScreen({super.key});

  @override
  State<BuyCryptoScreen> createState() => _BuyCryptoScreenState();
}

class _BuyCryptoScreenState extends State<BuyCryptoScreen> {
  final Color primaryColor = const Color(0xFF1A2C4F);
  final Color backgroundColor = const Color(0xFFF5F7FA);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Buy Crypto",
          style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildConversionCard(),
            const SizedBox(height: 20),
            _buildFeeSection(),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const PaymentMethodScreen()),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                ),
                child: const Text("Continue", style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
            const SizedBox(height: 10), // Bottom safe area spacing
          ],
        ),
      ),
    );
  }

  Widget _buildConversionCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))
        ],
      ),
      child: Column(
        children: [
          // You Pay Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("You Pay", style: TextStyle(color: Colors.grey, fontSize: 12)),
                  SizedBox(height: 5),
                  Text("\$1,800.00", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1A2C4F))),
                ],
              ),
              _buildCurrencySelector("USD", Icons.attach_money),
            ],
          ),
          const SizedBox(height: 15),
          
          // Divider with Swap Icon
          Stack(
            alignment: Alignment.center,
            children: [
              const Divider(color: Colors.grey, thickness: 0.5),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
                ),
                child: const Icon(Icons.swap_vert, color: Colors.orange, size: 24),
              ),
            ],
          ),
          const SizedBox(height: 15),

          // You Receive Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("You Receive", style: TextStyle(color: Colors.grey, fontSize: 12)),
                  SizedBox(height: 5),
                  Text("0.9876", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1A2C4F))),
                ],
              ),
              _buildCurrencySelector("ETH", Icons.diamond_outlined),
            ],
          ),
          const SizedBox(height: 25),
          
          // Rate Text
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.circle, size: 6, color: Colors.orange),
              SizedBox(width: 8),
              Text("1 USD = 0.00078 ETH", style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCurrencySelector(String code, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7FA),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: const Color(0xFF1A2C4F)),
          const SizedBox(width: 5),
          Text(code, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1A2C4F))),
          const SizedBox(width: 5),
          const Icon(Icons.keyboard_arrow_down, size: 18, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildFeeSection() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.attach_money, color: Colors.white, size: 16),
                ),
                const SizedBox(width: 10),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Exchange fee", style: TextStyle(color: Colors.grey, fontSize: 10)),
                    SizedBox(height: 2),
                    Text("0.05%", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1A2C4F))),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 22), // Adjusted to match height
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Center(
              child: Text("\$26", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF1A2C4F))),
            ),
          ),
        ),
      ],
    );
  }
}