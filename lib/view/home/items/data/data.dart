class CustomGameCard {
  final String title;
  final String description;
  final String players;
  final String time;
  final String asset;

  CustomGameCard({
    required this.title,
    required this.description,
    required this.players,
    required this.time,
    required this.asset,
  });
}

final List<CustomGameCard> games = [
  CustomGameCard(
    title: 'Guess Who',
    description:
        'Each player gets a piece of paper with the name of a famous person, character, or object stuck to their forehead. They take turns asking yes/no questions to figure out who or what they are. Questions like "Am I alive?" or "Am I a fictional character?" help narrow it down. The first to guess correctly wins, but the fun is in the creative questions and hilarious guesses!',
    players: '4-10',
    time: '15-30 minutes',
    asset: 'assets/games/1.png',
  ),
  CustomGameCard(
    title: 'Truth or Dare',
    description:
        'Players take turns choosing either "Truth" or "Dare." If they pick "Truth," they must honestly answer a challenging or funny question from the group. If they choose "Dare," they must perform an assigned action, such as singing a song or doing a silly dance. The game\'s tone can range from light-hearted to mischievous, making it perfect for any party.',
    players: '3-12',
    time: '20-60 minutes',
    asset: 'assets/games/2.png',
  ),
  CustomGameCard(
    title: 'Musical Charades',
    description:
        'In this twist on classic charades, players must act out a song without using words or sounds. The group guesses based on their movements and expressions. Choose popular or nostalgic songs to make it easier for everyone to play. This game is great for creating laughter and testing how well players know their favorite tunes!',
    players: '4-10',
    time: '20-40 minutes',
    asset: 'assets/games/3.png',
  ),
  CustomGameCard(
    title: 'Cup of Confusions',
    description:
        'Players write funny or embarrassing tasks on small slips of paper and put them in a cup. Each turn, a player picks a slip and must complete the task, no matter how wild. Examples include "speak like a pirate for two minutes" or "pretend to be a chicken." It\'s an unpredictable game that guarantees laughter and surprises.',
    players: '3-10',
    time: '20-30 minutes',
    asset: 'assets/games/4.png',
  ),
  CustomGameCard(
    title: 'Twister',
    description:
        'Spin the wheel and place your hands and feet on the colored spots. The challenge? Avoid falling over as the positions get more complicated! Twister is a classic for a reason—it\'s a fun way to get everyone moving, and the awkward tangles always lead to hilarious moments.',
    players: '2-6',
    time: '15-30 minutes',
    asset: 'assets/games/5.png',
  ),
  CustomGameCard(
    title: 'Secret Spy',
    description:
        'Each player gets a card—most will say the same location (e.g., beach or spaceship), but one card identifies the "spy." Players ask each other questions like "What do you usually wear here?" to find the spy. The spy, meanwhile, must blend in and guess the location before being discovered. Perfect for mystery lovers and quick thinkers!',
    players: '5-12',
    time: '15-30 minutes',
    asset: 'assets/games/6.png',
  ),
  CustomGameCard(
    title: 'Alphabet Story',
    description:
        'Players collaboratively create a story, but each sentence must start with the next letter of the alphabet. For example, "Alice found a mysterious box. But she didn\'t know what was inside. Carefully, she opened it..." The game continues until someone stumbles or the alphabet is completed. It\'s a fun and creative challenge for all ages.',
    players: '3-8',
    time: '10-20 minutes',
    asset: 'assets/games/7.png',
  ),
  CustomGameCard(
    title: 'Improvisation Theater',
    description:
        'Players are given a random scenario, such as "You\'re aliens shopping at a grocery store," and must act it out with no preparation. The results are often hilarious and absurd. This game is perfect for unleashing creativity and breaking the ice in a group.',
    players: '3-10',
    time: '15-40 minutes',
    asset: 'assets/games/8.png',
  ),
];
