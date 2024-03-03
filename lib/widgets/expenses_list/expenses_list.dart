import 'package:expense/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';
import 'package:expense/models/expenses.dart';


class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses, required this.removeExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) removeExpense;
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expenses[index]),
        background: Container(color: Color.fromARGB(92, 161, 161, 161),),
        onDismissed: (dirextion){
          removeExpense(expenses[index]);
        },
        child: Expenseitem(expenses[index]),
      ),
    );
  }
}
