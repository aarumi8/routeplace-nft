<template>
    <body class="u-body">
        <header class="u-clearfix u-custom-color-7 u-header u-header" id="sec-d964"><div class="u-clearfix u-sheet u-sheet-1">
            <a @click='connectWalletBtn' class="u-border-2 u-border-custom-color-3 u-border-hover-palette-2-light-1 u-btn u-btn-round u-button-style u-custom-font u-font-ubuntu u-none u-radius-10 u-text-custom-color-3 u-text-hover-palette-2-light-1 u-btn-1">{{this.btnLabel}}</a>
            <p class="u-custom-font u-font-ubuntu u-text u-text-custom-color-3 u-text-1">
            <a href='/'><span class="u-text-white">Route</span>Place</a>
            </p>
            <form action="#" method="get" class="u-border-1 u-border-grey-80 u-expanded-width-xs u-radius-10 u-search u-search-left u-search-1">
            <button class="u-search-button" type="submit">
                <span class="u-search-icon u-spacing-10">
                <svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 56.966 56.966"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-aebd"></use></svg>
                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="svg-aebd" x="0px" y="0px" viewBox="0 0 56.966 56.966" style="enable-background:new 0 0 56.966 56.966;" xml:space="preserve" class="u-svg-content"><path d="M55.146,51.887L41.588,37.786c3.486-4.144,5.396-9.358,5.396-14.786c0-12.682-10.318-23-23-23s-23,10.318-23,23  s10.318,23,23,23c4.761,0,9.298-1.436,13.177-4.162l13.661,14.208c0.571,0.593,1.339,0.92,2.162,0.92  c0.779,0,1.518-0.297,2.079-0.837C56.255,54.982,56.293,53.08,55.146,51.887z M23.984,6c9.374,0,17,7.626,17,17s-7.626,17-17,17  s-17-7.626-17-17S14.61,6,23.984,6z"></path></svg>
                </span> 
            </button>
            <input class="u-custom-font u-font-ubuntu u-search-input u-search-input-1" type="search" name="search" value="" placeholder="Search">
            </form>
        </div>
        </header>
      </body>
</template>

<script>
import Web3 from 'web3';

export default {
  name: 'Header',
  data() {
    return {
      web3: null,
      btnLabel: 'CONNECT'
    }
  },
  created() {
    try {
      if(window.ethereum.selectedAddress) {
        this.btnLabel = 'PROFILE'
      } else {
        this.btnLabel = 'CONNECT'
      }
    } catch (err) {
      console.log(err)
      this.btnLabel = 'CONNECT'
    }
  },
  methods: {
    async connectWalletBtn() {
      try {
        if(window.ethereum.selectedAddress) {
          window.location.href='/profile'
        } else {
          if(await this.connectWallet()) {
            this.btnLabel = 'PROFILE'
          }
        }
      } catch (err) {
        alert('No walelt detected. Please, install MetaMask')
        console.log(err)
      }
    },
    async connectWallet() {
        if(window.ethereum) {
            try {
                // Request account access
                // We don't know window.web3 version, so we use our own instance of Web3
                // with the injected provider given by MetaMask
                await window.ethereum.enable();
                this.web3 = new Web3(window.ethereum);
                console.log(window.ethereum.selectedAddress)
                return true
            } catch (error) {
                // User denied account access...
                console.error("User denied account access")
                //alert('Error! You denied account access')
            }
        }
        // Legacy dapp browsers...
        else if (window.web3) {
            this.web3 = new Web3(window.web3.currentProvider);
            // Acccounts always exposed
            console.log(`Connected with the account: ${window.web3.currentProvider.selectedAddress}`);
            return true
        }
        // Non-dapp browsers...
        else {
            console.log('Non-Ethereum browser detected. You should consider trying MetaMask!');
            alert('No wallet detected. Please, install MetaMask')
        }

        return false
      },
  }
}
</script>

<style> 
a, a:visited, a:hover, a:active {
  color: unset !important;
}
</style>