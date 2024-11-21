class CustomDrinkCard {
  final String title;
  final String description;
  final String time;
  final List<String> ingredients;
  final List<String> recipe;
  final String asset;
  final bool isAlcoholic;

  CustomDrinkCard({
    required this.title,
    required this.description,
    required this.time,
    required this.ingredients,
    required this.recipe,
    required this.asset,
    required this.isAlcoholic,
  });
}

final List<CustomDrinkCard> drinks = [
  CustomDrinkCard(
    title: 'Classic Mojito',
    description: 'A refreshing Cuban cocktail that\'s perfect for any party.',
    time: '5-10 minutes',
    ingredients: [
      '50 ml white rum',
      '8-10 fresh mint leaves',
      '2 tsp sugar',
      '25 ml lime juice',
      'Soda water',
      'Crushed ice',
    ],
    recipe: [
      'In a glass, muddle the mint leaves with sugar and lime juice to release the mint\'s aroma.',
      'Fill the glass halfway with crushed ice, then pour in the rum.',
      'Top with soda water and stir gently.',
      'Garnish with a sprig of mint and a lime wedge.',
    ],
    asset: 'assets/drinks/1.png',
    isAlcoholic: true,
  ),
  CustomDrinkCard(
    title: 'Piña Colada',
    description:
        'A creamy tropical drink that brings summer vibes to any gathering.',
    time: '5-7 minutes',
    ingredients: [
      '50 ml white rum',
      '100 ml pineapple juice',
      '50 ml coconut cream',
      'Crushed ice',
    ],
    recipe: [
      'Blend all ingredients with crushed ice until smooth.',
      'Pour into a tall glass and garnish with a pineapple slice and a cherry.',
    ],
    asset: 'assets/drinks/2.png',
    isAlcoholic: true,
  ),
  CustomDrinkCard(
    title: 'Strawberry Daiquiri',
    description: 'A sweet and fruity cocktail that\'s always a crowd-pleaser.',
    time: '5-8 minutes',
    ingredients: [
      '50 ml white rum',
      '25 ml lime juice',
      '2 tsp sugar',
      '5 fresh strawberries',
      'Crushed ice',
    ],
    recipe: [
      'Blend the rum, lime juice, sugar, strawberries, and ice until smooth.',
      'Serve in a cocktail glass and garnish with a strawberry.',
    ],
    asset: 'assets/drinks/3.png',
    isAlcoholic: true,
  ),
  CustomDrinkCard(
    title: 'Espresso Martini',
    description:
        'A sophisticated cocktail with a caffeine kick, ideal for evening parties.',
    time: '5 minutes',
    ingredients: [
      '50 ml vodka',
      '25 ml coffee liqueur',
      '25 ml freshly brewed espresso',
      'Ice',
    ],
    recipe: [
      'Add vodka, coffee liqueur, and espresso to a cocktail shaker filled with ice.',
      'Shake well and strain into a chilled martini glass.',
      'Garnish with three coffee beans.',
    ],
    asset: 'assets/drinks/4.png',
    isAlcoholic: true,
  ),
  CustomDrinkCard(
    title: 'Tequila Sunrise',
    description: 'A visually stunning drink with layers of orange and red.',
    time: '3-5 minutes',
    ingredients: [
      '50 ml tequila',
      '100 ml orange juice',
      '10 ml grenadine',
      'Ice',
    ],
    recipe: [
      'Fill a glass with ice and pour in tequila and orange juice.',
      'Slowly pour grenadine along the side of the glass; it will sink and create a gradient.',
      'Garnish with an orange slice and cherry.',
    ],
    asset: 'assets/drinks/5.png',
    isAlcoholic: true,
  ),
  CustomDrinkCard(
    title: 'Blue Lagoon',
    description: 'A vibrant blue cocktail that\'s sweet and citrusy.',
    time: '3-5 minutes',
    ingredients: [
      '50 ml vodka',
      '25 ml blue curaçao',
      '100 ml lemonade',
      'Ice',
    ],
    recipe: [
      'Fill a glass with ice and add vodka and blue curaçao.',
      'Top with lemonade and stir gently.',
      'Garnish with a lemon wheel or cherry.',
    ],
    asset: 'assets/drinks/6.png',
    isAlcoholic: true,
  ),
  CustomDrinkCard(
    title: 'Margarita',
    description:
        'A tangy and salty classic cocktail, perfect for celebrations.',
    time: '5 minutes',
    ingredients: [
      '50 ml tequila',
      '25 ml lime juice',
      '25 ml triple sec',
      'Ice',
      'Salt (for rim)',
    ],
    recipe: [
      'Rub a lime wedge around the rim of a glass and dip in salt.',
      'Shake tequila, lime juice, and triple sec with ice.',
      'Strain into the glass and garnish with a lime wedge.',
    ],
    asset: 'assets/drinks/7.png',
    isAlcoholic: true,
  ),
  CustomDrinkCard(
    title: 'Cosmopolitan',
    description: 'A sleek, pink cocktail that\'s fruity and tart.',
    time: '5 minutes',
    ingredients: [
      '40 ml vodka',
      '15 ml triple sec',
      '30 ml cranberry juice',
      '10 ml lime juice',
      'Ice',
    ],
    recipe: [
      'Shake all ingredients with ice in a cocktail shaker.',
      'Strain into a chilled martini glass.',
      'Garnish with an orange twist.',
    ],
    asset: 'assets/drinks/8.png',
    isAlcoholic: true,
  ),
  CustomDrinkCard(
    title: 'Whiskey Sour',
    description: 'A balanced blend of sweet, sour, and smoky flavors.',
    time: '5 minutes',
    ingredients: [
      '50 ml bourbon whiskey',
      '25 ml lemon juice',
      '20 ml sugar syrup',
      'Ice',
      'Optional: 1 egg white',
    ],
    recipe: [
      'Shake whiskey, lemon juice, and sugar syrup with ice (and egg white for a frothy texture).',
      'Strain into a glass over ice.',
      'Garnish with a cherry and lemon slice.',
    ],
    asset: 'assets/drinks/9.png',
    isAlcoholic: true,
  ),
  CustomDrinkCard(
    title: 'Virgin Mojito',
    description: 'A refreshing and easy mocktail for everyone to enjoy.',
    time: '5 minutes',
    ingredients: [
      '10 fresh mint leaves',
      '2 tsp sugar',
      '25 ml lime juice',
      'Soda water',
      'Crushed ice',
    ],
    recipe: [
      'Muddle mint leaves with sugar and lime juice in a glass.',
      'Fill with crushed ice and top with soda water.',
      'Stir gently and garnish with a mint sprig and lime wedge.',
    ],
    asset: 'assets/drinks/10.png',
    isAlcoholic: false,
  ),
];
