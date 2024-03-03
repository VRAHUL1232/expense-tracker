import 'package:expense/models/expenses.dart';
import 'package:flutter/material.dart';

class Expenseitem extends StatelessWidget {
  const Expenseitem(
    this.expenseItem, {
    super.key,
  });

  final Expense expenseItem;

  @override
  Widget build(context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expenseItem.title,style: Theme.of(context).textTheme.titleLarge,),
            const SizedBox(height: 10),
            Row(
              children: [
                Text('\$${expenseItem.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(
                      categoryIcons[expenseItem.category],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(expenseItem.formatDate),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
