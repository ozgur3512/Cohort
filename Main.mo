actor calculator{

// VARIABLES
public type logType={
  var operation:Text;
  var result:Int;
};

var lastOperation:logType={
  var operation="";
  var result=0;
};

var number:Int=0;

// GENERAL FUNCTIONS
public func multiply(n:Int): async Int{
  number*=n;
  await setLastOperation("multiply", number);
  return number;
};

public func add(n:Int): async Int{
  number+=n;
  await setLastOperation("add", number);
  return number;
};

public func subtract(n:Int): async Int{
  number-=n;
  await setLastOperation("subtract", number);
  return number;

};

public func divide(n:Int): async ?Int{
  if(n==0) {return null};

  number/=n;
  await setLastOperation("divide", number);

  return ?number;
};

public func power(exp: Int): async Int {
  var result: Int = 1; 
  var keeper:Int=0;

  while (keeper < exp) {
    result *= number; 
    keeper+=1;
  };

  number := result;
  await setLastOperation("power", number);

  return number;
};

public func factorial(): async Int{
  var result:Int=1;

  while(number > 0){
    result*=number;
    number-=1;
  };
  number:=result;
  await setLastOperation("factorial", number);

  return number;
};



// SETTERS
public func setNumber(newNumber:Int): async () {
  number:=newNumber;
};

public func reset(): async () {
  number := 0;
};

private func setLastOperation(operationType: Text, result: Int): async () {
  lastOperation.operation := operationType;  
  lastOperation.result := result;            
};

// GETTERS
public query func getNumber():async Int{
  return number;
};

public query func getNumberSquared():async Int{
  return number*number;
};

public query func getLastOperation(): async { operation: Text; result: Int } {
  return {
    operation = lastOperation.operation;
    result = lastOperation.result;
  };
}

};