import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import '../widgets/meal_item.dart';

class MealDetailScreen extends StatelessWidget{
  static const routeName = '/Meal_detail';
Widget  buildSectionTitle (BuildContext context , String text){
  return Container(
    margin: EdgeInsets.all(15),
    child: Text(
      text,
      style: Theme.of(context).textTheme.title,
    ),
  );
}
Widget buildContainer (Widget child , double height){
  return Container(
    decoration: BoxDecoration(
    color: Colors.white,
      border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15)
    ),
    margin: EdgeInsets.all(15),
    padding: EdgeInsets.all(15),
    height: height,
    child: child,
    
  );
}
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectMeal = DUMMY_MEALS.firstWhere((meal) => meal.id==mealId);

    return Scaffold(
      appBar: AppBar(
        title:Text('$selectMeal.title'),
      ),
      body: LayoutBuilder(
        builder: (ctx,constrains) {
          return SingleChildScrollView(
            child: Column(
            children:<Widget> [
            Container(
              height: constrains.maxHeight*.4,
            width: double.infinity,
            child: Image.network(selectMeal.imageUrl,
            fit: BoxFit.cover,),
            ),
              buildSectionTitle(context, 'Ingrediants'),
              buildContainer(
                   ListView.builder(
                       itemBuilder: (ctx , index) => Card(
                         color: Colors.amber,
                          child: Padding (
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 10,
                            ),
                            child: Text(selectMeal.ingredients[index]),
                          ),
                       ),
                     itemCount:selectMeal.ingredients.length,
                   ),
                constrains.maxHeight*.3,
              ),
              buildSectionTitle(context, 'Steps'),
              buildContainer(
                ListView.builder(itemBuilder: (ctx , index)=>Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(selectMeal.steps[index]
                      ),
                    ),
                    Divider(),
                  ],
                ),
                  itemCount: selectMeal.steps.length,
                ),
                constrains.maxHeight*.3,
              ),
            ]
            ),
          );
        }
        ),
    );
  }
}