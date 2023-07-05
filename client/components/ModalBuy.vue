<template>
    <div @click="kek" id="kek">
      <div class="u-align-center u-container-style u-custom-color-7 u-dialog u-radius-10 u-shape-round u-dialog-1">
        <div class="u-container-layout u-container-layout-1">
          <h6 class="u-custom-font u-font-ubuntu u-text u-text-default u-text-white u-text-1">Buy nft</h6>
          <h5 class="u-custom-font u-font-ubuntu u-text u-text-grey-40 u-text-2">Select a chain in which you want to buy and receive the NFT</h5>
          <a href="https://nicepage.com/templates" class="u-border-2 u-border-custom-color-3 u-border-hover-grey-40 u-btn u-btn-round u-button-style u-none u-radius-10 u-text-custom-color-3 u-text-hover-grey-40 u-btn-1">router</a>
          <a href="https://nicepage.com/templates" class="u-border-2 u-border-grey-40 u-border-hover-custom-color-3 u-btn u-btn-round u-button-style u-none u-radius-10 u-text-grey-40 u-text-hover-custom-color-3 u-btn-2">mumbai</a>
          <h6 class="u-custom-font u-font-ubuntu u-text u-text-3">Price: $292</h6>
          <a href="https://nicepage.com/templates" class="u-border-2 u-border-custom-color-3 u-border-hover-palette-2-light-2 u-btn u-btn-round u-button-style u-none u-radius-10 u-text-custom-color-3 u-text-hover-palette-2-light-2 u-btn-3">Buy</a>
        </div><button class="u-dialog-close-button u-icon u-text-grey-50 u-icon-1"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 413.348 413.348" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-5801"></use></svg><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" xml:space="preserve" class="u-svg-content" viewBox="0 0 413.348 413.348" id="svg-5801"><path d="m413.348 24.354-24.354-24.354-182.32 182.32-182.32-182.32-24.354 24.354 182.32 182.32-182.32 182.32 24.354 24.354 182.32-182.32 182.32 182.32 24.354-24.354-182.32-182.32z"></path></svg></button>
      </div>
    </div>
</template>

<script>
export default {
  name: 'ModalBuy',
  methods: {
    kek() {
        console.log('1')
    }
}
}
</script>

<style scoped>

#kek{
    position: absolute;
    top: 0;
    height: 100%;
    width: 100vw;
    z-index: 0;
    display: flex;
    justify-content: center;
    align-items:flex-start;
    text-align: center;
    background: rgba(0, 0, 0, .7)
}

 .u-dialog-1 {
  width: 566px;
  min-height: 463px;
  margin-block-start: 15%;
}

 .u-container-layout-1 {
  padding: 40px 30px;
}

 .u-text-1 {
  text-transform: uppercase;
  letter-spacing: 5px;
  margin: 0 auto;
}

 .u-text-2 {
  font-weight: 400;
  margin: 23px 0 0;
}

 .u-btn-1 {
  border-style: solid;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0px;
  margin: 23px auto 0 110px;
}

 .u-btn-2 {
  border-style: solid;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0px;
  margin: -49px auto 0 262px;
}

 .u-text-3 {
  font-weight: 400;
  width: 227px;
  margin: 127px auto 0;
}

 .u-btn-3 {
  border-style: solid;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0px;
  margin: 14px auto 0;
}

 .u-icon-1 {
  width: 15px;
  height: 15px;
  left: auto;
  top: 17px;
  position: absolute;
  right: 16px;
}

@media (max-width: 1199px) {
   .u-dialog-1 {
    height: auto;
  }

   .u-text-3 {
    width: 227px;
  }
}

@media (max-width: 991px) {
   .u-container-layout-1 {
    padding-bottom: 30px;
  }
}

@media (max-width: 767px) {
   .u-dialog-1 {
    width: 540px;
  }

   .u-container-layout-1 {
    padding-top: 30px;
    padding-left: 40px;
    padding-right: 40px;
  }

   .u-btn-1 {
    margin-left: 87px;
  }

   .u-btn-2 {
    margin-left: 239px;
  }
}

@media (max-width: 575px) {
   .u-dialog-1 {
    width: 340px;
  }

   .u-container-layout-1 {
    padding-top: 40px;
    padding-left: 25px;
    padding-right: 25px;
  }

   .u-btn-1 {
    margin-left: auto;
  }

   .u-btn-2 {
    margin-top: 14px;
    margin-left: auto;
  }

   .u-text-3 {
    margin-top: 64px;
  }
}
</style>