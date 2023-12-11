List<String> lastSearches = [
  'Electronic',
  'Pants',
  'Three Second',
  'Long Shirt',
  'Pants',
  'Pants',
  'Pants',
];

int maxLength(List<String> last){
  int max = 0;
  for(int i = 0; i < last.length; i++){
    int length = last[i].length;
    if(length > max){
      max = length;
    }
  }
  return max;
}