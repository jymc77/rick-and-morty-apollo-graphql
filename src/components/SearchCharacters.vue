<template lang="html">
  <img
    class="w-1/2 sm:w-1/4 mx-auto relative z-2"
    alt="Rick and Morty"
    src="../assets/rick-and-morty.webp"
    width="315px"
    height="225px"
  >
  <div class="p-4 -mt-[60px] sm:-mt-[100px] bg-white shadow-sm rounded block overflow-hidden">
    <header class="bg-black h-[70px] sm:h-[120px] -m-4 mb-6 sm:mb-12"></header>
    <div class="sm:px-3 md:px-12">
      <form
        action=""
        @submit.prevent="validate"
      >
        <div class="grid md:grid-cols-2 gap-2 sm:gap-6">
        <!-- <div class="grid md:grid-cols-2 gap-2 sm:gap-6"> -->
          <div class="sm:pr-6">
            <p class="text-xl mb-2 text-indigo-600">
              Filter by :
            </p>
            <div
              v-for="option in filters.main.options"
              :key="option"
              class="flex items-center mb-6 "
            >
              <span class="text-sm capitalize block mr-2 flex items-center min-w-[80px]">
                {{ option }}
              </span>
              <label
                class="block text-gray-700 text-sm font-bold grow"
                :for="`${option}-input`"
              >
                <input
                  :id="`${option}-input`"
                  v-model="filters.main.values[option]"
                  class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                  type="text"
                  :placeholder="`${option} contains ...`"
                >
              </label>
            </div>
          </div>
          <div class="filters gap-4">
            <p class="text-xl mb-2 text-indigo-600 invisible hidden sm:block">
              Other :
            </p>
            <div
              v-for="filter in filters.other"
              :key="filter.name"
              class="relative flex mb-4 items-start md:items-center"
            >
              <span class="text-sm capitalize block mr-2 flex items-center min-w-[80px]">{{ filter.name }}</span>
              <div class="flex flex-wrap items-center gap-2">
                <label
                  v-for="option in filter.options"
                  :key="option"
                  class="grow sm:grow-0"
                  :for="`${option}-${filter.name}`"
                >
                  <input
                    :id="`${option}-${filter.name}`"
                    v-model="filter.radio"
                    type="radio"
                    class="hidden"
                    :name="filter.name"
                    :value="option"
                  >
                  <chips
                    type="button"
                    class="w-full m-0 capitalize"
                  >
                    {{ option }}
                  </chips>
                </label>
              </div>
            </div>
          </div>
        </div>
        <div class="actions flex flex-wrap items-center justify-end mt-4 gap-4">
          <button
            :disabled="!dirtyForm"
            aria-label="Reset form"
            class="btn disabled:bg-gray-300 disabled:hover:bg-gray-300 w-full sm:w-auto"
            type="button"
            @click="reset()"
          >
            Reset
          </button>
          <button
            aria-label="Valid form"
            class="btn w-full sm:w-auto"
            type="submit"
          >
            Search
          </button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import Chips from '@/components/ui/Chips.vue';

export default {
  name: 'SearchCharacters',
  components: { Chips },
  props: {
  },
  data() {
    return {
      filters: {
        main: {
          options: ['name', 'species', 'type'],
          values: {},
        },
        other: [
          {
            name: 'status',
            options: ['all', 'alive', 'dead', 'unknown'],
            radio: 'all',
          },
          {
            name: 'gender',
            options: ['all', 'Female', 'Male', 'Genderless', 'unknown'],
            radio: 'all',
          },
        ],
      },
    };
  },
  computed: {
    dirtyForm() {
      return Object.keys(this.filters.main.values).some((val) => this.filters.main.values[val])
        || this.filters.other.some((o) => o.radio !== 'all');
    },
  },
  methods: {
    validate() {
      const filters = {};
      Object.keys(this.filters.main.values).forEach((filter) => {
        const val = this.filters.main.values[filter];
        if (val) {
          filters[filter] = val;
        }
      });

      this.filters.other.forEach((filter) => {
        if (filter.radio !== 'all') {
          filters[filter.name] = filter.radio;
        }
      });

      this.$emit('filters', filters);
    },
    reset() {
      this.filters.main.values = {};
      this.filters.other[0].radio = 'all';
      this.filters.other[1].radio = 'all';
    },
  },
};
</script>

<style lang="css" scoped>
</style>
