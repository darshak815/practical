class Strings {
  String totalBoxDisplay = "Total No of Boxes to be displayed on each side";
  String maxSelectionBothSide = "Max No of Total Selections allowed for selecting on both the sides";
  String maxAlphabets = "Max No of Alphabets allowed for selecting";
  String maxNumbers = "Max No of Numbers allowed for selecting";
  String resetAll = "Reset all values to 'O'";
  String error = "Error: ";
  String errorMaxLimit (int val)=> "Unable to select as Max No of Selections Reached $val";
  String errorAlphabetLimit = "Unable to select as Max No of Alphabet reached ";
  String errorNumbersLimit = "Unable to select as Max No of Numbers reached ";
  String errorEnterValueSelection(int number) =>  "You cannot enter value more than $number in Max No of Selections.";
  String errorEnterValueAlphabets(int number) => "You cannot enter value more than $number in Max No of Alphabets";
  String errorEnterValueNumbers(int number) => "You cannot enter value more than $number in Max No of Numbers";
  String errorOnlySameOrLess = "Only Max of 11 select boxes can be Created, enter value less than or equal to 11";
  String success = "Success";
}
