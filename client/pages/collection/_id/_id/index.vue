<template>
  <div id="container">
    <div id="kek">
      <div
        class="u-align-center u-container-style u-custom-color-7 u-dialog u-radius-10 u-shape-round u-dialog-b1"
      >
        <div class="u-container-layout u-container-layout-b1">
          <h6
            class="u-custom-font u-font-ubuntu u-text u-text-default u-text-white u-text-b1"
          >
            Buy nft
          </h6>
          <h5
            class="u-custom-font u-font-ubuntu u-text u-text-grey-40 u-text-b2"
          >
            Select a chain in which you want to buy and receive the NFT
          </h5>
          <a
            @click="selectChainF"
            class="u-border-2 u-border-custom-color-3 u-border-hover-grey-40 u-btn u-btn-round u-button-style u-none u-radius-10 u-text-custom-color-3 u-text-hover-grey-40 u-btn-b1"
            >fuji</a
          >
          <a
            @click="selectChainM"
            class="u-border-2 u-border-grey-40 u-border-hover-custom-color-3 u-btn u-btn-round u-button-style u-none u-radius-10 u-text-grey-40 u-text-hover-custom-color-3 u-btn-b2"
            >mumbai</a
          >
          <h6 class="u-custom-font u-font-ubuntu u-text u-text-b3">
            Price: $292
          </h6>
          <a
            href="https://nicepage.com/templates"
            class="u-border-2 u-border-custom-color-3 u-border-hover-palette-2-light-2 u-btn u-btn-round u-button-style u-none u-radius-10 u-text-custom-color-3 u-text-hover-palette-2-light-2 u-btn-b3"
            >Buy</a
          >
        </div>
        <button
          @click="closeBuy"
          class="u-dialog-close-button u-icon u-text-grey-50 u-icon-b1"
        >
          <svg
            class="u-svg-link"
            preserveAspectRatio="xMidYMin slice"
            viewBox="0 0 413.348 413.348"
            style=""
          >
            <use
              xmlns:xlink="http://www.w3.org/1999/xlink"
              xlink:href="#svg-5801"
            ></use></svg
          ><svg
            xmlns="http://www.w3.org/2000/svg"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            version="1.1"
            xml:space="preserve"
            class="u-svg-content"
            viewBox="0 0 413.348 413.348"
            id="svg-5801"
          >
            <path
              d="m413.348 24.354-24.354-24.354-182.32 182.32-182.32-182.32-24.354 24.354 182.32 182.32-182.32 182.32 24.354 24.354 182.32-182.32 182.32 182.32 24.354-24.354-182.32-182.32z"
            ></path>
          </svg>
        </button>
      </div>
    </div>

    <div id="kek1">
      <div
        class="u-align-center u-container-style u-radius-10 u-custom-color-7 u-dialog u-dialog-s1"
      >
        <div class="u-container-layout u-valign-top u-container-layout-s1">
          <h6 class="u-text u-text-s1">List for sale</h6>
          <div class="u-form u-form-s1">
            <form
              action="#"
              method="POST"
              class="u-clearfix u-form-spacing-10 u-form-vertical u-inner-form"
              source="custom"
              name="form"
              style="padding: 10px"
            >
              <div class="u-form-group u-form-name">
                <label
                  for="name-df7c"
                  class="u-custom-font u-font-ubuntu u-form-control-hidden u-label"
                ></label>
                <input
                  type="text"
                  placeholder="Type price in $"
                  id="name-df7c"
                  name="name"
                  class="u-custom-font u-font-ubuntu u-grey-40 u-input u-input-rectangle u-radius-10"
                  required=""
                />
              </div>
            </form>
          </div>
          <a
            href="https://nicepage.com/k/hacker-website-templates"
            class="u-border-2 u-border-custom-color-3 u-border-hover-palette-2-light-2 u-btn u-btn-round u-button-style u-custom-font u-font-ubuntu u-none u-radius-10 u-text-custom-color-3 u-text-hover-palette-2-light-2 u-btn-s2"
            >List</a
          >
        </div>
        <button
          @click="close"
          class="u-dialog-close-button u-icon u-text-grey-50 u-icon-s1"
        >
          <svg
            class="u-svg-link"
            preserveAspectRatio="xMidYMin slice"
            viewBox="0 0 413.348 413.348"
            style=""
          >
            <use
              xmlns:xlink="http://www.w3.org/1999/xlink"
              xlink:href="#svg-5801"
            ></use></svg
          ><svg
            xmlns="http://www.w3.org/2000/svg"
            xmlns:xlink="http://www.w3.org/1999/xlink"
            version="1.1"
            xml:space="preserve"
            class="u-svg-content"
            viewBox="0 0 413.348 413.348"
            id="svg-5801"
          >
            <path
              d="m413.348 24.354-24.354-24.354-182.32 182.32-182.32-182.32-24.354 24.354 182.32 182.32-182.32 182.32 24.354 24.354 182.32-182.32 182.32 182.32 24.354-24.354-182.32-182.32z"
            ></path>
          </svg>
        </button>
      </div>
    </div>
    <body class="u-body">
      <Header />
      <section class="u-clearfix u-custom-color-7 u-section-1" id="sec-f1d1">
        <div
          class="u-clearfix u-sheet u-valign-middle-lg u-valign-middle-md u-valign-middle-xl u-sheet-1"
        >
          <div
            class="u-clearfix u-expanded-width u-layout-wrap u-layout-wrap-1"
          >
            <div class="u-layout">
              <div class="u-layout-row">
                <div
                  class="u-container-style u-layout-cell u-size-31-md u-size-31-sm u-size-31-xs u-size-35-lg u-size-35-xl u-layout-cell-1"
                >
                  <div class="u-container-layout u-container-layout-1">
                    <img
                      class="u-expanded-width-lg u-expanded-width-sm u-expanded-width-xs u-image u-image-round u-radius-10 u-image-1"
                      :src="image"
                      alt=""
                      data-image-width="984"
                      data-image-height="964"
                    />
                  </div>
                </div>
                <div
                  class="u-container-style u-layout-cell u-radius-10 u-shape-round u-size-25-lg u-size-25-xl u-size-29-md u-size-29-sm u-size-29-xs u-layout-cell-2"
                >
                  <div
                    class="u-border-1 u-border-grey-80 u-container-layout u-valign-bottom-xl u-container-layout-2"
                  >
                    <div class="u-container-style u-group u-group-1">
                      <div class="u-container-layout">
                        <p
                          class="u-custom-font u-font-ubuntu u-text u-text-grey-40 u-text-1"
                        >
                          {{ nft.chain_id }}
                        </p>
                        <p class="u-custom-font u-font-ubuntu u-text u-text-2">
                          {{ collection.name + " " + nft.token_id }}
                        </p>
                      </div>
                    </div>
                    <div class="u-container-style u-group u-group-2">
                      <div class="u-container-layout">
                        <p
                          class="u-custom-font u-font-ubuntu u-text u-text-grey-40 u-text-3"
                        >
                          Owner
                        </p>
                        <p class="u-custom-font u-font-ubuntu u-text u-text-4">
                          {{ nft.owner }}
                        </p>
                      </div>
                    </div>
                    <div class="u-container-style u-group u-group-3">
                      <div class="u-container-layout">
                        <p
                          class="u-custom-font u-font-ubuntu u-text u-text-grey-40 u-text-5"
                        >
                          Description
                        </p>
                        <p class="u-custom-font u-font-ubuntu u-text u-text-6">
                          {{ collection.desc }}
                        </p>
                      </div>
                    </div>
                    <div class="u-container-style u-group u-group-4">
                      <div class="u-container-layout">
                        <p
                          class="u-custom-font u-font-ubuntu u-text u-text-grey-40 u-text-7"
                        >
                          Price
                        </p>
                        <p class="u-custom-font u-font-ubuntu u-text u-text-8">
                          {{ price }}
                        </p>
                      </div>
                    </div>
                    <a
                      v-if="state == 'ownerList'"
                      @click="list"
                      class="u-border-2 u-border-custom-color-3 u-border-hover-palette-2-light-1 u-btn u-btn-round u-button-style u-custom-font u-dialog-link u-font-ubuntu u-none u-radius-10 u-text-custom-color-3 u-text-hover-palette-2-light-1 u-btn-1"
                      >List now</a
                    >
                    <a
                      v-if="state == 'buyer'"
                      @click="buy"
                      class="u-border-2 u-border-custom-color-3 u-border-hover-palette-2-light-1 u-btn u-btn-round u-button-style u-custom-font u-dialog-link u-font-ubuntu u-none u-radius-10 u-text-custom-color-3 u-text-hover-palette-2-light-1 u-btn-1"
                      >Buy now</a
                    >
                    <a
                      v-if="state == 'ownerCancel'"
                      @click="cancel"
                      class="u-border-2 u-border-custom-color-3 u-border-hover-palette-2-light-1 u-btn u-btn-round u-button-style u-custom-font u-dialog-link u-font-ubuntu u-none u-radius-10 u-text-custom-color-3 u-text-hover-palette-2-light-1 u-btn-1"
                      >Cancel</a
                    >
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <section class="u-clearfix u-custom-color-7 u-section-2" id="sec-0086">
        <div class="u-align-left u-clearfix u-sheet u-sheet-1">
          <div
            class="u-border-1 u-border-grey-80 u-container-style u-expanded-width u-group u-radius-10 u-shape-round u-group-1"
          >
            <div class="u-container-layout u-container-layout-1">
              <p class="u-custom-font u-font-ubuntu u-text u-text-1">
                Properties
              </p>
              <div class="u-container-style u-expanded-width u-group u-group-2">
                <div class="u-container-layout">
                  <p
                    class="u-custom-font u-font-ubuntu u-text u-text-grey-40 u-text-2"
                  >
                    Name
                  </p>
                  <p
                    class="u-custom-font u-font-ubuntu u-text u-text-grey-40 u-text-3"
                  >
                    Rarity
                  </p>
                </div>
              </div>
              <div
                v-for="item in nft.properties"
                :key="item.trait_name"
                class="u-container-style u-expanded-width u-group u-group-3"
              >
                <div class="u-container-layout">
                  <p
                    class="u-custom-font u-font-ubuntu u-text u-text-grey-40 u-text-4"
                  >
                    {{ item.trait_type }}
                  </p>
                  <p
                    class="u-custom-font u-font-ubuntu u-text u-text-white u-text-5"
                  >
                    {{ item.value }}
                  </p>
                  <p
                    class="u-custom-font u-font-ubuntu u-text u-text-white u-text-6"
                  >
                    No Data
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <section
        class="u-clearfix u-custom-color-7 u-section-3"
        id="carousel_53d0"
      >
        <div class="u-align-left u-clearfix u-sheet u-sheet-1">
          <div
            class="u-border-1 u-border-grey-80 u-container-style u-expanded-width u-group u-radius-10 u-shape-round u-group-1"
          >
            <div class="u-container-layout u-container-layout-1">
              <p class="u-custom-font u-font-ubuntu u-text u-text-1">
                Activity
              </p>
              <div class="u-container-style u-expanded-width u-group u-group-2">
                <div class="u-container-layout">
                  <p
                    class="u-custom-font u-font-ubuntu u-text u-text-grey-40 u-text-2"
                  >
                    Activity
                  </p>
                  <p
                    class="u-custom-font u-font-ubuntu u-text u-text-grey-40 u-text-3"
                  >
                    Price
                  </p>
                </div>
              </div>
              <div
                v-for="item in nft['history']"
                :key="item"
                class="u-container-style u-expanded-width u-group u-group-3"
              >
                <div class="u-container-layout">
                  <p
                    class="u-custom-font u-font-ubuntu u-text u-text-grey-40 u-text-4"
                  >
                    {{ item.activity + item.address }}
                  </p>
                  <p
                    class="u-custom-font u-font-ubuntu u-text u-text-white u-text-5"
                  >
                    {{ item.date }}
                  </p>
                  <p
                    class="u-custom-font u-font-ubuntu u-text u-text-white u-text-6"
                  >
                    {{ item.price }}
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <Footer />
    </body>
  </div>
</template>

<script>
import Web3 from "web3";
import axios from "axios";

const FujiRPC = "https://avalanche-fuji-c-chain.publicnode.com";
const MumbaiRPC = "https://rpc-mumbai.maticvigil.com";

const web3F = new Web3(FujiRPC);
var web3M = new Web3(MumbaiRPC);

const marketABI = require("../../../../abis/market.json");

const xercABI = require("../../../../abis/xerc.json");

export default {
  name: "nft",
  data() {
    return {
      state: "",
      nftId: null,
      price: "",
      image: "../../../../static/images/Screenshot2023-06-16at11.36.40PM.png",
      chainId: null,
      collection: {
        name: "Loading",
      },
      collectionAddress: null,
      contractAddress: null,
      collections: null,
      backendURL: "https://route-nft-server900.ru/",
      nft: {
        collectionName: "loading",
        nftName: "loading",
        owner: "loading",
        desc: "loading",
        price: "loading",
        properties: [
          {
            propertyName: "loading",
            propertyValue: "loading",
            rarity: "loading",
          },
        ],
        history: [
          {
            activity: "loading",
            price: "loading",
            date: "loading",
            address: "loading",
          },
        ],
      },
    };
  },
  async created() {
    try {
      const fullUrl = new URL(window.location.href);
      const pathParts = fullUrl.pathname.split("/").filter((part) => part);

      const collectionId = pathParts[1];
      const nftId = pathParts[2];

      this.collectionId = collectionId;
      this.nftId = nftId;

      this.chainId = fullUrl.hash.substring(1);
      await this.loadNft();
      await this.getListing();
      console.log(this.state);
      if (this.state == "buyer") {
      } else if (this.state == "ownerList") {
      } else if (this.state == "ownerCancel") {
      }
    } catch (err) {
      console.log(err);
    }
  },
  methods: {
    selectChainF() {
      this.selectChain("f");
    },
    selectChainM() {
      this.selectChain("m");
    },
    async selectChain(chain) {
      var contractInstance = null;

      var data = await this.getListing();
      console.log(data);

      var chainsId = [];
      var priceOnChains = [];
      for (let price of data[0].prices) {
        chainsId.push(price.chain_id);
        priceOnChains.push(price.price);
      }

      if (chain == "m") {
        web3M = new Web3(window.ethereum);
        contractInstance = new web3M.eth.Contract(
          marketABI,
          web3M.utils.toChecksumAddress(
            "0x031D0924e62e0C62d38fbC34c2caB201a10E398B"
          )
        );
        // const accounts = await web3M.eth.getAccounts();
        // console.log(accounts)
        var data = [
          "80001",
          data[0].owner,
          data[0].collection_address,
          data[0].token_id,
          data[0].nonce,
          chainsId,
          priceOnChains,
        ];

        await contractInstance.methods.buyNft(data, "0x").send({
          from: window.ethereum.selectedAddress,
          value: priceOnChains[0], // Доделать chain id поиск цены
        });
      } else {
        contractInstance = new web3F.eth.Contract(
          marketABI,
          web3F.utils.toChecksumAddress(
            "0xA6D2D477a6d5342315b75C9112e5eeefc8973171"
          )
        );

        var data = [
          "41143",
          data[0].owner,
          data[0].collection_address,
          data[0].token_id,
          data[0].nonce,
          chainsId,
          priceOnChains,
        ];

        await contractInstance.methods.buyNft(data, "0x").send({
          from: window.ethereum.selectedAddress,
          value: priceOnChains[1], // Доделать chain id поиск цены
        });
      }
    },
    closeBuy() {
      var kek = document.querySelector("#kek");
      kek.style.zIndex = 0;
    },
    close() {
      var kek1 = document.querySelector("#kek1");
      kek1.style.zIndex = 0;
    },
    async cancel() {},
    async buy() {
      var kek = document.querySelector("#kek");
      kek.style.zIndex = 1;
    },
    async list() {
      var kek1 = document.querySelector("#kek1");
      kek1.style.zIndex = 1;

      var jsonBody = {
        chain_id: this.chainId,
        collection_address: this.contractAddress,
        owner: window.ethereum.selectedAddress,
        token_id: this.nftId,
        // signature: "0x",
        pricesOnChains: ["0xaaaa", "0xbbbb"],
        chainsId: ["80001", "43113"],
        prices: [
          {
            chain_id: "80001",
            price: "0xaaaa",
          },
          {
            chain_id: "43113",
            price: "0xbbbb",
          },
        ],
      };

      var nonceBody = {
        chain_id: this.chainId,
        collection_address: this.contractAddress,
        token_id: this.nftId,
      };
      console.log(typeof this.nftId);
      var nonce = await axios.post(this.backendURL + "getNextNonce", nonceBody);
      console.log(nonce.data);

      var data = [
        this.chainId,
        this.contractAddress,
        window.ethereum.selectedAddress,
        this.nftId,
        nonce.data,
        // signature: "0x",
        ["80001", "43113"],
        ["0xaaaa", "0xbbbb"],
      ];

      console.log("data: ", data);
      var web3 = new Web3(window.ethereum);
      //const msg = web3M.utils.sha3(JSON.stringify(data));
      const msg = web3.eth.abi.encodeParameters(
        [
          "string",
          "address",
          "address",
          "uint256",
          "uint256",
          "string[]",
          "uint256[]",
        ],
        data
      );
      console.log("msg: ", msg);
      const hash = web3.utils.keccak256(msg);
      console.log("hash: ", hash);
      const sig = await web3.eth.personal.sign(
        hash,
        window.ethereum.selectedAddress
      );

      jsonBody.signature = sig;
      jsonBody.nonce = nonce.data;
      var response = await axios.post(this.backendURL + "listing", jsonBody);
      console.log(response);
    },
    async getListing() {
      var jsonBody = {
        collection_uuid: this.collectionId,
        token_id: this.nftId,
      };
      var response = await axios.post(
        this.backendURL + "getTokenListing",
        jsonBody
      );
      console.log(response.data[0]);
      if (!response.data[0]) {
        this.state = "ownerList";
        return;
      }

      if (
        !(await this.checkForOwner(
          response.data[0].owner,
          response.data[0].collection_address,
          response.data[0].chain_id
        ))
      ) {
        window.location.href = "/collection/" + this.collectionId;
        return;
      }

      if (
        response.data[0].owner.toLowerCase() ==
        window.ethereum.selectedAddress.toLowerCase()
      ) {
        this.state = "ownerCancel";
      } else {
        this.state = "buyer";
      }
      if (!response.data) {
        this.state = "ownerList";
      }
      return response.data;
    },
    async checkForOwner(owner, address, chainId) {
      var contractInstance = null;

      if (chainId == "80001") {
        contractInstance = new web3M.eth.Contract(
          xercABI,
          web3M.utils.toChecksumAddress(address)
        );
      } else if (chainId == "43113") {
        contractInstance = new web3F.eth.Contract(
          xercABI,
          web3F.utils.toChecksumAddress(address)
        );
      }

      let balance = await contractInstance.methods.balanceOf(owner).call();

      let tokenURI = await contractInstance.methods.tokenURI(this.nftId).call();

      tokenURI = this.normalizeURL(tokenURI);
      var response = await fetch(tokenURI);
      const jsonData = await response.json();
      this.image = this.normalizeURL(jsonData.image);

      if (balance == 0) return false;

      return true;
    },
    normalizeURL(theUrl) {
      let url = theUrl;

      if (theUrl.includes("data:application")) {
        // pass
      } else if (theUrl.includes("ipfs://")) {
        url = theUrl.replace("ipfs://", "https://ipfs.io/ipfs/");
      } else if (theUrl.includes("Qm") && !theUrl.includes("://")) {
        url = `https://ipfs.io/ipfs/${theUrl}`;
      }

      return url;
    },
    async loadNft() {
      var response = await axios.post(this.backendURL + "getCollections");
      this.collections = response.data;
      for (let collection of this.collections) {
        if (collection.uuid == this.collectionId) this.collection = collection;
        for (let contract of collection.contracts) {
          if (this.chainId == contract.chain_id) {
            this.contractAddress = contract.address;
            break;
          }
        }
      }

      var jsonBody = { collectionUuid: this.collectionId };
      var response = await axios.post(
        this.backendURL + "getListedTokens",
        jsonBody
      );
      var nfts = response.data;
      if (!response.data) return;

      for (var nft of nfts) {
        if (nft.token_id == this.nftId) {
          this.nft = nft;
          this.price = this.nft.prices[0].price;
          break;
        }
      }
    },
  },
};
</script>

<style scoped>
#container {
  position: relative;
}
.u-section-1 {
  background-image: none;
}

.u-section-1 .u-sheet-1 {
  min-height: 701px;
}

.u-section-1 .u-layout-wrap-1 {
  margin-top: 27px;
  margin-bottom: 27px;
}

.u-section-1 .u-layout-cell-1 {
  min-height: 647px;
}

.u-section-1 .u-container-layout-1 {
  padding: 26px 30px;
}

.u-section-1 .u-image-1 {
  height: 595px;
  width: 600px;
  margin: 0 0 0 auto;
}

.u-section-1 .u-layout-cell-2 {
  min-height: 647px;
}

.u-section-1 .u-container-layout-2 {
  padding: 30px 20px;
}

.u-section-1 .u-group-1 {
  width: 433px;
  min-height: 73px;
  margin: 0;
}

.u-section-1 .u-text-1 {
  font-weight: 400;
  font-size: 1rem;
  margin: 0;
}

.u-section-1 .u-text-2 {
  font-weight: 700;
  font-size: 1.875rem;
  margin: 0;
}

.u-section-1 .u-group-2 {
  width: 433px;
  min-height: 64px;
  margin: 20px 0 0;
}

.u-section-1 .u-text-3 {
  font-weight: 400;
  font-size: 1rem;
  margin: 0;
}

.u-section-1 .u-text-4 {
  font-weight: 400;
  font-size: 1rem;
  margin: 0;
}

.u-section-1 .u-group-3 {
  width: 433px;
  min-height: 150px;
  margin: 20px 0 0;
}

.u-section-1 .u-text-5 {
  font-weight: 400;
  font-size: 1rem;
  margin: 0;
}

.u-section-1 .u-text-6 {
  font-weight: 400;
  font-size: 1rem;
  margin: 0;
}

.u-section-1 .u-group-4 {
  width: 433px;
  min-height: 66px;
  margin: 39px auto 0;
}

.u-section-1 .u-text-7 {
  font-weight: 400;
  font-size: 1.125rem;
  margin: 0;
}

.u-section-1 .u-text-8 {
  font-weight: 700;
  font-size: 1.5rem;
  margin: 0;
}

.u-section-1 .u-btn-1 {
  border-style: solid;
  letter-spacing: 0px;
  text-transform: uppercase;
  font-weight: 700;
  font-size: 1.25rem;
  margin: 99px auto 0 0;
  padding: 7px 25px 8px;
}

@media (max-width: 1199px) {
  .u-section-1 .u-sheet-1 {
    min-height: 591px;
  }

  .u-section-1 .u-layout-cell-1 {
    min-height: 537px;
  }

  .u-section-1 .u-image-1 {
    height: 479px;
    margin-right: initial;
    margin-left: initial;
    width: auto;
  }

  .u-section-1 .u-layout-cell-2 {
    min-height: 537px;
  }

  .u-section-1 .u-container-layout-2 {
    padding-left: 0;
    padding-right: 0;
  }

  .u-section-1 .u-group-1 {
    width: 350px;
    min-height: 64px;
    margin-left: auto;
    margin-right: auto;
  }

  .u-section-1 .u-text-1 {
    font-size: 0.875rem;
  }

  .u-section-1 .u-text-2 {
    font-size: 1.5rem;
  }

  .u-section-1 .u-group-2 {
    width: 371px;
    min-height: 46px;
    margin-top: 10px;
    margin-right: -1px;
    margin-left: auto;
  }

  .u-section-1 .u-text-3 {
    font-size: 0.875rem;
  }

  .u-section-1 .u-text-4 {
    font-size: 0.875rem;
  }

  .u-section-1 .u-group-3 {
    width: 370px;
    margin-top: 22px;
    margin-left: auto;
  }

  .u-section-1 .u-text-5 {
    font-size: 0.875rem;
  }

  .u-section-1 .u-text-6 {
    font-size: 0.875rem;
    width: auto;
    margin-right: 4px;
  }

  .u-section-1 .u-group-4 {
    width: 364px;
    min-height: 57px;
    margin-top: 18px;
    margin-right: 6px;
  }

  .u-section-1 .u-text-7 {
    font-size: 1rem;
  }

  .u-section-1 .u-text-8 {
    font-size: 1.25rem;
  }

  .u-section-1 .u-btn-1 {
    margin-top: 53px;
    margin-left: 17px;
  }
}

@media (max-width: 991px) {
  .u-section-1 .u-sheet-1 {
    min-height: 498px;
  }

  .u-section-1 .u-layout-cell-1 {
    min-height: 442px;
  }

  .u-section-1 .u-container-layout-1 {
    padding-left: 0;
    padding-right: 0;
  }

  .u-section-1 .u-image-1 {
    height: 340px;
    width: 340px;
    margin-right: auto;
    margin-left: 0;
  }

  .u-section-1 .u-layout-cell-2 {
    min-height: 442px;
  }

  .u-section-1 .u-container-layout-2 {
    padding-left: 15px;
    padding-right: 15px;
    padding-bottom: 25px;
  }

  .u-section-1 .u-group-1 {
    width: 316px;
    min-height: 61px;
    margin-left: 0;
    margin-right: 0;
  }

  .u-section-1 .u-group-2 {
    width: 316px;
    min-height: 42px;
    margin-top: 11px;
    margin-left: 0;
    margin-right: 0;
  }

  .u-section-1 .u-text-3 {
    font-size: 0.75rem;
  }

  .u-section-1 .u-text-4 {
    font-size: 0.625rem;
    width: auto;
    margin-top: 1px;
  }

  .u-section-1 .u-group-3 {
    width: 314px;
    min-height: 99px;
    margin-top: 11px;
    margin-right: auto;
  }

  .u-section-1 .u-text-5 {
    font-size: 0.75rem;
  }

  .u-section-1 .u-text-6 {
    font-size: 0.625rem;
    margin-right: 0;
  }

  .u-section-1 .u-group-4 {
    width: 300px;
    min-height: 51px;
    margin-top: 60px;
    margin-right: auto;
    margin-left: 0;
  }

  .u-section-1 .u-text-7 {
    font-size: 0.875rem;
  }

  .u-section-1 .u-text-8 {
    font-size: 1.125rem;
  }

  .u-section-1 .u-btn-1 {
    font-size: 0.875rem;
    margin-top: 11px;
    margin-left: 0;
  }
}

@media (max-width: 767px) {
  .u-section-1 .u-sheet-1 {
    min-height: 985px;
  }

  .u-section-1 .u-layout-wrap-1 {
    margin-top: 1px;
  }

  .u-section-1 .u-layout-cell-1 {
    min-height: 562px;
  }

  .u-section-1 .u-image-1 {
    height: 510px;
    margin-right: initial;
    margin-left: initial;
    width: auto;
  }

  .u-section-1 .u-layout-cell-2 {
    min-height: 395px;
  }

  .u-section-1 .u-container-layout-2 {
    padding-left: 10px;
    padding-right: 10px;
  }

  .u-section-1 .u-group-2 {
    width: 518px;
    margin-left: auto;
    margin-right: auto;
  }

  .u-section-1 .u-group-3 {
    width: 518px;
  }

  .u-section-1 .u-group-4 {
    margin-top: 11px;
  }
}

@media (max-width: 575px) {
  .u-section-1 .u-sheet-1 {
    min-height: 482px;
  }

  .u-section-1 .u-layout-wrap-1 {
    position: relative;
  }

  .u-section-1 .u-layout-cell-1 {
    min-height: 354px;
  }

  .u-section-1 .u-image-1 {
    height: 321px;
    width: auto;
    margin-right: initial;
    margin-left: initial;
  }

  .u-section-1 .u-layout-cell-2 {
    min-height: 100px;
  }

  .u-section-1 .u-group-1 {
    width: 320px;
  }

  .u-section-1 .u-group-2 {
    width: 320px;
  }

  .u-section-1 .u-group-3 {
    width: 320px;
  }
}
.u-section-2 {
  background-image: none;
}

.u-section-2 .u-sheet-1 {
  min-height: 306px;
}

.u-section-2 .u-group-1 {
  min-height: 266px;
  margin-top: 0;
  margin-bottom: 40px;
}

.u-section-2 .u-container-layout-1 {
  padding: 27px 29px;
}

.u-section-2 .u-text-1 {
  font-size: 1.5rem;
  font-weight: 700;
  margin: 0 1px;
}

.u-section-2 .u-group-2 {
  min-height: 25px;
  margin: 7px 0 0;
}

.u-section-2 .u-text-2 {
  font-weight: 400;
  margin: 0 1037px 0 0;
}

.u-section-2 .u-text-3 {
  font-weight: 400;
  margin: -25px 114px 0 922px;
}

.u-section-2 .u-group-3 {
  min-height: 50px;
  margin: 19px 0 0;
}

.u-section-2 .u-text-4 {
  font-weight: 400;
  font-size: 1rem;
  margin: 0 762px 0 0;
}

.u-section-2 .u-text-5 {
  font-weight: 400;
  font-size: 1rem;
  margin: 0 762px 0 0;
}

.u-section-2 .u-text-6 {
  font-weight: 400;
  font-size: 1rem;
  margin: -41px 0 0 922px;
}

.u-section-2 .u-group-4 {
  min-height: 50px;
  margin: 13px 0 0;
}

.u-section-2 .u-text-7 {
  font-weight: 400;
  font-size: 1rem;
  margin: 0 762px 0 0;
}

.u-section-2 .u-text-8 {
  font-weight: 400;
  font-size: 1rem;
  margin: 0 762px 0 0;
}

.u-section-2 .u-text-9 {
  font-weight: 400;
  font-size: 1rem;
  margin: -41px 0 0 922px;
}

@media (max-width: 1199px) {
  .u-section-2 .u-group-2 {
    margin-right: initial;
    margin-left: initial;
  }

  .u-section-2 .u-text-2 {
    margin-right: 677px;
  }

  .u-section-2 .u-text-3 {
    margin-right: 14px;
    margin-left: 751px;
  }

  .u-section-2 .u-group-3 {
    margin-right: initial;
    margin-left: initial;
  }

  .u-section-2 .u-text-4 {
    margin-right: 677px;
  }

  .u-section-2 .u-text-5 {
    margin-right: 562px;
  }

  .u-section-2 .u-text-6 {
    width: auto;
    margin-right: 25px;
    margin-left: 748px;
  }

  .u-section-2 .u-group-4 {
    margin-right: initial;
    margin-left: initial;
  }

  .u-section-2 .u-text-7 {
    margin-right: 677px;
  }

  .u-section-2 .u-text-8 {
    margin-right: 562px;
  }

  .u-section-2 .u-text-9 {
    width: auto;
    margin-right: 33px;
    margin-left: 749px;
  }
}

@media (max-width: 991px) {
  .u-section-2 .u-text-2 {
    margin-right: 508px;
  }

  .u-section-2 .u-text-3 {
    margin-right: 0;
    margin-left: 564px;
  }

  .u-section-2 .u-text-4 {
    width: auto;
    margin-right: 426px;
  }

  .u-section-2 .u-text-5 {
    margin-right: 342px;
  }

  .u-section-2 .u-text-6 {
    font-size: 0.875rem;
    margin-top: -36px;
    margin-right: 0;
    margin-left: 567px;
  }

  .u-section-2 .u-text-7 {
    width: auto;
    margin-right: 412px;
  }

  .u-section-2 .u-text-8 {
    margin-right: 342px;
  }

  .u-section-2 .u-text-9 {
    font-size: 0.875rem;
    margin-top: -36px;
    margin-right: 0;
    margin-left: 567px;
  }
}

@media (max-width: 767px) {
  .u-section-2 .u-container-layout-1 {
    padding-left: 10px;
    padding-right: 10px;
  }

  .u-section-2 .u-text-2 {
    margin-right: 399px;
  }

  .u-section-2 .u-text-3 {
    margin-left: 443px;
  }

  .u-section-2 .u-group-3 {
    min-height: 44px;
    margin-right: initial;
    margin-left: initial;
  }

  .u-section-2 .u-text-4 {
    font-size: 0.875rem;
    margin-right: 301px;
  }

  .u-section-2 .u-text-5 {
    font-size: 0.875rem;
    margin-right: 200px;
  }

  .u-section-2 .u-text-6 {
    margin-top: -33px;
    margin-left: 442px;
  }

  .u-section-2 .u-text-7 {
    font-size: 0.875rem;
    margin-right: 305px;
  }

  .u-section-2 .u-text-8 {
    font-size: 0.875rem;
    margin-right: 200px;
  }

  .u-section-2 .u-text-9 {
    margin-top: -30px;
    margin-left: 442px;
  }
}

@media (max-width: 575px) {
  .u-section-2 .u-sheet-1 {
    min-height: 240px;
  }

  .u-section-2 .u-group-1 {
    margin-bottom: 15px;
    min-height: 225px;
  }

  .u-section-2 .u-container-layout-1 {
    padding-bottom: 25px;
  }

  .u-section-2 .u-text-2 {
    margin-right: 246px;
  }

  .u-section-2 .u-text-3 {
    width: auto;
    margin-left: 250px;
  }

  .u-section-2 .u-group-3 {
    min-height: 35px;
    margin-right: initial;
    margin-left: initial;
  }

  .u-section-2 .u-text-4 {
    font-size: 0.625rem;
    margin-right: 171px;
  }

  .u-section-2 .u-text-5 {
    font-size: 0.625rem;
    width: auto;
    margin-right: 171px;
  }

  .u-section-2 .u-text-6 {
    font-size: 0.625rem;
    margin-top: -22px;
    margin-left: 250px;
  }

  .u-section-2 .u-group-4 {
    min-height: 33px;
    margin-right: initial;
    margin-left: initial;
  }

  .u-section-2 .u-text-7 {
    font-size: 0.625rem;
    margin-right: 159px;
  }

  .u-section-2 .u-text-8 {
    font-size: 0.625rem;
    width: auto;
    margin-right: 159px;
  }

  .u-section-2 .u-text-9 {
    font-size: 0.625rem;
    margin-top: -23px;
    margin-left: 248px;
  }
}
.u-section-3 {
  background-image: none;
}

.u-section-3 .u-sheet-1 {
  min-height: 306px;
}

.u-section-3 .u-group-1 {
  min-height: 266px;
  margin-top: 0;
  margin-bottom: 40px;
}

.u-section-3 .u-container-layout-1 {
  padding: 27px 29px;
}

.u-section-3 .u-text-1 {
  font-size: 1.5rem;
  font-weight: 700;
  margin: 0 1px;
}

.u-section-3 .u-group-2 {
  min-height: 25px;
  margin: 7px 0 0;
}

.u-section-3 .u-text-2 {
  font-weight: 400;
  margin: 0 654px 0 0;
}

.u-section-3 .u-text-3 {
  font-weight: 400;
  margin: -25px 0 0 922px;
}

.u-section-3 .u-group-3 {
  min-height: 50px;
  margin: 19px 0 0;
}

.u-section-3 .u-text-4 {
  font-weight: 400;
  font-size: 1rem;
  margin: 0 762px 0 0;
}

.u-section-3 .u-text-5 {
  font-weight: 400;
  font-size: 1rem;
  margin: 0 762px 0 0;
}

.u-section-3 .u-text-6 {
  font-weight: 400;
  font-size: 1rem;
  margin: -41px 0 -16px 922px;
}

.u-section-3 .u-group-4 {
  min-height: 50px;
  margin: 13px 0 0;
}

.u-section-3 .u-text-7 {
  font-weight: 400;
  font-size: 1rem;
  margin: 0 762px 0 0;
}

.u-section-3 .u-text-8 {
  font-weight: 400;
  font-size: 1rem;
  margin: 0 762px 0 0;
}

.u-section-3 .u-text-9 {
  font-weight: 400;
  font-size: 1rem;
  margin: -41px 0 0 922px;
}

@media (max-width: 1199px) {
  .u-section-3 .u-group-2 {
    margin-right: initial;
    margin-left: initial;
  }

  .u-section-3 .u-text-2 {
    margin-right: 677px;
  }

  .u-section-3 .u-text-3 {
    margin-left: 751px;
  }

  .u-section-3 .u-group-3 {
    margin-right: initial;
    margin-left: initial;
  }

  .u-section-3 .u-text-4 {
    width: auto;
    margin-right: 458px;
  }

  .u-section-3 .u-text-5 {
    margin-right: 562px;
  }

  .u-section-3 .u-text-6 {
    width: auto;
    margin-right: 13px;
    margin-bottom: 0;
    margin-left: 749px;
  }

  .u-section-3 .u-group-4 {
    margin-right: initial;
    margin-left: initial;
  }

  .u-section-3 .u-text-7 {
    width: auto;
    margin-right: 440px;
  }

  .u-section-3 .u-text-8 {
    margin-right: 562px;
  }

  .u-section-3 .u-text-9 {
    width: auto;
    margin-right: 33px;
    margin-left: 749px;
  }
}

@media (max-width: 991px) {
  .u-section-3 .u-text-2 {
    margin-right: 508px;
  }

  .u-section-3 .u-text-3 {
    margin-left: 564px;
  }

  .u-section-3 .u-text-4 {
    margin-right: 351px;
  }

  .u-section-3 .u-text-5 {
    margin-right: 342px;
  }

  .u-section-3 .u-text-6 {
    font-size: 0.875rem;
    margin-top: -36px;
    margin-right: 0;
    margin-left: 562px;
  }

  .u-section-3 .u-text-7 {
    margin-right: 351px;
  }

  .u-section-3 .u-text-8 {
    margin-right: 342px;
  }

  .u-section-3 .u-text-9 {
    font-size: 0.875rem;
    margin-top: -36px;
    margin-right: 0;
    margin-left: 562px;
  }
}

@media (max-width: 767px) {
  .u-section-3 .u-container-layout-1 {
    padding-left: 10px;
    padding-right: 10px;
  }

  .u-section-3 .u-text-2 {
    margin-right: 399px;
  }

  .u-section-3 .u-text-3 {
    margin-left: 443px;
  }

  .u-section-3 .u-group-3 {
    margin-top: 20px;
    margin-right: initial;
    margin-left: initial;
  }

  .u-section-3 .u-text-4 {
    font-size: 0.875rem;
    margin-right: 241px;
  }

  .u-section-3 .u-text-5 {
    font-size: 0.875rem;
    margin-right: 200px;
  }

  .u-section-3 .u-text-6 {
    margin-top: -30px;
    margin-left: 447px;
  }

  .u-section-3 .u-text-7 {
    font-size: 0.875rem;
    margin-right: 260px;
  }

  .u-section-3 .u-text-8 {
    font-size: 0.875rem;
    margin-right: 200px;
  }

  .u-section-3 .u-text-9 {
    margin-top: -30px;
    margin-left: 447px;
  }
}

@media (max-width: 575px) {
  .u-section-3 .u-sheet-1 {
    min-height: 240px;
  }

  .u-section-3 .u-group-1 {
    margin-bottom: 15px;
    min-height: 225px;
  }

  .u-section-3 .u-text-2 {
    margin-right: 246px;
  }

  .u-section-3 .u-text-3 {
    width: auto;
    margin-left: 248px;
  }

  .u-section-3 .u-group-3 {
    min-height: 32px;
    margin-right: initial;
    margin-left: initial;
  }

  .u-section-3 .u-text-4 {
    font-size: 0.625rem;
    margin-right: 167px;
  }

  .u-section-3 .u-text-5 {
    font-size: 0.625rem;
    width: auto;
    margin-right: 167px;
  }

  .u-section-3 .u-text-6 {
    font-size: 0.625rem;
    margin-top: -24px;
    margin-left: 248px;
  }

  .u-section-3 .u-group-4 {
    min-height: 33px;
    margin-right: initial;
    margin-left: initial;
  }

  .u-section-3 .u-text-7 {
    font-size: 0.625rem;
    margin-right: 165px;
  }

  .u-section-3 .u-text-8 {
    font-size: 0.625rem;
    width: auto;
    margin-right: 165px;
  }

  .u-section-3 .u-text-9 {
    font-size: 0.625rem;
    margin-top: -24px;
    margin-left: 248px;
  }
}

#kek1 {
  position: absolute;
  top: 0;
  height: 100%;
  width: 100vw;
  z-index: 0;
  display: flex;
  justify-content: center;
  align-items: flex-start;
  text-align: center;
  background: rgba(0, 0, 0, 0.7);
}

.u-dialog-s1 {
  width: 566px;
  min-height: 431px;
  margin: 60px auto;
}

.u-container-layout-s1 {
  padding: 40px 30px;
}

.u-text-s1 {
  text-transform: uppercase;
  letter-spacing: 5px;
  width: 254px;
  margin: 0 auto;
}

.u-form-s1 {
  height: 124px;
  width: 380px;
  margin: 93px auto 0;
}

.u-btn-s2 {
  border-style: solid;
  text-transform: uppercase;
  letter-spacing: 0px;
  font-weight: 700;
  margin: 65px auto 0;
}

.u-icon-s1 {
  width: 15px;
  height: 15px;
  left: auto;
  top: 17px;
  position: absolute;
  right: 16px;
}

@media (max-width: 991px) {
  .u-container-layout-s1 {
    padding-bottom: 30px;
  }
}

@media (max-width: 767px) {
  .u-dialog-s1 {
    width: 540px;
  }

  .u-container-layout-s1 {
    padding-top: 30px;
    padding-left: 40px;
    padding-right: 40px;
  }
}

@media (max-width: 575px) {
  .u-dialog-s1 {
    width: 340px;
    height: auto;
  }

  .u-container-layout-s1 {
    padding-top: 40px;
    padding-left: 8px;
    padding-right: 8px;
  }

  .u-form-s1 {
    height: 122px;
    width: 307px;
    margin-top: 94px;
  }

  .u-btn-s2 {
    margin-top: 65px;
  }
}

#kek {
  position: absolute;
  top: 0;
  height: 100%;
  width: 100vw;
  z-index: 0;
  display: flex;
  justify-content: center;
  align-items: flex-start;
  text-align: center;
  background: rgba(0, 0, 0, 0.7);
}

.u-dialog-b1 {
  width: 566px;
  min-height: 463px;
  margin-block-start: 15%;
}

.u-container-layout-b1 {
  padding: 40px 30px;
}

.u-text-b1 {
  text-transform: uppercase;
  letter-spacing: 5px;
  margin: 0 auto;
}

.u-text-b2 {
  font-weight: 400;
  margin: 23px 0 0;
}

.u-btn-b1 {
  border-style: solid;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0px;
  margin: 23px auto 0 110px;
}

.u-btn-b2 {
  border-style: solid;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0px;
  margin: -49px auto 0 262px;
}

.u-text-b3 {
  font-weight: 400;
  width: 227px;
  margin: 127px auto 0;
}

.u-btn-b3 {
  border-style: solid;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0px;
  margin: 14px auto 0;
}

.u-icon-b1 {
  width: 15px;
  height: 15px;
  left: auto;
  top: 17px;
  position: absolute;
  right: 16px;
}

@media (max-width: 1199px) {
  .u-dialog-b1 {
    height: auto;
  }

  .u-text-b3 {
    width: 227px;
  }
}

@media (max-width: 991px) {
  .u-container-layout-b1 {
    padding-bottom: 30px;
  }
}

@media (max-width: 767px) {
  .u-dialog-b1 {
    width: 540px;
  }

  .u-container-layout-b1 {
    padding-top: 30px;
    padding-left: 40px;
    padding-right: 40px;
  }

  .u-btn-b1 {
    margin-left: 87px;
  }

  .u-btn-b2 {
    margin-left: 239px;
  }
}

@media (max-width: 575px) {
  .u-dialog-b1 {
    width: 340px;
  }

  .u-container-layout-b1 {
    padding-top: 40px;
    padding-left: 25px;
    padding-right: 25px;
  }

  .u-btn-b1 {
    margin-left: auto;
  }

  .u-btn-b2 {
    margin-top: 14px;
    margin-left: auto;
  }

  .u-text-b3 {
    margin-top: 64px;
  }
}
</style>