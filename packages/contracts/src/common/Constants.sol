// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

bytes32 constant TABLE_MOAI_NFT_ID = bytes32(abi.encodePacked(bytes16(""), bytes16("MoaiNft")));
bytes32 constant TABLE_MOAI_NFT_APPROVAL_ID = bytes32(abi.encodePacked(bytes16(""), bytes16("MoaiNftApproval")));

bytes32 constant TABLE_TOKEN_FIRE_ID = bytes32(abi.encodePacked(bytes16(""), bytes16("MoaiTokenFire")));
bytes32 constant TABLE_TOKEN_FIRE_ALLOWANCE_ID = bytes32(abi.encodePacked(bytes16(""), bytes16("FireAllowance")));
bytes32 constant TABLE_TOKEN_EARTH_ID = bytes32(abi.encodePacked(bytes16(""), bytes16("MoaiTokenEarth")));
bytes32 constant TABLE_TOKEN_AIR_ID = bytes32(abi.encodePacked(bytes16(""), bytes16("MoaiTokenAir")));
bytes32 constant TABLE_TOKEN_WATER_ID = bytes32(abi.encodePacked(bytes16(""), bytes16("MoaiTokenWater")));
bytes32 constant TABLE_TOKEN_LIGHT_ID = bytes32(abi.encodePacked(bytes16(""), bytes16("MoaiTokenLight")));

bytes32 constant TABLE_CELL_COUNTER_ID = bytes32(abi.encodePacked(bytes16(""), bytes16("CellsId")));
bytes32 constant TABLE_CELL_OWNER_ID = bytes32(abi.encodePacked(bytes16(""), bytes16("CellsOwnerId")));
bytes32 constant TABLE_CELL_RENTER_ID = bytes32(abi.encodePacked(bytes16(""), bytes16("CellsRenterId")));
