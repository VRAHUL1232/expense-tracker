import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  Expense({
    required this.title,
    required this.date,
    required this.amount,
    required this.category,
  }) : id = uuid.v4();

  final String title;
  final double amount;
  final String id;
  final DateTime date;
  final Category category;

  String get formatDate {
    return formatter.format(date);
  }
}

class ExpenseBucket{
  const ExpenseBucket({required this.category,required this.expenses});
  final Category category;
  final List<Expense> expenses;

  ExpenseBucket.forCategory(List<Expense> allExpense,this.category) :
  expenses = allExpense.where((element) => element.category == category).toList();

  double get totalExpenses{
    double sum = 0;
    for (final expense in expenses){
      sum += expense.amount;
    }
    return sum;
  }
}