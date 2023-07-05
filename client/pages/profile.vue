<template>
  <div>
    <body class="u-body">
      <Header />
      <section class="u-clearfix u-custom-color-7 u-section-1" id="sec-1320">
        <div class="u-align-left u-clearfix u-sheet u-valign-middle u-sheet-1">
          <div
            class="u-border-1 u-border-grey-80 u-container-style u-expanded-width u-group u-radius-10 u-shape-round u-group-1"
          >
            <div
              class="u-container-layout u-valign-bottom-lg u-container-layout-1"
            >
              <img
                class="u-image u-image-round u-radius-10 u-image-1"
                src="images/Screenshot2023-06-16at11.36.40PM.png"
                alt=""
                data-image-width="984"
                data-image-height="964"
              />
              <p class="u-custom-font u-font-ubuntu u-text u-text-1">Profile</p>
              <div class="u-container-style u-group u-group-2">
                <div class="u-container-layout">
                  <p
                    class="u-custom-font u-font-ubuntu u-text u-text-grey-40 u-text-2"
                  >
                    Address
                  </p>
                  <p class="u-custom-font u-font-ubuntu u-text u-text-3">
                    {{ this.address }}
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <section class="u-clearfix u-custom-color-7 u-section-2" id="sec-80c2">
        <div class="u-clearfix u-sheet u-sheet-1">
          <p class="u-custom-font u-font-ubuntu u-text u-text-1">Your NFTs</p>
        </div>
      </section>
      <section class="u-clearfix u-custom-color-7 u-section-3" id="sec-80ff">
        <div class="u-align-left u-clearfix u-sheet u-sheet-1">
          <div class="u-expanded-width u-list u-list-1">
            <div class="u-repeater u-repeater-1">
              <div
                v-for="item in nfts"
                :key="item.name"
                class="u-border-1 u-border-grey-80 u-container-style u-list-item u-radius-10 u-repeater-item u-shape-round"
              >
                <a
                  :href="
                    '/collection/' +
                    item.collectionId +
                    '/' +
                    item.tokenId +
                    '#' +
                    item.chainId
                  "
                >
                  <div
                    class="u-container-layout u-similar-container u-container-layout-1"
                  >
                    <img
                      class="u-expanded-width u-image u-image-round u-radius-10 u-image-1"
                      :src="item.image"
                      alt=""
                      data-image-width="984"
                      data-image-height="964"
                    />
                    <p class="u-custom-font u-font-ubuntu u-text u-text-1">
                      {{ item.name }}
                    </p>
                    <p class="u-custom-font u-font-ubuntu u-text u-text-2">
                      <span class="u-text-grey-40"
                        >Price:
                        <span class="u-text-white" style="font-weight: 700"
                          >No Data</span
                        >
                      </span>
                    </p>
                  </div>
                </a>
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
const web3M = new Web3(MumbaiRPC);

const xercABI = require("../abis/xerc.json");

export default {
  name: "Profile",
  data() {
    return {
      nfts: [],
      address: "Please, connect your MetaMask",
      loading: true,
      web3: null,
      backendURL: "https://route-nft-server900.ru/",
    };
  },
  async created() {
    try {
      if (!(await this.connectWallet())) return;
      this.address = window.ethereum.selectedAddress;
      await this.getNfts();
      // await this.loadNfts();
    } catch (err) {
      console.log(err);
    }
  },
  methods: {
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
    async getNfts() {
      try {
        var response = await axios.post(this.backendURL + "getCollections");
        this.collections = response.data;

        for (let collection of this.collections) {
          var uuid = collection.uuid;
          console.log(collection)
          for (let contract of collection.contracts) {
            let { address, chain_id: chainId } = contract;
            let contractInstance = null;

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

            let balance = await contractInstance.methods
              .balanceOf(window.ethereum.selectedAddress)
              .call();

            for (var i = 0; i < balance; i++) {
              let tokenId = await contractInstance.methods
                .tokenOfOwnerByIndex(window.ethereum.selectedAddress, i)
                .call();
              let tokenURI = await contractInstance.methods
                .tokenURI(tokenId)
                .call();

              tokenURI = this.normalizeURL(tokenURI);

              var response = await fetch(tokenURI);
              const jsonData = await response.json();
              this.nfts.push({
                token_uri: tokenURI,
                tokenId: tokenId,
                chainId: chainId,
                address: address,
                metadata: jsonData,
                collectionId: uuid,
                image: this.normalizeURL(jsonData.image),
              });
            }
          }
        }
        console.log(this.nfts)
      } catch (err) {
        console.log(err);
      }
    },
    async connectWallet() {
      if (window.ethereum) {
        try {
          // Request account access
          // We don't know window.web3 version, so we use our own instance of Web3
          // with the injected provider given by MetaMask
          await window.ethereum.enable();
          this.web3 = new Web3(window.ethereum);
          console.log(window.ethereum.selectedAddress);
          return true;
        } catch (error) {
          // User denied account access...
          console.error("User denied account access");
          //alert('Error! You denied account access')
        }
      }
      // Legacy dapp browsers...
      else if (window.web3) {
        this.web3 = new Web3(window.web3.currentProvider);
        // Acccounts always exposed
        console.log(
          `Connected with the account: ${window.web3.currentProvider.selectedAddress}`
        );
        return true;
      }
      // Non-dapp browsers...
      else {
        console.log(
          "Non-Ethereum browser detected. You should consider trying MetaMask!"
        );
        alert("No wallet detected. Please, install MetaMask");
      }

      return false;
    },
  },
};
</script>

<style scoped>
.u-section-1 {
  background-image: none;
}

.u-section-1 .u-sheet-1 {
  min-height: 379px;
}

.u-section-1 .u-group-1 {
  margin-top: 0;
  margin-bottom: 0;
  min-height: 379px;
}

.u-section-1 .u-container-layout-1 {
  padding: 30px 0;
}

.u-section-1 .u-image-1 {
  width: 322px;
  height: 315px;
  margin: 0 auto 0 30px;
}

.u-section-1 .u-text-1 {
  font-size: 3rem;
  font-weight: 700;
  margin: -315px 30px 0 381px;
}

.u-section-1 .u-group-2 {
  width: 756px;
  min-height: 61px;
  margin: 178px 0 0 auto;
}

.u-section-1 .u-text-2 {
  background-image: none;
  margin-bottom: 0;
  margin-top: 0;
  font-size: 1rem;
}

.u-section-1 .u-text-3 {
  font-size: 1.125rem;
  font-weight: 700;
  margin: 0;
}

@media (max-width: 1199px) {
  .u-section-1 .u-sheet-1 {
    min-height: 375px;
  }

  .u-section-1 .u-group-1 {
    min-height: 355px;
  }

  .u-section-1 .u-image-1 {
    width: 291px;
    height: 291px;
  }

  .u-section-1 .u-text-1 {
    width: auto;
    margin-top: -291px;
    margin-right: 48px;
    margin-left: 341px;
  }

  .u-section-1 .u-group-2 {
    width: 597px;
    margin-top: 156px;
  }

  .u-section-1 .u-text-3 {
    width: auto;
  }
}

@media (max-width: 991px) {
  .u-section-1 .u-sheet-1 {
    min-height: 310px;
  }

  .u-section-1 .u-group-1 {
    margin-top: 1px;
    margin-bottom: 1px;
    min-height: 308px;
  }

  .u-section-1 .u-container-layout-1 {
    padding-top: 28px;
    padding-bottom: 28px;
  }

  .u-section-1 .u-image-1 {
    width: 246px;
    height: 241px;
    margin-left: 20px;
  }

  .u-section-1 .u-text-1 {
    font-size: 1.875rem;
    margin-top: -241px;
    margin-right: 156px;
    margin-left: 286px;
  }

  .u-section-1 .u-group-2 {
    width: 412px;
    margin-top: 138px;
    margin-right: 20px;
  }
}

@media (max-width: 767px) {
  .u-section-1 .u-sheet-1 {
    min-height: 216px;
  }

  .u-section-1 .u-group-1 {
    min-height: 214px;
  }

  .u-section-1 .u-container-layout-1 {
    padding-top: 30px;
    padding-bottom: 29px;
  }

  .u-section-1 .u-image-1 {
    width: 153px;
    height: 150px;
  }

  .u-section-1 .u-text-1 {
    font-size: 1.5rem;
    margin-top: -150px;
    margin-right: 83px;
    margin-left: 189px;
  }

  .u-section-1 .u-group-2 {
    width: 325px;
    min-height: 32px;
    margin-top: 83px;
  }

  .u-section-1 .u-text-2 {
    font-size: 0.625rem;
    width: auto;
    margin-right: 68px;
    margin-left: 0;
  }

  .u-section-1 .u-text-3 {
    font-size: 0.625rem;
  }
}

@media (max-width: 575px) {
  .u-section-1 .u-sheet-1 {
    min-height: 291px;
  }

  .u-section-1 .u-group-1 {
    margin-top: 8px;
    margin-bottom: 8px;
    min-height: 276px;
  }

  .u-section-1 .u-container-layout-1 {
    padding-top: 10px;
    padding-bottom: 10px;
  }

  .u-section-1 .u-image-1 {
    margin-left: auto;
  }

  .u-section-1 .u-text-1 {
    margin-top: 8px;
    margin-right: 53px;
    margin-left: 19px;
  }

  .u-section-1 .u-group-2 {
    width: 300px;
    margin-top: 16px;
    margin-left: 19px;
    margin-right: 19px;
  }

  .u-section-1 .u-text-2 {
    margin-right: 210px;
  }
}
.u-section-2 {
  background-image: none;
}

.u-section-2 .u-sheet-1 {
  min-height: 97px;
}

.u-section-2 .u-text-1 {
  font-size: 2.25rem;
  font-weight: normal;
  margin: 10px 769px 30px 0;
}

@media (max-width: 1199px) {
  .u-section-2 .u-sheet-1 {
    min-height: 68px;
  }

  .u-section-2 .u-text-1 {
    font-size: 1.875rem;
    width: auto;
    margin-right: 0;
    margin-bottom: 20px;
  }
}
.u-section-3 {
  background-image: none;
}

.u-section-3 .u-sheet-1 {
  min-height: 384px;
}

.u-section-3 .u-list-1 {
  margin-bottom: 20px;
  margin-top: 0;
}

.u-section-3 .u-repeater-1 {
  grid-gap: 26px 26px;
  grid-template-columns:
    calc(25% - 19.5px) calc(25% - 19.5px) calc(25% - 19.5px)
    calc(25% - 19.5px);
  min-height: 364px;
}

.u-section-3 .u-container-layout-1 {
  padding: 10px;
}

.u-section-3 .u-image-1 {
  height: 243px;
  margin-top: 3px;
  margin-bottom: 0;
}

.u-section-3 .u-text-1 {
  font-weight: 700;
  font-size: 1.5rem;
  margin: 10px 0 0;
}

.u-section-3 .u-text-2 {
  font-weight: 400;
  margin: 23px 1px 0;
}

.u-section-3 .u-container-layout-2 {
  padding: 10px;
}

.u-section-3 .u-image-2 {
  height: 243px;
  margin-top: 3px;
  margin-bottom: 0;
}

.u-section-3 .u-text-3 {
  font-weight: 700;
  font-size: 1.5rem;
  margin: 10px 0 0;
}

.u-section-3 .u-text-4 {
  font-weight: 400;
  margin: 23px 1px 0;
}

.u-section-3 .u-container-layout-3 {
  padding: 10px;
}

.u-section-3 .u-image-3 {
  height: 243px;
  margin-top: 3px;
  margin-bottom: 0;
}

.u-section-3 .u-text-5 {
  font-weight: 700;
  font-size: 1.5rem;
  margin: 10px 0 0;
}

.u-section-3 .u-text-6 {
  font-weight: 400;
  margin: 23px 1px 0;
}

.u-section-3 .u-container-layout-4 {
  padding: 10px;
}

.u-section-3 .u-image-4 {
  height: 243px;
  margin-top: 3px;
  margin-bottom: 0;
}

.u-section-3 .u-text-7 {
  font-weight: 700;
  font-size: 1.5rem;
  margin: 10px 0 0;
}

.u-section-3 .u-text-8 {
  font-weight: 400;
  margin: 23px 1px 0;
}

@media (max-width: 1199px) {
  .u-section-3 .u-repeater-1 {
    min-height: 300px;
  }

  .u-section-3 .u-image-1 {
    height: 197px;
  }

  .u-section-3 .u-text-2 {
    margin-left: 0;
    margin-right: 0;
  }

  .u-section-3 .u-image-2 {
    height: 197px;
  }

  .u-section-3 .u-text-4 {
    margin-left: 0;
    margin-right: 0;
  }

  .u-section-3 .u-image-3 {
    height: 197px;
  }

  .u-section-3 .u-text-6 {
    margin-left: 0;
    margin-right: 0;
  }

  .u-section-3 .u-image-4 {
    height: 197px;
  }

  .u-section-3 .u-text-8 {
    margin-left: 0;
    margin-right: 0;
  }
}

@media (max-width: 991px) {
  .u-section-3 .u-repeater-1 {
    grid-template-columns: calc(50% - 13px) calc(50% - 13px);
    min-height: 919px;
  }

  .u-section-3 .u-image-1 {
    height: 312px;
  }

  .u-section-3 .u-image-2 {
    height: 312px;
  }

  .u-section-3 .u-image-3 {
    height: 312px;
  }

  .u-section-3 .u-image-4 {
    height: 312px;
  }
}

@media (max-width: 767px) {
  .u-section-3 .u-repeater-1 {
    grid-template-columns: 100%;
  }

  .u-section-3 .u-image-1 {
    height: 477px;
  }

  .u-section-3 .u-image-2 {
    height: 477px;
  }

  .u-section-3 .u-image-3 {
    height: 477px;
  }

  .u-section-3 .u-image-4 {
    height: 477px;
  }
}

@media (max-width: 575px) {
  .u-section-3 .u-image-1 {
    height: 294px;
  }

  .u-section-3 .u-image-2 {
    height: 294px;
  }

  .u-section-3 .u-image-3 {
    height: 294px;
  }

  .u-section-3 .u-image-4 {
    height: 294px;
  }
}
</style>