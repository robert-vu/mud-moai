// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import "forge-std/Test.sol";
import {console} from "forge-std/console.sol";
import { MudTest } from "@latticexyz/store/src/MudTest.sol";
import { getKeysWithValue } from "@latticexyz/world/src/modules/keyswithvalue/getKeysWithValue.sol";

import { IWorld } from "../src/codegen/world/IWorld.sol";

import { LibCounter } from "../src/libraries/LibCounter.sol";
import {TABLE_CELL_COUNTER_ID,TABLE_CELL_OWNER_ID} from "../src/common/Constants.sol";
import {ElementType} from "../src/codegen/Types.sol";
import {
    Counter,
    ElementConfigTable,
    ElementConfigTableData,
    LandClaimTable,
    LandClaimTableData,
    TokenClaimTable,
    MoaiAttributeTable,
    CellsTable,
    CellsOwnerTable,
    CellEventTable
} from "../src/codegen/Tables.sol";
import {LandClaimSystem} from "../src/systems/LandClaimSystem.sol";
import {InitialConfigSystem} from "../src/systems/InitialConfigSystem.sol";
contract LandClaimTest is MudTest {
  IWorld public world;
  uint256 nftId=12;
  uint8 elementType=3;

  function setUp() public override {
    vm.fee(0);
    vm.txGasPrice(0);
    super.setUp();
    world = IWorld(worldAddress);
    world.initialElement();
    world.initialMoaiAttribute(nftId,elementType);    
  }

  function testWorldExists() public {
    uint256 codeSize;
    address addr = worldAddress;
    assembly {
      codeSize := extcodesize(addr)
    }
    assertTrue(codeSize > 0);
  }

  function testClaimLand() public {
    
    // check config

    uint8[] memory cells;
    uint16 level;
    uint256 tokenAmount=10;
    
    for(uint16 index=0;index<256;index++){
      if(index==0){
        console.log("Claim land at:",index);
        cells= world.claimLand(nftId);
      } else {
        console.log("Upgrade land at level:",index+1);
        cells= world.upgradeLand(nftId,tokenAmount);
      }
      console.log("Success random cell:");
      for(uint8 cIndex=0;cIndex<cells.length;cIndex++){
        console.log("Cell:",cells[cIndex]);
      }
      //check level
      LandClaimTableData memory item=world.getClaimResult(nftId);
      uint16 numFire=item.numFire;
      uint16 numEarth=item.numEarth;
      uint16 numAir=item.numAir;
      uint16 numWater=item.numWater;
      uint16 numLight=item.numLight;
      uint16 newLevel=item.level;
      console.log("Level:%d-numFire:%d-numEarth:%d",newLevel,numFire,numEarth);
      console.log("-numAir:%d-numWater:%d-numLight:%d",numAir,numWater,numLight);
    }
    assertEq(cells.length, 8);
  }
}
