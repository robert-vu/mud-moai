import { mudConfig } from "@latticexyz/world/register";

export default mudConfig({
  tables: {
    Counter: {
      tableIdArgument: true,
      keySchema: {},
      schema: "uint32",
    },
    ERC20Balance: {
      tableIdArgument: true,
      keySchema: {
        owner: "address"
      },
      schema: {
        amount: "uint256"
      }
    },
    ERC20Allowance: {
      tableIdArgument: true,
      keySchema: {
        owner: "address",
        spender: "address",
      },
      schema: {
        amount: "uint256"
      }
    },
    //using for test with MOAI nft
    // using craff item
    MoaiAttributeTable: {
      keySchema: {
        tokenId: "uint256",
      },
      schema: {
        moaiType: "ElementType"
      },
    },
    // using craff item
    ERC721BalanceTable: {
      tableIdArgument: true,
      keySchema: { owner: "address" },
      schema: {
        amount: "uint256"
      },
    },
    //using for both balance and approval
    ERC721OwnerTable: {
      tableIdArgument: true,
      keySchema: { token: "uint256" },
      schema: { owner: "address" },
    },
    ERC721AprovalAllTable: {
      tableIdArgument: true,
      keySchema: {
        owner: "address",
        spender: "address",
      },
      schema: {
        approval: "bool"
      }
    },
    // config for each cell type: Fire,Earth,Air,Water,Light
    ElementConfigTable: {
      keySchema: {
        name: "ElementType" // type of element-> must be : Fire,Earth,Air,Water,Light
      },
      schema: {
        mintRate: "uint256",// mint rate each hours: 1/6570
        maxSupply: "uint16",// max supply of token: 6570
        maxFire: "uint16",// max Fire cell allowance
        maxEarth: "uint16",// max Earth cell allowance
        maxAir: "uint16",// max Air cell allowance
        maxWater: "uint16",// max Wate cell allowance
        maxLight: "uint16",// max Light cell allowance
      },
    },
    LandClaimTable: {
      keySchema: {
        nftId: "uint256" // nft id
      },
      schema: {
        numFire: "uint16",// number of Fire unlock cell
        numEarth: "uint16",// number of Earch unlock cell
        numAir: "uint16",// number of  Air unlock cell
        numWater: "uint16",// number of Water unlock cell
        numLight: "uint16",// number of Light unlock cell
        distributionRate: "uint8",//i.e : 90% for holder,10% for dev
        //moaiNFTId: "uint256[]",// array id of Wicked NFT
        level: "uint16" // number of Moai NFT has claim
      }
    },
    TokenClaimTable: {
      keySchema: {
        owner: "address" // address of nft holder or dev
      },
      schema: {
        lastClaim: "uint256",// last time which holder or dev has claim
      }
    },
    // using with both owner of cells and renter's cell
    CellsOwnerTable: {
      tableIdArgument: true,
      keySchema: {
        owner: "address", // address of dev
      },
      schema: {
        cellIds: "uint256[]" // id of cell
      }
    },
    CellsTable: {
      keySchema: {
        cellId: "uint256",// id of cell
      },
      schema: {
        x: "uint16",// x axis
        y: "uint16",// y axis
        cType: "ElementType",
        isRented: "bool", // rented by dev,inital is empty address
        startAt: "uint256",
        endAt: "uint256"
      }
    },
    //using for raise event
    CellEventTable: {
      schema: {
        moaiNftId: "uint256",
        holder: "address",
        numFire: "uint16",// number of Fire unlock cell
        numEarth: "uint16",// number of Earch unlock cell
        numAir: "uint16",// number of  Air unlock cell
        numWater: "uint16",// number of Water unlock cell
        numLight: "uint16",// number of Light unlock cell
      },
      ephemeral: true,
    }
  },
  enums: {
    ElementType: ["NONE", "FIRE", "EARTH", "AIR", "WATER", "LIGHT"]
  }
});
