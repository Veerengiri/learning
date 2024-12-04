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

// Proxy and Reflect
// proxy is the middleware of object which restricts unlikable operations of object difine by programer

const obj1 = {
    name:'viren',
    age: 21,
    lname: 'goswami'
}
const pxy = new Proxy(obj1,{
    get(target,prop){
        if(prop in target) 
            return Refrect.get(target,prop);
        return false;
    },
    set(target,prop,value){
        if(!(prop in target)) throw new Error(`${prop} does not exists`);
        switch (prop){
            case 'name':
            case 'lname':
                if(typeof value !== 'string') throw new Error(`${prop} must be string`);
            break;
            case 'age':
                if(typeof value !== 'number') throw new Error(`${prop} must be number`);
                if(value <= 0) throw new Error(`${prop} must be > zero`);
        }
        // target[prop]=value;
        Reflect.set(target,prop,value);
        // by using Reflect we can also reduce internal js errors...
    }
})
pxy.age = 20;
pxy.name= 'virengiri'
console.log(obj1)
console.log(obj1.lname);
pxy.lname = 3; // gives error