import 'dart:io';

//create a class to hold Goodie object
class Goodie{
  final String name;
  final int price;

  Goodie(this.name,this.price);
}

void main(){

  //open input and output files
File inputFile = File('sample_input.txt');
  //will be generated
File outputFile  = File('sample_output.txt');


  //Read lines from input file and store value in list
  List<String> inputLines = inputFile.readAsLinesSync();


  //extract number of employees from the first line
  int numOfemployees = int.parse(inputLines[0].split(": ")[1]);


  //innitiate list to store Goodie objects
  List<Goodie> goodies = [];


  //loop through the input lines from index 2
  for(int i=2; i<inputLines.length; i++){
    //split each line with ": "  to get name and price
    List<String> parts = inputLines[i].split(": ");
    //extract name and price from each item 
    String name = parts[0];
    int price = int.parse(parts[1]);

    //add item to list 
    goodies.add(Goodie(name,price));
    
  }

  //sort the list by price from cheap to expensive
  goodies.sort((a,b)=> a.price-b.price);

  //select first numOf emoloyee goodies with lowest  prices
  List<Goodie> selectGoodies  = goodies.sublist(0,numOfemployees);

  //calculate diff btn highest and lowest priced goodie
  int priceDiff = selectGoodies.last.price - selectGoodies.first.price;


  //create output string with selected goodies and price diff
  String output = "The goodies selected for distribution are :\n";
  for(Goodie goodie in selectGoodies){
    output+="${goodie.name}: ${goodie.price}";
  }

  output +="And the difference the chosen goodie woth the highets and the lowest price is $priceDiff";
  
   //write output to file
  outputFile.writeAsStringSync(output);

  print("output file successfuly written");
  
  
}