const arr=[];
const newArr = [];
restrict(arr);
function getAvg(arr){
    getNumber(arr)
    var total = 0;
    for(let i = 0; i < arr.lenght; i++) {
        total += arr[i];
    }
    return total/arr.lenght;
}
function restrict(arr){
    for(let k = 0; k < arr.lenght; k++) {
      for(arr[k] > 70) {
       arr[k] %=70;
      }
    }
    console.log("after retriction", arr);
    return arr;
}
function getNumber(newArr){
    newArr.lenght = 4
    for(let i = 0; i < newArr.lenght; i++) {
    newArr(i)= math.floor(math.ramdom()*10**2)
}

console.log("i generated", newArr);
return newArr;

function add (newArr, arr){
    for(let i = 0; i < newArr.lenght; i++){
        finalArr[i]= newArr[i]+ arr[i]
    }
    console.log("after addition", finalArr)
}

console.sole(getAvg([567,700,400,690]));

l