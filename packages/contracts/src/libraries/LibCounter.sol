
pragma solidity >=0.8.0;

import { Counter } from "../codegen/Tables.sol";

library LibCounter {
    
    function increment(bytes32 tableId) internal returns (uint32) {
    uint32 counter = Counter.get(tableId);
    uint32 newValue = counter + 1;
    Counter.set(tableId,newValue);
    return newValue;
  }
}