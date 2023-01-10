const assert = require('assert');
const ganache = require('ganache-cli');// local test network
const Web3 = require('web3'); //construction function always start with capital
const web3 = new Web3(ganache.provider()); //instance of web3 & connects to local network

// mocha test
class Car {
    park() {
        return 'stopped';
    }

    drive() {
        return 'vroom';
    }
}
//test our file
//it - run a test and make an assertion
//describe - groups together all it functions
//beforeEach - execute some general code for all it function

let car;  //variable to accessible for all
beforeEach(() => {
    car = new Car();
});

describe('Car', () => {
    it('can park', () => {      
        // const car = new Car();        this statement not required as beforeEach dosr the same for all it function
        assert.equal(car.park(), 'stopped');
    });

    it('can drive', () => {
        // const car = new Car();
        assert.equal(car.drive(), 'vroom');
    });});
