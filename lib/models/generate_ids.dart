// Generate et unik id til vores kort
import 'dart:math';

String generateId(int length) {
  var rnd = Random();
  var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  var result = '';
  for (var i = 0; i < length; i++) {
    result += characters[rnd.nextInt(characters.length)];
  }
  return result;
}
// Derefter tjekke om den allered eksitiere i vores database
// Eksistere der allerede et kort med dette id, skal den regenerate et nyt id.
// Er id'et unik, skal den fortsætte og gemme vores kort i en database.