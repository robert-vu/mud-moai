// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;
import { System } from "@latticexyz/world/src/System.sol";
import { ERC721BalanceTable } from "../codegen/tables/ERC721BalanceTable.sol";
import { ERC721OwnerTable } from "../codegen/tables/ERC721OwnerTable.sol";
import { ERC721AprovalAllTable } from "../codegen/tables/ERC721AprovalAllTable.sol";
import {
  TABLE_MOAI_NFT_ID,
  TABLE_MOAI_NFT_APPROVAL_ID
} from "../common/Constants.sol";
 
contract NftSystem is System {

  event Transfer(address from,address to, uint256 tokenId);

  function transferFrom(address from, address to,uint token) public {

    require(to != address(0), "transfer to zero address");
    address _from = ERC721OwnerTable.get(TABLE_MOAI_NFT_ID,token);
    require(from == _from, "from != owner");
    
    require(_isApprovedOrOwner(from, msg.sender, token), "not authorized");

    ERC721BalanceTable.set(TABLE_MOAI_NFT_ID,from, ERC721BalanceTable.get(TABLE_MOAI_NFT_ID,from) - 1);
    ERC721BalanceTable.set(TABLE_MOAI_NFT_ID,to, ERC721BalanceTable.get(TABLE_MOAI_NFT_ID,to) + 1);
    ERC721OwnerTable.set(TABLE_MOAI_NFT_ID,token, to);
    emit Transfer(from, to, token);
  }
  function _isApprovedOrOwner(
        address owner,
        address spender,
        uint id
    ) internal view returns (bool) {
        //get owner
        address _approvalSpender=ERC721OwnerTable.get(TABLE_MOAI_NFT_APPROVAL_ID,id);
        bool _approvalAll=ERC721AprovalAllTable.get(TABLE_MOAI_NFT_APPROVAL_ID, owner,spender);
        return (spender == owner ||
            _approvalAll ||
            spender == _approvalSpender);
    }

}