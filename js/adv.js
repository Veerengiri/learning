// Hoisting and TDS
console.log(x)
var x = 10;
console.log(x);
// Is var is Hoist: YES

// console.log(y); // give error
let y = 20;
console.log(y);
// Is let is Hoist: YES  (same for const)
    // but let is creat TDS (temporal dead zone) so that it can't be access above it declare


