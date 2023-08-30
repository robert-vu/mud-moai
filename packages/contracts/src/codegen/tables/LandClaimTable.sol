// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16(""), bytes16("LandClaimTable")));
bytes32 constant LandClaimTableTableId = _tableId;

struct LandClaimTableData {
  uint16 numFire;
  uint16 numEarth;
  uint16 numAir;
  uint16 numWater;
  uint16 numLight;
  uint8 distributionRate;
  uint16 level;
}

library LandClaimTable {
  /** Get the table's key schema */
  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.UINT256;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's value schema */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](7);
    _schema[0] = SchemaType.UINT16;
    _schema[1] = SchemaType.UINT16;
    _schema[2] = SchemaType.UINT16;
    _schema[3] = SchemaType.UINT16;
    _schema[4] = SchemaType.UINT16;
    _schema[5] = SchemaType.UINT8;
    _schema[6] = SchemaType.UINT16;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's key names */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](1);
    keyNames[0] = "nftId";
  }

  /** Get the table's field names */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](7);
    fieldNames[0] = "numFire";
    fieldNames[1] = "numEarth";
    fieldNames[2] = "numAir";
    fieldNames[3] = "numWater";
    fieldNames[4] = "numLight";
    fieldNames[5] = "distributionRate";
    fieldNames[6] = "level";
  }

  /** Register the table's key schema, value schema, key names and value names */
  function register() internal {
    StoreSwitch.registerTable(_tableId, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /** Register the table's key schema, value schema, key names and value names (using the specified store) */
  function register(IStore _store) internal {
    _store.registerTable(_tableId, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /** Get numFire */
  function getNumFire(uint256 nftId) internal view returns (uint16 numFire) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(nftId));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0, getValueSchema());
    return (uint16(Bytes.slice2(_blob, 0)));
  }

  /** Get numFire (using the specified store) */
  function getNumFire(IStore _store, uint256 nftId) internal view returns (uint16 numFire) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(nftId));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0, getValueSchema());
    return (uint16(Bytes.slice2(_blob, 0)));
  }

  /** Set numFire */
  function setNumFire(uint256 nftId, uint16 numFire) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(nftId));

    StoreSwitch.setField(_tableId, _keyTuple, 0, abi.encodePacked((numFire)), getValueSchema());
  }

  /** Set numFire (using the specified store) */
  function setNumFire(IStore _store, uint256 nftId, uint16 numFire) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(nftId));

    _store.setField(_tableId, _keyTuple, 0, abi.encodePacked((numFire)), getValueSchema());
  }

  /** Get numEarth */
  function getNumEarth(uint256 nftId) internal view returns (uint16 numEarth) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(nftId));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 1, getValueSchema());
    return (uint16(Bytes.slice2(_blob, 0)));
  }

  /** Get numEarth (using the specified store) */
  function getNumEarth(IStore _store, uint256 nftId) internal view returns (uint16 numEarth) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(nftId));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 1, getValueSchema());
    return (uint16(Bytes.slice2(_blob, 0)));
  }

  /** Set numEarth */
  function setNumEarth(uint256 nftId, uint16 numEarth) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(nftId));

    StoreSwitch.setField(_tableId, _keyTuple, 1, abi.encodePacked((numEarth)), getValueSchema());
  }

  /** Set numEarth (using the specified store) */
  function setNumEarth(IStore _store, uint256 nftId, uint16 numEarth) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(nftId));

    _store.setField(_tableId, _keyTuple, 1, abi.encodePacked((numEarth)), getValueSchema());
  }

  /** Get numAir */
  function getNumAir(uint256 nftId) internal view returns (uint16 numAir) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(nftId));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 2, getValueSchema());
    return (uint16(Bytes.slice2(_blob, 0)));
  }

  /** Get numAir (using the specified store) */
  function getNumAir(IStore _store, uint256 nftId) internal view returns (uint16 numAir) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(nftId));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 2, getValueSchema());
    return (uint16(Bytes.slice2(_blob, 0)));
  }

  /** Set numAir */
  function setNumAir(uint256 nftId, uint16 numAir) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(nftId));

    StoreSwitch.setField(_tableId, _keyTuple, 2, abi.encodePacked((numAir)), getValueSchema());
  }

  /** Set numAir (using the specified store) */
  function setNumAir(IStore _store, uint256 nftId, uint16 numAir) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(nftId));

    _store.setField(_tableId, _keyTuple, 2, abi.encodePacked((numAir)), getValueSchema());
  }

  /** Get numWater */
  function getNumWater(uint256 nftId) internal view returns (uint16 numWater) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(nftId));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 3, getValueSchema());
    return (uint16(Bytes.slice2(_blob, 0)));
  }

  /** Get numWater (using the specified store) */
  function getNumWater(IStore _store, uint256 nftId) internal view returns (uint16 numWater) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(nftId));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 3, getValueSchema());
    return (uint16(Bytes.slice2(_blob, 0)));
  }

  /** Set numWater */
  function setNumWater(uint256 nftId, uint16 numWater) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(nftId));

    StoreSwitch.setField(_tableId, _keyTuple, 3, abi.encodePacked((numWater)), getValueSchema());
  }

  /** Set numWater (using the specified store) */
  function setNumWater(IStore _store, uint256 nftId, uint16 numWater) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(nftId));

    _store.setField(_tableId, _keyTuple, 3, abi.encodePacked((numWater)), getValueSchema());
  }

  /** Get numLight */
  function getNumLight(uint256 nftId) internal view returns (uint16 numLight) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(nftId));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 4, getValueSchema());
    return (uint16(Bytes.slice2(_blob, 0)));
  }

  /** Get numLight (using the specified store) */
  function getNumLight(IStore _store, uint256 nftId) internal view returns (uint16 numLight) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(nftId));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 4, getValueSchema());
    return (uint16(Bytes.slice2(_blob, 0)));
  }

  /** Set numLight */
  function setNumLight(uint256 nftId, uint16 numLight) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(nftId));

    StoreSwitch.setField(_tableId, _keyTuple, 4, abi.encodePacked((numLight)), getValueSchema());
  }

  /** Set numLight (using the specified store) */
  function setNumLight(IStore _store, uint256 nftId, uint16 numLight) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(nftId));

    _store.setField(_tableId, _keyTuple, 4, abi.encodePacked((numLight)), getValueSchema());
  }

  /** Get distributionRate */
  function getDistributionRate(uint256 nftId) internal view returns (uint8 distributionRate) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(nftId));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 5, getValueSchema());
    return (uint8(Bytes.slice1(_blob, 0)));
  }

  /** Get distributionRate (using the specified store) */
  function getDistributionRate(IStore _store, uint256 nftId) internal view returns (uint8 distributionRate) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(nftId));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 5, getValueSchema());
    return (uint8(Bytes.slice1(_blob, 0)));
  }

  /** Set distributionRate */
  function setDistributionRate(uint256 nftId, uint8 distributionRate) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(nftId));

    StoreSwitch.setField(_tableId, _keyTuple, 5, abi.encodePacked((distributionRate)), getValueSchema());
  }

  /** Set distributionRate (using the specified store) */
  function setDistributionRate(IStore _store, uint256 nftId, uint8 distributionRate) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(nftId));

    _store.setField(_tableId, _keyTuple, 5, abi.encodePacked((distributionRate)), getValueSchema());
  }

  /** Get level */
  function getLevel(uint256 nftId) internal view returns (uint16 level) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(nftId));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 6, getValueSchema());
    return (uint16(Bytes.slice2(_blob, 0)));
  }

  /** Get level (using the specified store) */
  function getLevel(IStore _store, uint256 nftId) internal view returns (uint16 level) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(nftId));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 6, getValueSchema());
    return (uint16(Bytes.slice2(_blob, 0)));
  }

  /** Set level */
  function setLevel(uint256 nftId, uint16 level) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(nftId));

    StoreSwitch.setField(_tableId, _keyTuple, 6, abi.encodePacked((level)), getValueSchema());
  }

  /** Set level (using the specified store) */
  function setLevel(IStore _store, uint256 nftId, uint16 level) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(nftId));

    _store.setField(_tableId, _keyTuple, 6, abi.encodePacked((level)), getValueSchema());
  }

  /** Get the full data */
  function get(uint256 nftId) internal view returns (LandClaimTableData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(nftId));

    bytes memory _blob = StoreSwitch.getRecord(_tableId, _keyTuple, getValueSchema());
    return decode(_blob);
  }

  /** Get the full data (using the specified store) */
  function get(IStore _store, uint256 nftId) internal view returns (LandClaimTableData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(nftId));

    bytes memory _blob = _store.getRecord(_tableId, _keyTuple, getValueSchema());
    return decode(_blob);
  }

  /** Set the full data using individual values */
  function set(
    uint256 nftId,
    uint16 numFire,
    uint16 numEarth,
    uint16 numAir,
    uint16 numWater,
    uint16 numLight,
    uint8 distributionRate,
    uint16 level
  ) internal {
    bytes memory _data = encode(numFire, numEarth, numAir, numWater, numLight, distributionRate, level);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(nftId));

    StoreSwitch.setRecord(_tableId, _keyTuple, _data, getValueSchema());
  }

  /** Set the full data using individual values (using the specified store) */
  function set(
    IStore _store,
    uint256 nftId,
    uint16 numFire,
    uint16 numEarth,
    uint16 numAir,
    uint16 numWater,
    uint16 numLight,
    uint8 distributionRate,
    uint16 level
  ) internal {
    bytes memory _data = encode(numFire, numEarth, numAir, numWater, numLight, distributionRate, level);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(nftId));

    _store.setRecord(_tableId, _keyTuple, _data, getValueSchema());
  }

  /** Set the full data using the data struct */
  function set(uint256 nftId, LandClaimTableData memory _table) internal {
    set(
      nftId,
      _table.numFire,
      _table.numEarth,
      _table.numAir,
      _table.numWater,
      _table.numLight,
      _table.distributionRate,
      _table.level
    );
  }

  /** Set the full data using the data struct (using the specified store) */
  function set(IStore _store, uint256 nftId, LandClaimTableData memory _table) internal {
    set(
      _store,
      nftId,
      _table.numFire,
      _table.numEarth,
      _table.numAir,
      _table.numWater,
      _table.numLight,
      _table.distributionRate,
      _table.level
    );
  }

  /** Decode the tightly packed blob using this table's schema */
  function decode(bytes memory _blob) internal pure returns (LandClaimTableData memory _table) {
    _table.numFire = (uint16(Bytes.slice2(_blob, 0)));

    _table.numEarth = (uint16(Bytes.slice2(_blob, 2)));

    _table.numAir = (uint16(Bytes.slice2(_blob, 4)));

    _table.numWater = (uint16(Bytes.slice2(_blob, 6)));

    _table.numLight = (uint16(Bytes.slice2(_blob, 8)));

    _table.distributionRate = (uint8(Bytes.slice1(_blob, 10)));

    _table.level = (uint16(Bytes.slice2(_blob, 11)));
  }

  /** Tightly pack full data using this table's schema */
  function encode(
    uint16 numFire,
    uint16 numEarth,
    uint16 numAir,
    uint16 numWater,
    uint16 numLight,
    uint8 distributionRate,
    uint16 level
  ) internal pure returns (bytes memory) {
    return abi.encodePacked(numFire, numEarth, numAir, numWater, numLight, distributionRate, level);
  }

  /** Encode keys as a bytes32 array using this table's schema */
  function encodeKeyTuple(uint256 nftId) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(nftId));

    return _keyTuple;
  }

  /* Delete all data for given keys */
  function deleteRecord(uint256 nftId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(nftId));

    StoreSwitch.deleteRecord(_tableId, _keyTuple, getValueSchema());
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, uint256 nftId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(nftId));

    _store.deleteRecord(_tableId, _keyTuple, getValueSchema());
  }
}
