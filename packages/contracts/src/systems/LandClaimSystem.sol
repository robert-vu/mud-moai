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
import {InvalidAddress, ExceedClaimed,InvalidClaimed} from "../common/Errors.sol";
import {
    TABLE_CELL_COUNTER_ID,TABLE_CELL_OWNER_ID
    } from "../common/Constants.sol";
import {LibCounter} from "../libraries/LibCounter.sol";

contract LandClaimSystem is System {
    struct Item {
        uint16 numLockCell;
        uint16 numUnLockCell;
        ElementType eType;
    }

    function claimLand(uint256 nftId) external returns(uint8[] memory cells) {
        //first check owner of token id
        address holder=_msgSender();
        if(this.ableClaim(holder,nftId)==false){
            revert InvalidClaimed();
        }
        //get attribute of MOAI NFt
        ElementType moaiType= MoaiAttributeTable.get(nftId);
        // random 8 cell
        cells = unLockCells(holder, nftId,8,moaiType);
        return cells;
    }
    function upgradeLand(uint256 nftId,uint256 tokenAmount) external returns(uint8[] memory cells) {
         address holder=_msgSender();
         if(ableUpgrade(nftId)==false){
            revert ExceedClaimed();
        }
         ElementType moaiType= MoaiAttributeTable.get(nftId);
        // random 8 cell
        cells = unLockCells(holder, nftId,8,moaiType);
        return cells;
    }
    function unLockCells(address holder, uint256 nftId,uint8 numberCells,ElementType moaiType) internal returns(uint8[] memory cells) {
        
        // random 8 cell
        cells = randomCells(nftId, moaiType,numberCells, holder);
        //
        uint256 _cellId=0;
        for(uint8 index=0;index<cells.length;index++){
            //create cell
            _cellId=LibCounter.increment(TABLE_CELL_COUNTER_ID);
            CellsTable.set(_cellId,0,0,ElementType(cells[index]),false,0,0);
            //add to owner
            CellsOwnerTable.push(TABLE_CELL_OWNER_ID,holder,_cellId);
        }
        return cells;
    }
   /*  function claimToken(address owner)   external {
        uint256 lastClaim= TokenClaimTable.get(owner);
        require(lastClaim+ 1 hours>block.timestamp,"Waiting next claim");
        
    } */

    function ableClaim(address holder,uint256 nftId) public view returns (bool) {
        uint16 level = LandClaimTable.getLevel(nftId);
        if(level>0){
            return false;
        }
        //need implement check owner of this nft

        return true;
    }
    //using for unit test
    function getClaimResult(uint256 nftId) external view returns(LandClaimTableData memory item){
        return LandClaimTable.get(nftId);
    }
    function ableUpgrade(uint256 nftId) internal view returns(bool){
        //need check has been claim land
        uint16 level = LandClaimTable.getLevel(nftId);
        if(level==0||level==32) {
            return false;
        }
        //need implement validate cost with moai token
        return true;
    }
    function randomCells(uint256 nftId, ElementType elementName, uint8 nRandom, address holder) internal returns (uint8[] memory) {
        if (holder == address(0)) {
            revert InvalidAddress();
        }
        //load config
        ElementConfigTableData memory configData = ElementConfigTable.get(elementName);
        LandClaimTableData memory holderClaim = LandClaimTable.get(nftId);

        Item[] memory elements = new Item[](5);
        uint8 nIndex=0;
        {
            if (configData.maxFire > 0 && configData.maxFire - holderClaim.numFire > 0) {
                elements[nIndex]=Item({eType:ElementType.FIRE,numLockCell:configData.maxFire - holderClaim.numFire,numUnLockCell:holderClaim.numFire });
                nIndex=nIndex+1;
            }
            if (configData.maxEarth > 0 && configData.maxEarth - holderClaim.numEarth > 0) {
                elements[nIndex]=Item({eType:ElementType.EARTH,numLockCell:configData.maxEarth - holderClaim.numEarth,numUnLockCell:holderClaim.numEarth });
                nIndex=nIndex+1;
            }
            if (configData.maxAir > 0 && configData.maxAir - holderClaim.numAir > 0) {
                elements[nIndex]=Item({eType:ElementType.AIR,numLockCell:configData.maxAir - holderClaim.numAir,numUnLockCell:holderClaim.numAir });
                nIndex=nIndex+1;
            }
            if (configData.maxWater > 0 && configData.maxWater - holderClaim.numWater > 0) {
                elements[nIndex]=Item({eType:ElementType.WATER,numLockCell:configData.maxWater - holderClaim.numWater,numUnLockCell:holderClaim.numWater });
                nIndex=nIndex+1;
            }
            if (configData.maxLight > 0 && configData.maxLight - holderClaim.numLight > 0) {
                elements[nIndex]=Item({eType:ElementType.LIGHT,numLockCell:configData.maxLight - holderClaim.numLight,numUnLockCell:holderClaim.numLight });
                nIndex=nIndex+1;
            }
        }
        
        uint8[] memory cells = new uint8[](nRandom);
        // 0-counter fire,1-counter earth,2-counter air,3-counter water,4-counter light
        uint8[] memory nElement = new uint8[](5);
        {
            uint16 rand = 0;
            uint16 minAvaiable = 0;
            uint16 maxAvaiable = 0;
            uint16 maxRandom;
            
            for (uint8 n = 1; n <= nRandom; n++) {
                //fresh each loop so that
                maxRandom = 256
                    - (
                        holderClaim.numFire + holderClaim.numEarth + holderClaim.numAir + holderClaim.numWater
                            + holderClaim.numLight
                    );
                rand = getRandomNumber(maxRandom, 1, n);
                for (uint8 index = 0; index < nIndex; index++){
                    minAvaiable = 0;
                    maxAvaiable = 0;
                    //ignore case has achieve max value
                    if(elements[index].numLockCell==0){
                        continue;
                    }
                    if (index > 0) {
                        minAvaiable = getMin(elements, index);
                    }
                    maxAvaiable = minAvaiable +elements[index].numLockCell;
                    if (minAvaiable < rand && rand <= maxAvaiable) {
                        //update number lock cell
                        elements[index].numLockCell=elements[index].numLockCell-1;
                        // update number of cell has unlock
                        if(elements[index].eType==ElementType.FIRE){
                            holderClaim.numFire=holderClaim.numFire+1;
                            nElement[0]++;
                        }
                        if(elements[index].eType==ElementType.EARTH){
                            holderClaim.numEarth=holderClaim.numEarth+1;
                            nElement[1]++;
                        }
                        if(elements[index].eType==ElementType.AIR){
                            holderClaim.numAir=holderClaim.numAir+1;
                            nElement[2]++;
                        }
                        if(elements[index].eType==ElementType.WATER){
                            holderClaim.numWater=holderClaim.numWater+1;
                            nElement[3]++;
                        }
                        if(elements[index].eType==ElementType.LIGHT){
                            holderClaim.numLight=holderClaim.numLight+1;
                            nElement[4]++;
                        }
                        cells[n - 1] = uint8(elements[index].eType);
                        break;
                    }
                }
            }
        }
        //store
        holderClaim.level=holderClaim.level+1;
        LandClaimTable.set(nftId,holderClaim);

        //initial claim
        TokenClaimTable.set(holder,block.timestamp);
        //fire event
        CellEventTable.emitEphemeral(bytes32(uint256(uint160(holder))), nftId, holder, nElement[0], nElement[1], nElement[2], nElement[3], nElement[4]);

        return cells;
    }
    
    function getMin(Item[] memory _items, uint8 index) internal pure returns (uint16) {
        uint16 min = 0;
        for (uint8 i = 0; i < index; i++) {
            min = min + _items[i].numLockCell;
        }
        return min;
    }

    function getRandomNumber(uint16 maxRandom, uint64 min, uint8 number) internal view returns (uint16 result) {
        uint256 reduceNumber = ((block.timestamp) % 100) % block.number;
        uint256 genNum = uint256(
            keccak256(
                abi.encodePacked((block.timestamp % 100000) * number, number, blockhash(block.number - reduceNumber))
            )
        );
        result = uint16((genNum % (maxRandom - min + 1)) + min);
    }
}
