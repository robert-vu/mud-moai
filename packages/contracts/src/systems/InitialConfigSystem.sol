// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import {System} from "@latticexyz/world/src/System.sol";
import {
    ElementConfigTable,
    ElementConfigTableData,
    LandClaimTable,
    LandClaimTableData,
    TokenClaimTable,
    MoaiAttributeTable,
    CellsTable,
    CellsOwnerTable,
    CellEventTable
} from "../codegen/Tables.sol";
import {ElementType} from "../codegen/Types.sol";
import {InvalidAddress, ExceedClaimed} from "../common/Errors.sol";
import {
    TABLE_CELL_COUNTER_ID,TABLE_CELL_OWNER_ID
    } from "../common/Constants.sol";
import {LibCounter} from "../libraries/LibCounter.sol";

contract InitialConfigSystem is System {
    


    function initialElement() external {
        //initial element type
        ElementConfigTable.set(ElementType.FIRE,90,1000,195,59,2,0,0);
        ElementConfigTable.set(ElementType.EARTH,90,1000,0,180,72,4,0);
        ElementConfigTable.set(ElementType.AIR,90,1000,0,0,193,58,5);
        ElementConfigTable.set(ElementType.WATER,90,1000,4,0,0,168,84);
        ElementConfigTable.set(ElementType.LIGHT,90,1000,84,4,0,0,168);
    }

    function initialMoaiAttribute(uint256 nftId,uint8 elementType) external {
        //setup nft
        MoaiAttributeTable.set(nftId,ElementType(elementType));
    }
}
