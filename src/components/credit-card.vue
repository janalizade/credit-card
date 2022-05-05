<template>
  <div align="center">
    <div class="card mx-auto my-1">
      <div class="card__front card__part">
        <v-row>
          <img
            class="card__front-square card__square"
            src="https://image.ibb.co/cZeFjx/little_square.png" />
          <img
            class="card__front-logo card__logo"
            src="https://www.fireeye.com/partners/strategic-technology-partners/visa-fireeye-cyber-watch-program/_jcr_content/content-par/grid_20_80_full/grid-20-left/image.img.png/1505254557388.png"
        /></v-row>
        <transition name="fade">
          <span>
            <input
              v-model="person.cardNumber"
              style="margin-top: 50px; padding: 0px; color: #fff"
              :class="[
                cardNumberSelected ? 'element__active' : 'element__inactive',
              ]"
              placeholder="#### #### #### ####"
              v-mask="'#### **** **** ####'"
          /></span>
        </transition>
        <v-col
          cols="6"
          md="6"
          justify="center"
          align="center"
          class="card__space-75"
        >
          <span class="card__label">Card holder</span>
          <span class="card__info">
            <input
              style="
                color: #fff;
                padding-left: 18px;
                width: 120px;
                text-transform: uppercase;
              "
              placeholder="AD SOYAD"
              v-model="person.cardName"
              :class="[
                cardNameSelected ? 'element__active' : 'element__inactive',
              ]"
            />
          </span>
        </v-col>
        <v-col
          cols="6"
          md="6"
          justify="center"
          align="center"
          class="card__space-25"
        >
          <span class="card__label">Expires</span>
          <div class="card__info" style="display: flex; flex: row">
            <input
              style="color: #fff; width: 20px"
              placeholder="MM"
              v-model="person.month"
              :class="[
                cardMonthSelected ? 'element__active' : 'element__inactive',
              ]"
            />/<input
              style="color: #fff; width: 50px"
              placeholder="YY"
              @input="
                $emit('update:person.year', $event.target.value.slice(-2))
              "
              :value="person.year"
              :class="[
                cardYearSelected ? 'element__active' : 'element__inactive',
              ]"
            />
          </div>
        </v-col>
      </div>

      <div style="position: absolute" class="card__back card__part">
        <div class="card__black-line"></div>
        <div class="card__back-content">
          <div class="card__secret">
            <p class="card__secret--last">
              <input
                style="color: #aaa; width: 30px"
                placeholder="CVV"
                v-model="person.cvv"
              />
            </p>
          </div>
          <img
            class="card__back-square card__square"
            src="https://image.ibb.co/cZeFjx/little_square.png"
          />
          <img
            class="card__back-logo card__logo"
            src="https://www.fireeye.com/partners/strategic-technology-partners/visa-fireeye-cyber-watch-program/_jcr_content/content-par/grid_20_80_full/grid-20-left/image.img.png/1505254557388.png"
          />
        </div>
      </div>
    </div>
    <v-card class="mx-auto my-12" width="420">
      <v-card-actions>
        <v-form class="mt-6 ml-5" ref="form" v-model="form" lazy-validation>
          <v-text-field
            v-model="person.cardNumber"
            label="Card Number"
            outlined
            dense
            required
            autocomplete="off"
            @focus="
              cardNumberSelected = 1;
              cardNameSelected = 0;
              cardMonthSelected = 0;
              cardYearSelected = 0;
            "
            :rules="[(v) => !!v || 'cardNumber is required']"
           maxlength="19"
          ></v-text-field>

          <v-text-field
            v-model="person.cardName"
            id="cardName"
            label="Card Name"
            outlined
            dense
            required
            @focus="
              cardNameSelected = 1;
              cardNumberSelected = 0;
              cardMonthSelected = 0;
              cardYearSelected = 0;
            "
            :rules="[(v) => !!v || 'cardName is required']"
          ></v-text-field>
          <v-row>
            <v-col>
              <div>Expire Date</div>
              <div style="display: flex; flex: row; margin-top: 15px">
                <v-select
                  v-model="person.month"
                  :items="months"
                  :error-messages="errors"
                  :rules="[(v) => !!v || 'Month is required']"
                  label="Month"
                  required
                  @focus="
                    cardNameSelected = 0;
                    cardNumberSelected = 0;
                    cardMonthSelected = 1;
                    cardYearSelected = 0;
                  "
                  style="margin-left: 50px; width: 50px"
                ></v-select>
                <v-select
                  v-model="person.year"
                  :items="years"
                  :rules="[(v) => !!v || 'Year is required']"
                  label="Year"
                  style="width: 50px"
                  @focus="
                    cardNameSelected = 0;
                    cardNumberSelected = 0;
                    cardMonthSelected = 0;
                    cardYearSelected = 1;
                  "
                  required
                ></v-select>
              </div>
            </v-col>
            <v-col cols="4" md="3">
              <v-text-field
                id="cvv"
                v-model="person.cvv"
                label="CVV"
                style="margin-top: 45px; margin-left: 20px"
                outlined
                dense
                required
                @click="
                  cardNameSelected = 0;
                  cardNumberSelected = 0;
                  cardMonthSelected = 0;
                  cardYearSelected = 0;
                  cardCvv = 1;
                "
              ></v-text-field>
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
export default {
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
      },
      cardNumberSelected: 0,
      cardNameSelected: 0,
      cardMonthSelected: 0,
      cardYearSelected: 0,
      cardCvv: 0,
      isInputFocused: false,
    };
  },
  methods: {
    limit(element) {
      var max_chars = 2;
      if (
        arguments[1].char !== "\b" &&
        arguments[1].key !== "Left" &&
        arguments[1].key !== "Right"
      ) {
        if (element.value.length >= max_chars) {
          return false;
        } else if (isNaN(arguments[1].char)) {
          return false;
        }
      }
    },
  },
};
</script>
