import 'package:expense/widgets/chart/chart.dart';
import 'package:expense/widgets/expenses_list/expenses_list.dart';
import 'package:expense/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense/models/expenses.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [];

  void addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _openExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        addExpense: addExpense,
      ),
    );
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text("Expense removed."),
      action: SnackBarAction(
          label: "UNDO",
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    var flag = 0;
    Widget mainWidget = const Center(
      child: Text(
        "No expense found! Add some",
        style: TextStyle(fontSize: 20),
      ),
    );

    if (_registeredExpenses.isNotEmpty) {
      flag = 1;
      mainWidget = ExpensesList(
        expenses: _registeredExpenses,
        removeExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses Tracker App"),
        actions: [
          IconButton(
            onPressed: _openExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: (width < 600)
          ? Column(
              children: [
                (flag == 0)
                    ? Container()
                    : Chart(expenses: _registeredExpenses),
                Expanded(child: mainWidget),
              ],
            )
          : Row(
              children: [
                (flag == 0)
                    ? Container()
                    : Expanded(
                        child: Chart(expenses: _registeredExpenses),
                      ),
                Expanded(child: mainWidget)
              ],
        ),
    );
  }
}
