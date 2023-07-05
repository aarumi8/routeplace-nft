<template>
  <div>
    <body class="u-body">
      <Header />
      <section class="u-clearfix u-custom-color-7 u-section-1" id="sec-23d9">
        <div class="u-align-left u-clearfix u-sheet u-sheet-1">
          <div class="u-border-1 u-border-grey-80 u-container-style u-expanded-width u-group u-radius-10 u-shape-round u-group-1">
            <div class="u-container-layout u-container-layout-1">
              <img class="u-image u-image-round u-radius-10 u-image-1" src="images/Screenshot2023-06-16at11.36.40PM.png" alt="" data-image-width="984" data-image-height="964">
              <p class="u-custom-font u-font-ubuntu u-text u-text-1">Welcome to Route<span class="u-text-custom-color-3">Place </span>
              </p>
              <p class="u-custom-font u-font-ubuntu u-text u-text-grey-40 u-text-2">The first crosschain marketplace. Buy and sell NFTs from any chain to any chain with no limits using <span class="u-text-custom-color-3">Router Protocol</span>
              </p>
            </div>
          </div>
        </div>
      </section>
      <section class="u-clearfix u-custom-color-7 u-section-2" id="sec-bd77">
        <div class="u-clearfix u-sheet u-sheet-1">
          <p class="u-custom-font u-font-ubuntu u-text u-text-1">Trending Collections</p>
        </div>
      </section>

      <section class="u-clearfix u-custom-color-7 u-section-3" id="sec-65f8">
        <div id='collectionsRow' class="u-align-left u-clearfix u-sheet u-sheet-1">
          <div class="u-expanded-width u-list u-list-1">
            <div class="u-repeater u-repeater-1">
                <div v-for="item in collections" :key="item.name" id='item' class="u-border-1 u-border-grey-80 u-container-style u-list-item u-radius-10 u-repeater-item u-shape-round u-list-item-1">
                  <a :href="'/collection/'+ item.uuid">
                  <div class="u-container-layout u-similar-container u-valign-bottom u-container-layout-1">
                    <img class="u-expanded-width u-image u-image-round u-radius-10 u-image-1" src="images/Screenshot2023-06-16at5.06.13PM.png" alt="" data-image-width="954" data-image-height="944">
                    <p class="u-custom-font u-font-ubuntu u-text u-text-1">{{item.name}}</p>
                    <div class="u-container-style u-group u-group-1">
                      <div class="u-container-layout">
                        <p class="u-custom-font u-font-ubuntu u-text u-text-grey-40 u-text-2">Flo​or</p>
                        <p class="u-custom-font u-font-ubuntu u-text u-text-3">$0.0005</p>
                      </div>
                    </div>
                    <div class="u-align-left u-container-style u-group u-group-2">
                      <div class="u-container-layout">
                        <p class="u-custom-font u-font-ubuntu u-text u-text-grey-40 u-text-4">Volume</p>
                        <p class="u-custom-font u-font-ubuntu u-text u-text-5">$0</p>
                      </div> 
                    </div>
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
import axios from 'axios';

export default {
  name: 'IndexPage',
  data() {
    return {
      collections: [],
      loading: true,
      backendURL: 'https://route-nft-server900.ru/'
    }
  },
  async created() {
    try {
      await this.loadCollections()
    } catch (err) {
      console.log(err)
    }
  },
  methods: {
    async loadCollections() {
      var response = await axios.post(this.backendURL + "getCollections")
      this.collections = response.data
      console.log(this.collections)
      this.loading = false
    }
  }
}
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
  font-size: 1.5rem;
  margin: 0 30px 0 381px;
}

@media (max-width: 1199px) {
  .u-section-1 .u-sheet-1 {
    min-height: 412px;
  }

  .u-section-1 .u-group-1 {
    min-height: 382px;
  }

  .u-section-1 .u-container-layout-1 {
    padding-left: 30px;
    padding-right: 30px;
  }

  .u-section-1 .u-image-1 {
    margin-top: 0;
    margin-left: 0;
  }

  .u-section-1 .u-text-1 {
    font-size: 2.25rem;
    width: auto;
    margin-right: 5px;
    margin-left: 382px;
  }

  .u-section-1 .u-text-2 {
    font-size: 1.25rem;
    width: auto;
    margin-top: 19px;
    margin-right: 5px;
    margin-left: 382px;
  }
}

@media (max-width: 991px) {
  .u-section-1 .u-sheet-1 {
    min-height: 312px;
  }

  .u-section-1 .u-group-1 {
    margin-bottom: 20px;
    min-height: 292px;
  }

  .u-section-1 .u-image-1 {
    width: 234px;
    height: 229px;
    margin-right: 424px;
  }

  .u-section-1 .u-text-1 {
    font-size: 1.875rem;
    margin-top: -229px;
    margin-right: 0;
    margin-left: 264px;
  }

  .u-section-1 .u-text-2 {
    margin-top: 0;
    margin-right: 0;
    margin-left: 264px;
  }
}

@media (max-width: 767px) {
  .u-section-1 .u-sheet-1 {
    min-height: 287px;
  }

  .u-section-1 .u-group-1 {
    min-height: 267px;
  }

  .u-section-1 .u-container-layout-1 {
    padding-left: 10px;
    padding-right: 10px;
  }

  .u-section-1 .u-image-1 {
    width: 208px;
    height: 204px;
    margin-right: 310px;
  }

  .u-section-1 .u-text-1 {
    font-size: 1.5rem;
    margin-top: -204px;
    margin-left: 228px;
  }

  .u-section-1 .u-text-2 {
    font-size: 1.125rem;
    margin-left: 228px;
  }
}

@media (max-width: 575px) {
  .u-section-1 .u-sheet-1 {
    min-height: 276px;
  }

  .u-section-1 .u-group-1 {
    min-height: 256px;
  }

  .u-section-1 .u-container-layout-1 {
    padding: 10px 0 0;
  }

  .u-section-1 .u-image-1 {
    width: 152px;
    height: 149px;
    margin-right: auto;
    margin-left: 14px;
  }

  .u-section-1 .u-text-1 {
    font-size: 1.25rem;
    margin-top: -149px;
    margin-right: 14px;
    margin-left: 172px;
  }

  .u-section-1 .u-text-2 {
    font-size: 0.875rem;
    margin-top: 99px;
    margin-left: 14px;
    margin-right: 14px;
  }
}.u-section-2 {
  background-image: none;
}

.u-section-2 .u-sheet-1 {
  min-height: 87px;
}

.u-section-2 .u-text-1 {
  font-size: 2.25rem;
  font-weight: normal;
  margin: 0 769px 30px 0;
}

@media (max-width: 1199px) {
  .u-section-2 .u-sheet-1 {
    min-height: 78px;
  }

  .u-section-2 .u-text-1 {
    font-size: 1.875rem;
    width: auto;
    margin-right: 0;
  }
}

@media (max-width: 991px) {
  .u-section-2 .u-sheet-1 {
    min-height: 68px;
  }

  .u-section-2 .u-text-1 {
    margin-bottom: 20px;
  }
}.u-section-3 {
  background-image: none;
}

.u-section-3 .u-sheet-1 {
  min-height: 548px;
}

.u-section-3 .u-list-1 {
  margin-bottom: 30px;
  margin-top: 0;
}

.u-section-3 .u-repeater-1 {
  grid-gap: 40px 40px;
  grid-template-columns: calc(33.3333% - 26.6667px) calc(33.3333% - 26.6667px) calc(33.3333% - 26.6667px);
  min-height: 518px;
}

.u-section-3 .u-list-item-1 {
  background-image: none;
  animation-duration: 1000ms;
}

.u-section-3 .u-container-layout-1 {
  padding: 15px;
}

.u-section-3 .u-image-1 {
  height: 331px;
  margin-top: 0;
  margin-bottom: 0;
}

.u-section-3 .u-text-1 {
  font-weight: 700;
  font-size: 1.5rem;
  margin: 21px 0 0;
}

.u-section-3 .u-group-1 {
  width: 126px;
  min-height: 63px;
  margin: 33px auto 0 0;
}

.u-section-3 .u-text-2 {
  font-weight: 400;
  font-size: 1.125rem;
  margin: 0;
}

.u-section-3 .u-text-3 {
  font-size: 1.25rem;
  font-weight: 700;
  margin: 3px 3px 0 0;
}

.u-section-3 .u-group-2 {
  width: 109px;
  min-height: 63px;
  margin: -63px 0 0 auto;
}

.u-section-3 .u-text-4 {
  font-weight: 400;
  font-size: 1.125rem;
  margin: 0;
}

.u-section-3 .u-text-5 {
  font-size: 1.25rem;
  font-weight: 700;
  margin: 3px 0 0;
}

.u-section-3 .u-list-item-2 {
  background-image: none;
  animation-duration: 1000ms;
}

.u-section-3 .u-container-layout-4 {
  padding: 15px;
}

.u-section-3 .u-image-2 {
  height: 331px;
  margin-top: 0;
  margin-bottom: 0;
}

.u-section-3 .u-text-6 {
  font-weight: 700;
  font-size: 1.5rem;
  margin: 21px 0 0;
}

.u-section-3 .u-group-3 {
  width: 126px;
  min-height: 63px;
  margin: 33px auto 0 0;
}

.u-section-3 .u-text-7 {
  font-weight: 400;
  font-size: 1.125rem;
  margin: 0;
}

.u-section-3 .u-text-8 {
  font-size: 1.25rem;
  font-weight: 700;
  margin: 3px 3px 0 0;
}

.u-section-3 .u-group-4 {
  width: 109px;
  min-height: 63px;
  margin: -63px 0 0 auto;
}

.u-section-3 .u-text-9 {
  font-weight: 400;
  font-size: 1.125rem;
  margin: 0;
}

.u-section-3 .u-text-10 {
  font-size: 1.25rem;
  font-weight: 700;
  margin: 3px 0 0;
}

.u-section-3 .u-list-item-3 {
  background-image: none;
  animation-duration: 1000ms;
}

.u-section-3 .u-container-layout-7 {
  padding: 15px;
}

.u-section-3 .u-image-3 {
  height: 331px;
  margin-top: 0;
  margin-bottom: 0;
}

.u-section-3 .u-text-11 {
  font-weight: 700;
  font-size: 1.5rem;
  margin: 21px 0 0;
}

.u-section-3 .u-group-5 {
  width: 126px;
  min-height: 63px;
  margin: 33px auto 0 0;
}

.u-section-3 .u-text-12 {
  font-weight: 400;
  font-size: 1.125rem;
  margin: 0;
}

.u-section-3 .u-text-13 {
  font-size: 1.25rem;
  font-weight: 700;
  margin: 3px 3px 0 0;
}

.u-section-3 .u-group-6 {
  width: 109px;
  min-height: 63px;
  margin: -63px 0 0 auto;
}

.u-section-3 .u-text-14 {
  font-weight: 400;
  font-size: 1.125rem;
  margin: 0;
}

.u-section-3 .u-text-15 {
  font-size: 1.25rem;
  font-weight: 700;
  margin: 3px 0 0;
}

@media (max-width: 1199px) {
  .u-section-3 .u-sheet-1 {
    min-height: 528px;
  }

  .u-section-3 .u-list-1 {
    margin-bottom: 33px;
  }

  .u-section-3 .u-repeater-1 {
    min-height: 427px;
  }

  .u-section-3 .u-image-1 {
    height: 268px;
  }

  .u-section-3 .u-image-2 {
    height: 268px;
  }

  .u-section-3 .u-image-3 {
    height: 268px;
  }
}

@media (max-width: 991px) {
  .u-section-3 .u-repeater-1 {
    grid-template-columns: calc(50% - 20px) calc(50% - 20px);
    min-height: 981px;
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
}

@media (max-width: 767px) {
  .u-section-3 .u-repeater-1 {
    grid-template-columns: 100%;
  }

  .u-section-3 .u-container-layout-1 {
    padding-left: 10px;
    padding-right: 10px;
  }

  .u-section-3 .u-image-1 {
    height: 490px;
  }

  .u-section-3 .u-container-layout-4 {
    padding-left: 10px;
    padding-right: 10px;
  }

  .u-section-3 .u-image-2 {
    height: 490px;
  }

  .u-section-3 .u-container-layout-7 {
    padding-left: 10px;
    padding-right: 10px;
  }

  .u-section-3 .u-image-3 {
    height: 490px;
  }
}

@media (max-width: 575px) {
  .u-section-3 .u-image-1 {
    height: 302px;
  }

  .u-section-3 .u-image-2 {
    height: 302px;
  }

  .u-section-3 .u-image-3 {
    height: 302px;
  }
}
</style>