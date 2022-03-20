<template lang="html">
  <span :class="[ 'chip', { 'chip--selected':selected} ]">
    <span class="block w-full text-center"><slot /></span>
  </span>
</template>

<script>
export default {
  name: 'Chips',
  props: {
    type: {
      type: String,
      require: false,
      default: 'button',
    },
    selected: {
      type: Boolean,
      require: false,
      default: false,
    },
    style: {
      type: String,
      require: false,
      default: 'mb-1',
    },
  },
  data() {
    return {
      test: true,
    };
  },
};
</script>

<style lang="css" scoped>
</style>
