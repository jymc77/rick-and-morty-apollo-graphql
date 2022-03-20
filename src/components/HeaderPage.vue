<template>
  <header>
    <nav class="bg-black py-2 md:py-4">
      <div class="container px-4 mx-auto md:flex md:items-center">
        <div class="flex justify-between items-center">
          <a
            href="#"
            class="font-bold text-xl text-indigo-600"
          >
            <img
              alt="Vue logo"
              class="block h-8 w-auto sm:h-12"
              src="../assets/Rick_and_Morty_logo.webp"
              width="150px"
              height="50px"
            >
          </a>
          <button
            type="button"
            aria-label="open menu"
            id="navbar-toggle"
            class="bg-indigo-600 border border-solid border-gray-300 px-3 py-1 rounded text-gray-600 opacity-50 hover:opacity-75 md:hidden"
          >
            <i class="fas fa-bars" />
          </button>
        </div>

        <div
          id="navbar-collapse"
          class="hidden md:flex flex-col md:flex-row md:ml-auto mt-3 md:mt-0"
        >
          <a
            href="#"
            class="p-2 lg:px-4 md:mx-2 text-gray-300 font-medium rounded hover:bg-gray-200 hover:text-gray-700 transition-colors duration-300"
          >Home</a>
          <a
            href="#"
            class="p-2 lg:px-4 md:mx-2 text-white font-medium rounded bg-indigo-600"
          >Characters</a>
          <a
          href="#"
          class="p-2 lg:px-4 md:mx-2 text-gray-300 font-medium rounded hover:bg-gray-200 hover:text-gray-700 transition-colors duration-300"
          >Locations</a>
          <a
          href="#"
          class="p-2 lg:px-4 md:mx-2 text-gray-300 font-medium rounded hover:bg-gray-200 hover:text-gray-700 transition-colors duration-300"
          >Episodes</a>
        </div>
      </div>
    </nav>
  </header>
</template>

<script>
export default {
  name: 'HeaderPage',
};
</script>

<style lang="css" scoped>
</style>
