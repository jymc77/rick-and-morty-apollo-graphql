<template>
  <div
    class="loading flex flex-col justify-center"
  >
    <div class="loader animate-spin ease-linear rounded-full border-4 border-t-4 border-indigo-200 border-t-indigo-600 h-10 w-10 mb-4 mx-auto" />
    <h2 class="text-center text-indigo-600 text-xl">
      {{ msg }}
    </h2>
  </div>
</template>

<script>
export default {
  name: 'Loader',
  props: {
    msg: {
      type: String,
      require: false,
      default: 'Loading...',
    },
  },
};
</script>

<style lang="css" scoped>
</style>
