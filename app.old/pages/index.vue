<template>
  <div>
    <b-navbar toggleable="md" type="dark" variant="secondary">
      <b-navbar-brand href="#">Registradora</b-navbar-brand>

      <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

      <b-collapse id="nav-collapse" is-nav>

        <!-- Right aligned nav items -->
        <b-navbar-nav class="ml-auto">
          <b-nav-item> <nuxt-link to="/">Novo</nuxt-link> </b-nav-item>
          <b-nav-item href="#">Listar</b-nav-item>
          <b-nav-item href="#" disabled>{{network}}</b-nav-item>
        </b-navbar-nav>

      </b-collapse>
    </b-navbar>

    <nuxt-view />
  </div>

  
</template>

<script>
import { ethers } from 'ethers'
import Listar from '../components/ListarRecebivel'
import Novo from '../components/NovoRecebivel'
import Registradora from '../../contract/build/contracts/Registradora.json'

export default {
  components: {
    
  },
  data() {
    return {
      provider: {},
      contract: {},
      listRecebiveis: []
    }  
  },
  props: {
    network: 'Not Connected'
  },
  created() {
    this.provider = new ethers.providers.Web3Provider(web3.currentProvider);
    this.provider.getNetwork().then(_network => this.network = _network);
  },
  mounted() {
    this.contract = new ethers.Contract('0xA2592F7f08fD21D0e7fD3610BC9427631B664E10', Registradora.abi, this.provider);
  },
  methods: {
    criar() {

    }

  }
}
</script>

<style>
.container {
  margin: 0 auto;
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
}

.container-top {
  margin-top: 0%;
}
.card-header {
  background-color: rgba(0, 0, 0, 0.000000001);
  border-bottom: 0px;
}
</style>
