import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget{
   static const routeName = '/ category_meals';
  final List <Meal> availableMeal ;
   CategoryMealScreen(this.availableMeal);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String title;
List<Meal> displayMeals;
  void didChangeDependencies(){
    final routeArgs = ModalRoute.of(context).settings.arguments as Map <String, String>;
     title = routeArgs['title'];
    final id =routeArgs['id'];
     displayMeals = widget.availableMeal.where((meal) {
      return meal.categories.contains(id);
      }).toList();
     super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
          itemBuilder: (ctx,index){
            return MealItem(
              id: displayMeals[index].id,
                title: displayMeals[index].title,
                imageUrl: displayMeals[index].imageUrl,
                affordability: displayMeals[index].affordability,
                duration: displayMeals[index].duration,
                complexity: displayMeals[index].complexity,
            );
          },
                itemCount: displayMeals.length,
      )
    );
  }
} 