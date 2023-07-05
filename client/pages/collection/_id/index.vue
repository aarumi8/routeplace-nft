<template>
  <div>
    <body class="u-body">
      <Header />
      <section class="u-clearfix u-custom-color-7 u-section-1" id="sec-6bf5">
        <div class="u-align-left u-clearfix u-sheet u-sheet-1">
          <div
            class="u-border-1 u-border-grey-80 u-container-style u-expanded-width u-group u-radius-10 u-shape-round u-group-1"
          >
            <div class="u-container-layout u-container-layout-1">
              <img
                class="u-image u-image-round u-radius-10 u-image-1"
                src="../../../static/images/Screenshot2023-06-16at5.06.13PM.png"
                alt=""
                data-image-width="984"
                data-image-height="964"
              />
              <p class="u-custom-font u-font-ubuntu u-text u-text-1">
                {{ collection.name }}
              </p>
              <p
                class="u-custom-font u-font-ubuntu u-text u-text-grey-40 u-text-2"
              >
                {{ collection.desc }}
              </p>
              <div class="u-container-style u-group u-group-2">
                <div class="u-container-layout">
                  <p
                    class="u-custom-font u-font-ubuntu u-text u-text-grey-40 u-text-3"
                  >
                    Flo​or
                  </p>
                  <p class="u-custom-font u-font-ubuntu u-text u-text-4">
                    $0.0005
                  </p>
                </div>
              </div>
              <div class="u-container-style u-group u-group-3">
                <div class="u-container-layout">
                  <p
                    class="u-custom-font u-font-ubuntu u-text u-text-grey-40 u-text-5"
                  >
                    Volume
                  </p>
                  <p class="u-custom-font u-font-ubuntu u-text u-text-6">$0</p>
                </div>
              </div>
              <div class="u-container-style u-group u-group-4">
                <div class="u-container-layout">
                  <p
                    class="u-custom-font u-font-ubuntu u-text u-text-grey-40 u-text-7"
                  >
                    Items
                  </p>
                  <p class="u-custom-font u-font-ubuntu u-text u-text-8">3</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <section class="u-clearfix u-custom-color-7 u-section-2" id="sec-b060">
        <div class="u-align-left u-clearfix u-sheet u-sheet-1">
          <div class="u-expanded-width u-list u-list-1">
            <div v-if='loaded' class="u-repeater u-repeater-1">
              <div
                v-for="item in nfts"
                :key="item.name"
                class="u-border-1 u-border-grey-80 u-container-style u-list-item u-radius-10 u-repeater-item u-shape-round"
              >
                <a
                  :href="
                    '/collection/' +
                    collectionId +
                    '/' +
                    item.token_id +
                    '#' +
                    item.chain_id
                  "
                >
                  <div
                    class="u-container-layout u-similar-container u-container-layout-1"
                  >
                    <img
                      class="u-expanded-width u-image u-image-round u-radius-10 u-image-1"
                      :src="item.image"
                      data-image-width="984"
                      data-image-height="964"
                    />
                    <p class="u-custom-font u-font-ubuntu u-text u-text-1">
                      {{ item.name }}
                    </p>
                    <p class="u-custom-font u-font-ubuntu u-text u-text-2">
                      <span class="u-text-grey-40"
                        >Price:
                        <span class="u-text-white" style="font-weight: 700">{{
                          item.prices[0].price
                        }}</span>
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
const MumbaiRPC = "https://rpc-mumbai.maticvigil.com";
var web3M = new Web3(MumbaiRPC);

const marketABI = require("../../../abis/market.json");

const xercABI = require("../../../abis/xerc.json");

export default {
  name: "Collection",
  data() {
    return {
      loaded: false,
      web3: null,
      backendURL: "https://route-nft-server900.ru/",
      collection: {},
      nfts: [],
      loading: true,
      collectionId: "",
    };
  },
  async created() {
    try {
      const fullUrl = new URL(window.location.href);
      const pathParts = fullUrl.pathname.split("/").filter((part) => part);
      this.collectionId = pathParts[1];

      await this.getCollectionData();
      await this.getNfts();
    } catch (err) {
      console.log(err);
    }
  },
  methods: {
    async getCollectionData() {
      var response = await axios.post(this.backendURL + "getCollections");
      var collections = response.data;
      for (var collection of collections) {
        if (collection.uuid == this.collectionId) {
          this.collection = collection;
          console.log(this.collection);
          break;
        }
      }
    },
    async getNfts() {
      var jsonBody = { collectionUuid: this.collectionId };
      var response = await axios.post(
        this.backendURL + "getListedTokens",
        jsonBody
      );
      console.log(response.data);
      this.nfts = response.data;
      var contractInstance = new web3M.eth.Contract(
        xercABI,
        web3M.utils.toChecksumAddress(this.nfts[0].collection_address)
      );
      
      for (let i = 0; i < 3; i++) {
        let tokenURI = await contractInstance.methods
          .tokenURI(this.nfts[i].token_id)
          .call();

        tokenURI = this.normalizeURL(tokenURI);
        var response = await fetch(tokenURI);
        const jsonData = await response.json();
        this.nfts[i].image = this.normalizeURL(jsonData.image);
      }
      console.log("nfts: ", this.nfts);
      this.loaded=true
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
  },
};
</script>

<style scoped>
.u-section-1 {
  background-image: none;
}

.u-section-1 .u-sheet-1 {
  min-height: 409px;
}

.u-section-1 .u-group-1 {
  margin-top: 0;
  margin-bottom: 30px;
  min-height: 379px;
}

.u-section-1 .u-container-layout-1 {
  padding: 30px 0;
}

.u-section-1 .u-image-1 {
  width: 322px;
  height: 315px;
  margin: 1px auto 0 30px;
}

.u-section-1 .u-text-1 {
  font-size: 3rem;
  font-weight: 700;
  margin: -315px 30px 0 381px;
}

.u-section-1 .u-text-2 {
  font-weight: 400;
  margin: 0 30px 0 381px;
}

.u-section-1 .u-group-2 {
  width: 107px;
  min-height: 57px;
  margin: 108px auto 0 377px;
}

.u-section-1 .u-text-3 {
  font-weight: 400;
  margin: 0;
}

.u-section-1 .u-text-4 {
  font-size: 1.25rem;
  font-weight: 700;
  margin: 0;
}

.u-section-1 .u-group-3 {
  width: 107px;
  min-height: 57px;
  margin: -57px auto 0 485px;
}

.u-section-1 .u-text-5 {
  font-weight: 400;
  margin: 0;
}

.u-section-1 .u-text-6 {
  font-size: 1.25rem;
  font-weight: 700;
  margin: 0;
}

.u-section-1 .u-group-4 {
  width: 107px;
  min-height: 57px;
  margin: -57px 0 0 auto;
}

.u-section-1 .u-text-7 {
  font-weight: 400;
  margin: 0;
}

.u-section-1 .u-text-8 {
  font-size: 1.25rem;
  font-weight: 700;
  margin: 0;
}

@media (max-width: 1199px) {
  .u-section-1 .u-sheet-1 {
    min-height: 381px;
  }

  .u-section-1 .u-group-1 {
    margin-bottom: 20px;
    min-height: 361px;
  }

  .u-section-1 .u-container-layout-1 {
    padding-left: 30px;
    padding-right: 30px;
  }

  .u-section-1 .u-image-1 {
    width: 297px;
    height: 291px;
    margin-top: 0;
    margin-left: 0;
  }

  .u-section-1 .u-text-1 {
    width: auto;
    margin-top: -291px;
    margin-right: 0;
    margin-left: 329px;
  }

  .u-section-1 .u-text-2 {
    width: auto;
    margin-right: 0;
    margin-left: 329px;
    font-size: 1rem;
  }

  .u-section-1 .u-group-2 {
    min-height: 48px;
    margin-top: 61px;
    margin-left: 329px;
  }

  .u-section-1 .u-text-3 {
    font-size: 0.875rem;
  }

  .u-section-1 .u-text-4 {
    font-size: 1rem;
  }

  .u-section-1 .u-group-3 {
    min-height: 48px;
    margin-top: -49px;
    margin-right: 326px;
    margin-left: auto;
  }

  .u-section-1 .u-text-5 {
    font-size: 0.875rem;
  }

  .u-section-1 .u-text-6 {
    font-size: 1rem;
  }

  .u-section-1 .u-group-4 {
    min-height: 47px;
    margin-top: -48px;
  }

  .u-section-1 .u-text-7 {
    font-size: 0.875rem;
  }

  .u-section-1 .u-text-8 {
    font-size: 1rem;
  }
}

@media (max-width: 991px) {
  .u-section-1 .u-sheet-1 {
    min-height: 327px;
  }

  .u-section-1 .u-group-1 {
    min-height: 307px;
  }

  .u-section-1 .u-container-layout-1 {
    padding-top: 28px;
    padding-bottom: 28px;
  }

  .u-section-1 .u-image-1 {
    width: 246px;
    height: 241px;
    margin-top: 2px;
  }

  .u-section-1 .u-text-1 {
    font-size: 1.875rem;
    margin-top: -241px;
    margin-right: 176px;
    margin-left: 266px;
  }

  .u-section-1 .u-text-2 {
    font-size: 0.75rem;
    margin-left: 266px;
  }

  .u-section-1 .u-group-2 {
    margin-top: 50px;
    margin-left: 266px;
  }

  .u-section-1 .u-group-3 {
    margin-top: -48px;
    margin-right: 198px;
  }
}

@media (max-width: 767px) {
  .u-section-1 .u-sheet-1 {
    min-height: 193px;
  }

  .u-section-1 .u-group-1 {
    margin-bottom: 16px;
    min-height: 177px;
  }

  .u-section-1 .u-container-layout-1 {
    padding: 30px 10px;
  }

  .u-section-1 .u-image-1 {
    width: 153px;
    height: 150px;
    margin-top: 10px;
  }

  .u-section-1 .u-text-1 {
    font-size: 1.5rem;
    margin-top: -150px;
    margin-right: 0;
    margin-left: 170px;
  }

  .u-section-1 .u-text-2 {
    font-size: 0.625rem;
    margin-left: 170px;
  }

  .u-section-1 .u-group-2 {
    width: 61px;
    min-height: 33px;
    margin-top: 17px;
    margin-left: 171px;
  }

  .u-section-1 .u-text-3 {
    font-size: 0.625rem;
    width: auto;
  }

  .u-section-1 .u-text-4 {
    font-size: 0.625rem;
    width: auto;
  }

  .u-section-1 .u-group-3 {
    width: 69px;
    min-height: 32px;
    margin-top: -33px;
    margin-right: auto;
  }

  .u-section-1 .u-text-5 {
    font-size: 0.625rem;
  }

  .u-section-1 .u-text-6 {
    font-size: 0.625rem;
  }

  .u-section-1 .u-group-4 {
    width: 57px;
    min-height: 33px;
    margin-top: -32px;
  }

  .u-section-1 .u-text-7 {
    font-size: 0.625rem;
  }

  .u-section-1 .u-text-8 {
    font-size: 0.625rem;
  }
}

@media (max-width: 575px) {
  .u-section-1 .u-sheet-1 {
    min-height: 368px;
  }

  .u-section-1 .u-group-1 {
    margin-bottom: 15px;
    min-height: 353px;
  }

  .u-section-1 .u-container-layout-1 {
    padding-top: 10px;
    padding-bottom: 10px;
  }

  .u-section-1 .u-image-1 {
    margin-top: 0;
    margin-left: auto;
  }

  .u-section-1 .u-text-1 {
    margin-top: 9px;
    margin-left: 0;
  }

  .u-section-1 .u-text-2 {
    margin-left: 0;
  }

  .u-section-1 .u-group-2 {
    margin-top: 20px;
    margin-left: 0;
  }

  .u-section-1 .u-group-3 {
    margin-left: 62px;
  }

  .u-section-1 .u-group-4 {
    margin-top: -35px;
  }
}
.u-section-2 {
  background-image: none;
}

.u-section-2 .u-sheet-1 {
  min-height: 384px;
}

.u-section-2 .u-list-1 {
  margin-bottom: 20px;
  margin-top: 0;
}

.u-section-2 .u-repeater-1 {
  grid-gap: 26px 26px;
  grid-template-columns:
    calc(25% - 19.5px) calc(25% - 19.5px) calc(25% - 19.5px)
    calc(25% - 19.5px);
  min-height: 364px;
}

.u-section-2 .u-container-layout-1 {
  padding: 10px;
}

.u-section-2 .u-image-1 {
  height: 243px;
  margin-top: 3px;
  margin-bottom: 0;
}

.u-section-2 .u-text-1 {
  font-weight: 700;
  font-size: 1.5rem;
  margin: 10px 0 0;
}

.u-section-2 .u-text-2 {
  font-weight: 400;
  margin: 23px 1px 0;
}

.u-section-2 .u-container-layout-2 {
  padding: 10px;
}

.u-section-2 .u-image-2 {
  height: 243px;
  margin-top: 3px;
  margin-bottom: 0;
}

.u-section-2 .u-text-3 {
  font-weight: 700;
  font-size: 1.5rem;
  margin: 10px 0 0;
}

.u-section-2 .u-text-4 {
  font-weight: 400;
  margin: 23px 1px 0;
}

.u-section-2 .u-container-layout-3 {
  padding: 10px;
}

.u-section-2 .u-image-3 {
  height: 243px;
  margin-top: 3px;
  margin-bottom: 0;
}

.u-section-2 .u-text-5 {
  font-weight: 700;
  font-size: 1.5rem;
  margin: 10px 0 0;
}

.u-section-2 .u-text-6 {
  font-weight: 400;
  margin: 23px 1px 0;
}

.u-section-2 .u-container-layout-4 {
  padding: 10px;
}

.u-section-2 .u-image-4 {
  height: 243px;
  margin-top: 3px;
  margin-bottom: 0;
}

.u-section-2 .u-text-7 {
  font-weight: 700;
  font-size: 1.5rem;
  margin: 10px 0 0;
}

.u-section-2 .u-text-8 {
  font-weight: 400;
  margin: 23px 1px 0;
}

@media (max-width: 1199px) {
  .u-section-2 .u-repeater-1 {
    min-height: 300px;
  }

  .u-section-2 .u-image-1 {
    height: 197px;
  }

  .u-section-2 .u-text-2 {
    margin-left: 0;
    margin-right: 0;
  }

  .u-section-2 .u-image-2 {
    height: 197px;
  }

  .u-section-2 .u-text-4 {
    margin-left: 0;
    margin-right: 0;
  }

  .u-section-2 .u-image-3 {
    height: 197px;
  }

  .u-section-2 .u-text-6 {
    margin-left: 0;
    margin-right: 0;
  }

  .u-section-2 .u-image-4 {
    height: 197px;
  }

  .u-section-2 .u-text-8 {
    margin-left: 0;
    margin-right: 0;
  }
}

@media (max-width: 991px) {
  .u-section-2 .u-repeater-1 {
    grid-template-columns: calc(50% - 13px) calc(50% - 13px);
    min-height: 919px;
  }

  .u-section-2 .u-image-1 {
    height: 312px;
  }

  .u-section-2 .u-image-2 {
    height: 312px;
  }

  .u-section-2 .u-image-3 {
    height: 312px;
  }

  .u-section-2 .u-image-4 {
    height: 312px;
  }
}

@media (max-width: 767px) {
  .u-section-2 .u-repeater-1 {
    grid-template-columns: 100%;
  }

  .u-section-2 .u-image-1 {
    height: 477px;
  }

  .u-section-2 .u-image-2 {
    height: 477px;
  }

  .u-section-2 .u-image-3 {
    height: 477px;
  }

  .u-section-2 .u-image-4 {
    height: 477px;
  }
}

@media (max-width: 575px) {
  .u-section-2 .u-image-1 {
    height: 294px;
  }

  .u-section-2 .u-image-2 {
    height: 294px;
  }

  .u-section-2 .u-image-3 {
    height: 294px;
  }

  .u-section-2 .u-image-4 {
    height: 294px;
  }
}
</style>