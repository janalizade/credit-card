<template>
  <div align="center">
    <div class="card mx-auto my-1">
      <div class="card__front card__part">
        <v-row>
          <v-img class=" card__square" src="../../src/assets/img/chip.png" />
          <!-- <v-img class="card__front-logo card__logo"
            src="../../src/assets/img/istockphoto-1215256045-612x612.jpg" /> -->
        </v-row>
        <transition name="fade">
          <span>

            <input class="mt-8 ml-4" v-model="person.cardNumber" style="color: #fff;width:200px"  placeholder="#### #### #### ####" v-mask="'#### **** **** ####'"  ref="cardNumber"/></span>
        </transition>
        <v-col cols="6" md="6" justify="center" align="center" class="card__space-75">
          <span class="card__label">Card holder</span>
          <span class="card__info">
            <input ref="cardName" class="pl-2" style="color: #fff; width: 120px;text-transform: uppercase;" placeholder="AD SOYAD" v-model="person.cardName"  />
          </span>
        </v-col>
        <v-col cols="6" md="6" justify="center" align="center" class="card__space-25">
          <span class="card__label">Expires</span>
          <div class="card__info" style="display: flex; flex: row">

            <input style="color: #fff; width: 20px" placeholder="MM" v-model="person.month" :class="[cardMonthSelected ? 'element__active' : 'element__inactive',]" />
            <div class="mt-2">/</div>
            <input style="color: #fff; width: 50px" placeholder="YY" v-model="person.year"  :class="[cardYearSelected ? 'element__active' : 'element__inactive',]" />
          </div>
        </v-col>
      </div>

      <div style="position: absolute" class="card__back card__part">
        <div class="card__black-line"></div>
        <div class="card__back-content">
          <div class="card__secret">
            <p class="card__secret--last">
              <input style="color: #aaa; width: 30px" placeholder="CVV" v-model="person.cvv" />
            </p>
          </div>
          <img class="card__back-square card__square" src="https://image.ibb.co/cZeFjx/little_square.png" />
          <img class="card__back-logo card__logo"
            src="https://www.fireeye.com/partners/strategic-technology-partners/visa-fireeye-cyber-watch-program/_jcr_content/content-par/grid_20_80_full/grid-20-left/image.img.png/1505254557388.png" />
        </div>
      </div>
    </div>
    <v-card class="mx-auto my-12" width="420">
      <v-card-actions>
        <v-form class="mt-6 ml-5" ref="form" v-model="form" lazy-validation>
         <div @click="selectedItem('cardNumber')">
            <BaseInput v-model="person.cardNumber" label="Card Number" /> 
          </div>
          <div @click="selectedItem('cardName')">
            <BaseInput v-model="person.cardName" label="Card Name" />
          </div>
          <v-row>
            <v-col class="mt-6">
              <div class="mb-3">Expire Date</div>
              <div style="display: flex; flex: row;">
               <div class="ml-9" @click="selectedItem('month')">
                  <v-select v-model="person.month" :items="months" :rules="[(v) => !!v || 'Month is required']" label="Month" style="width: 53px" required/>
               </div>       
               <div class="ml-4" @click="selectedItem('year')">
                <v-select v-model="person.year" :items="years" :rules="[(v) => !!v || 'Year is required']" label="Year" style="width: 72px"  required/>
               </div>
              </div>
            </v-col>
            <v-col cols="4" md="3">
              <div @click="selectedItem('cvv')">
                <BaseInput id="cvv" v-model="person.cvv" label="CVV" /> 
              </div>
            </v-col>
          </v-row>

          <div class="mt-5">
            <v-btn x-large color="primary" block dark> Submit </v-btn>
          </div>
        </v-form>
      </v-card-actions>
    </v-card>
  </div>
</template>
<script>
import BaseInput from "./BaseInput.vue" 
export default {
  components: { BaseInput},
  props: "person.year",
  data() {
    return {
      years: ["2024", "2023", "2022", "2021", "2020", "2019"],
      months: [
        "01",
        "02",
        "03",
        "04",
        "05",
        "06",
        "07",
        "08",
        "09",
        "10",
        "11",
        "12",
      ],
      person: {
        cardNumber: null,
        card: null,
        cardName: null,
        month: null,
        year: null,
        cvv: null,
      }
     
    };
  },
  methods: { 
    selectedItem(x) {
      this.$refs.cardNumber.style.border='none'
      this.$refs.cardName.style.border='none'
      this.$refs[x].style.border= "solid #FFF";
    }

  },
};
</script>
