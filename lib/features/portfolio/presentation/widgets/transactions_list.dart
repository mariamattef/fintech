import 'package:easy_localization/easy_localization.dart';
import 'package:fintech/core/config/app_text_style.dart';
import 'package:fintech/features/portfolio/presentation/cubit/transaction_cubit.dart';
import 'package:fintech/features/portfolio/presentation/cubit/transaction_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'transaction_item.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "recentTransactions".tr(),
          style: AppTextStyles.mMedium
              .copyWith(color: Theme.of(context).colorScheme.primary),
        ),
        Gap(15.h),
        BlocBuilder<TransactionCubit, TransactionState>(
          builder: (context, state) {
            if (state is TransactionLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TransactionError) {
              return Center(child: Text(state.message));
            } else if (state is TransactionSuccess) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.transactions.length,
                itemBuilder: (context, index) {
                  final transaction = state.transactions[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: TransactionItem(
                      title: transaction.title,
                      amount: transaction.amount,
                      time: transaction.time,
                      value: transaction.value,
                      icon: transaction.icon,
                      iconColor: transaction.iconColor,
                    ),
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
