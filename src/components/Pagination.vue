<template>
  <div class="pagination my-6">
    <div class="flex-1 flex justify-between sm:hidden">
      <a
        href="#"
        class="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50"
      > Previous </a>
      <a
        href="#"
        class="ml-3 relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50"
      > Next </a>
    </div>
    <div class="hidden sm:block">
      <div class="sm:flex-1 sm:flex sm:items-center sm:justify-between">
        <nav
          class="relative mx-auto z-0 inline-flex rounded-md shadow-sm -space-x-px"
          aria-label="Pagination"
        >
          <button
            :disabled="page === firstPage"
            class="relative inline-flex items-center px-2 py-2 rounded-l-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50 disabled:text-gray-300 disabled:hover:bg-white"
            @click="$emit('page', 1)"
          >
            <span class="sr-only">Previous</span>
            <span class="h-5 w-5">{{ '<<' }}</span>
          </button>
          <button
            :disabled="page === firstPage"
            class="relative inline-flex items-center px-2 py-2 border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50 disabled:text-gray-300 disabled:hover:bg-white"
            @click="$emit('page', page - 1)"
          >
            <span class="sr-only">Previous</span>
            <span class="h-5 w-5">{{ '<' }}</span>
          </button>
          <button
            v-for="i in Math.min(pages, 7)"
            :key="i"
            :class="`${(i + firstPage - 1 === page) ? 'z-10 bg-indigo-50 border-indigo-500 text-indigo-600' : 'bg-white border-gray-300 text-gray-500 hover:bg-gray-50'} relative inline-flex items-center px-4 py-2 border text-sm font-medium`"
            @click="$emit('page', i + firstPage - 1)"
          >
            {{ i + firstPage - 1 }}
          </button>
          <button
            :disabled="page === pages"
            class="relative inline-flex items-center px-2 py-2 border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50 disabled:text-gray-300 disabled:hover:bg-white"
            @click="$emit('page', page + 1)"
          >
            <span class="sr-only">Next</span>
            <span class="h-5 w-5">{{ '>' }}</span>
          </button>
          <button
            :disabled="page === pages"
            class="relative inline-flex items-center px-2 py-2 rounded-r-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50 disabled:text-gray-300 disabled:hover:bg-white"
            @click="$emit('page', pages)"
          >
            <span class="sr-only">Last</span>
            <span class="h-5 w-5">{{ '>>' }}</span>
          </button>
        </nav>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Pagination',
  props: ['page', 'pages'],
  computed: {
    firstPage() {
      if (this.page > 4) {
        const restPages = this.pages - this.page;
        return restPages < 3 ? this.page - (6 - restPages) : this.page - 3;
      }

      return 1;
    },
  },
};
</script>

<style lang="css" scoped>
</style>
