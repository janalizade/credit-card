<template>
  <v-container class="main-container">
    <div><v-btn @click="findMaxOdd(arr)"> sum</v-btn></div>
    <div><v-btn @click="filterString(str)"> text</v-btn></div>

    <creditCard />
  </v-container>
</template>

<script>
import creditCard from "../components/credit-card.vue";

export default {
  components: {
    creditCard,
  },
  data() {
    return {
      arr: [61, 32, 51],
      str: "iiikigggg",
    };
  },
  mounted() {},
  methods: {
    findMaxOdd(arr) {
      arr = new Uint8Array(arr);
      // Here min_odd is the minimum odd number
      // (in absolute terms). Initializing with
      // max value of int .
      let min_odd = Number.MAX_VALUE;

      let isOdd = false;

      let sum = 0;

      [...arr].map((item, i) => {
        i + 1;
        {
          if (item > 0) sum = sum + item;

          if (item % 2 != 0) {
            isOdd = true;
            if (min_odd > Math.abs(item)) min_odd = Math.abs(item);
          }
        }

        // If there was no odd number
        if (isOdd == false) return -1;

        // Now, sum will be either odd or even.
        // If even, changing it to odd.
        // As, even - odd = odd.
        // since m is the minimum odd
        // number(absolute).
        if (sum % 2 == 0) sum = sum - min_odd;

        return sum;
      });
      alert(sum);
    },

    filterString(s) {
      const res = [s.charAt(0), s.charAt(1)];

      for (let i = 2; i < s.length; ++i) {
        if (
          s.charAt(i) !== s.charAt(i - 1) ||
          s.charAt(i) !== s.charAt(i - 2) ||
          s.charAt(i) !== s.charAt(i - 3)
        ) {
          res.push(s[i]);
        }
      }
      alert(res.join(""));
      return res.join("");
    },
  },
};
</script>
