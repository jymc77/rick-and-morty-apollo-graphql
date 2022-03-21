<template lang="html">
  <div class="container max-w-7xl mx-auto px-2">
    <div class="w-full mb-5 md:mb-8">
      <search-characters @filters="search($event)" />
    </div>

    <div
      ref="results-area"
      class="mx-auto"
    >
      <div
        v-if="result.info"
        class="flex justify-between mb-6 text-sm gap-6"
      >
        <p class="">
          Characters
          <span class="text-indigo-600 font-bold">{{ firstCharacterPosition }}</span> to
          <span class="text-indigo-600 font-bold">{{ lastCharacterPosition }}</span> of
          <span class="text-indigo-600 font-bold">{{ result.info.count }}</span> charaters found
        </p>
        <p class="text-sm text-right text-gray-700 text-center grow-0 w-36">
          {{ `Page ${page} of ${result.info.pages}` }}
        </p>
      </div>
      <loader v-if="loading" />
      <list-characters
        v-else-if="searchInit"
        :characters="result.characters"
      />
      <pagination
        v-if="result.info"
        :page="page"
        :pages="result.info.pages"
        @page="onPageChange($event)"
      />
    </div>
  </div>
</template>

<script>
import { ApolloClient, InMemoryCache, gql } from '@apollo/client';
import Loader from '@/components/Loader.vue';
import SearchCharacters from '@/components/SearchCharacters.vue';
import ListCharacters from '@/components/ListCharacters.vue';
import Pagination from '@/components/Pagination.vue';

const cache = new InMemoryCache();

const client = new ApolloClient({
  cache,
  uri: 'https://rickandmortyapi.com/graphql',
});

export default {
  name: 'PageSearch',
  components: {
    SearchCharacters,
    ListCharacters,
    Pagination,
    Loader,
  },
  data() {
    return {
      loading: false,
      searchInit: false,
      result: {
        characters: [],
        info: null,
      },
      page: 1,
      filtersString: '',
    };
  },
  computed: {
    firstCharacterPosition() {
      return this.page * 20 - 19;
    },
    lastCharacterPosition() {
      return this.firstCharacterPosition + this.result.characters.length - 1;
    },
  },
  methods: {
    generateFiltersString(filters) {
      this.filtersString = filters
        ? Object.keys(filters).reduce((acc, filterName) => {
          // eslint-disable-next-line
            acc += `${filterName}: "${filters[filterName]}",`;
          return acc;
        }, '').replace(/,$/, '')
        : '';
    },
    getCharacters(page = 1) {
      this.page = page;
      const filters = this.filtersString ? `, filter: {${this.filtersString}}` : '';

      client.query({
        query: gql`{
        characters(page: ${page}${filters}) {
          info {
            count
            pages
          }
          results {
            id
            created
            episode {
              name
              episode
            }
            gender
            image
            location {
              name
              dimension
              type
            }
            name
            origin {
              name
            }
            species
            status
            type
          }
        }
      }`,
      }).then((response) => {
        this.result.characters = response.data.characters.results;
        this.result.info = response.data.characters.info;
        this.loading = false;
        this.searchInit = true;

        const element = this.$refs['results-area'];
        const top = element.offsetTop - 20;
        this.$nextTick(() => {
          window.scrollTo({ top, behavior: 'smooth' });
        });
      }).catch((e) => {
        if (e.message === '404: Not Found') {
          this.result.characters = [];
          this.result.info = null;
        }
      });
    },
    search(filters) {
      this.result.charaters = [];
      this.result.info = null;
      this.loading = true;
      this.generateFiltersString(filters);
      this.getCharacters();
    },
    onPageChange(page) {
      this.getCharacters(page);
    },
  },
};
</script>

<style lang="css" scoped>
</style>
