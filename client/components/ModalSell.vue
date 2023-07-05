<template>
  <div @click="kek" id="kek1">
    <div
      class="u-align-center u-container-style u-radius-10 u-custom-color-7 u-dialog u-dialog-1"
    >
      <div class="u-container-layout u-valign-top u-container-layout-1">
        <h6 class="u-text u-text-1">List for sale</h6>
        <div class="u-form u-form-1">
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
          class="u-border-2 u-border-custom-color-3 u-border-hover-palette-2-light-2 u-btn u-btn-round u-button-style u-custom-font u-font-ubuntu u-none u-radius-10 u-text-custom-color-3 u-text-hover-palette-2-light-2 u-btn-2"
          >List</a
        >
      </div>
      <button
        @click="close"
        class="u-dialog-close-button u-icon u-text-grey-50 u-icon-1"
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
</template>

<script>
import Web3 from 'web3';
import axios from 'axios';

export default {
  name: "ModalSell",
  data() {
    return {
      metadata: null
    }
  },
  props: {
    metadata: {
      type: String
    }
  },
  methods: {
    kek() {
      console.log("1");
    },
    close() {
      var kek1 = document.querySelector("#kek1");
      kek1.style.zIndex = 0;
    },
  },
};
</script>

<style scoped>
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

.u-dialog-1 {
  width: 566px;
  min-height: 431px;
  margin: 60px auto;
}

.u-container-layout-1 {
  padding: 40px 30px;
}

.u-text-1 {
  text-transform: uppercase;
  letter-spacing: 5px;
  width: 254px;
  margin: 0 auto;
}

.u-form-1 {
  height: 124px;
  width: 380px;
  margin: 93px auto 0;
}

.u-btn-2 {
  border-style: solid;
  text-transform: uppercase;
  letter-spacing: 0px;
  font-weight: 700;
  margin: 65px auto 0;
}

.u-icon-1 {
  width: 15px;
  height: 15px;
  left: auto;
  top: 17px;
  position: absolute;
  right: 16px;
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
}

@media (max-width: 575px) {
  .u-dialog-1 {
    width: 340px;
    height: auto;
  }

  .u-container-layout-1 {
    padding-top: 40px;
    padding-left: 8px;
    padding-right: 8px;
  }

  .u-form-1 {
    height: 122px;
    width: 307px;
    margin-top: 94px;
  }

  .u-btn-2 {
    margin-top: 65px;
  }
}
</style>