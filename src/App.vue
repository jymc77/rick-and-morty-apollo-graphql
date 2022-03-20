<template>
  <div class="flex flex-col h-screen scroll-smooth">
    <header-page />
    <div class="bg-indigo-100 py-3 md:py-6 grow">
      <page-search />
    </div>
  </div>
</template>

<script>
import HeaderPage from './components/HeaderPage.vue';
import PageSearch from './pages/PageSearch.vue';

export default {
  name: 'App',
  components: {
    HeaderPage,
    PageSearch,
  },
};
</script>

<style lang="css">
</style>
