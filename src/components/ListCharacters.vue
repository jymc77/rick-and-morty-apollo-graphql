<template lang="html">
  <div class="sm:grid sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-4 sm:gap-2 md:gap-6">
    <template v-if="!characters || characters.length === 0">
      <p class="text-gray-500 text-center sm:col-span-2 md:col-span-3 lg:col-span-4 xl:col-span-4">No character found...</p>
    </template>
    <div
      v-for="character in characters"
      :key="character.id"
      class="w-full rounded-lg shadow-2xl bg-white opacity-75 mb-2"
    >
      <div class="p-4 md:p-6 lg:text-left flex flex-col h-full">
        <!--Img Col-->
        <div class="flex sm:block">
          <div class="w-1/4 sm:w-1/2 lg:w-2/5 mr-5 sm:mx-auto sm:mb-4 rounded overflow-hidden shadow-2xl">
            <img
              alt="personnage"
              :src="character.image"
              class="rounded-none lg:rounded-lg "
            >
          </div>
          <h2 class="text-1xl font-bold sm:my-2 text-center">
            {{ character.name }}
          </h2>
        </div>
        <div class="my-2 mx-auto lg:mx-0 w-4/5 border-b-2 border-teal-500 opacity-25" />
        <p class="text-sm flex items-center justify-center sm:justify-start">
          <template v-if="character.status !== 'unknown'">
            <span :class="`inline-block w-3 h-3 bg-green-500 rounded-full mr-2 ${ character.status === 'Alive' ? 'bg-green-500' : 'bg-red-500'}`" />
            {{ character.status }}
          </template>
          <template v-else>
            <span class="inline-block w-3 h-3 bg-green-500 rounded-full mr-2 bg-gray-500" />
            Unknown
          </template>
        </p>
        <p class="text-sm flex items-start justify-center sm:justify-start">
          <span class="text-gray-600 mr-2 whitespace-nowrap w-[70px]">Species :</span>
          <span class="truncate">{{ character.species }}</span>
        </p>
        <p class="text-sm flex items-start justify-center sm:justify-start" v-if="character.type">
          <span class="text-gray-600 mr-2 whitespace-nowrap w-[70px]">Type :</span>
          <span class="truncate">{{ character.type }}</span>
        </p>
        <p class="text-sm flex items-start justify-center sm:justify-start">
          <span class="text-gray-600 mr-2 whitespace-nowrap w-[70px]">Gender :</span>
          <span class="truncate">{{ character.gender }}</span>
        </p>
        <p class="text-sm flex items-start justify-center sm:justify-start">
          <span class="text-gray-600 mr-2 whitespace-nowrap w-[70px]">Origine : </span>
          <a
            :href="character.origin.url"
            target="_blank"
            class="truncate"
          >{{ character.origin.name }}</a>
        </p>
        <p class="text-sm flex items-start justify-center sm:justify-start mb-4 sm:mb-8">
          <span class="text-gray-600 mr-2 whitespace-nowrap w-[70px]">Location : </span>
          <span class="truncate">{{ character.location.name}}</span>
        </p>
        <p class="mt-auto text-xs sm:text-sm self-end">
          <span v-if="character.episode.length > 1">
            {{ character.name }} appears in {{ character.episode.length }} episodes and is first
            seen in episode {{ character.episode[0].episode }}.
          </span>
          <span v-else>
            {{ character.name }} appears in only 1 episode ({{ character.episode[0].episode }}).
          </span>
        </p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ListCharacters',
  props: {
    characters: {
      type: Array,
      require: false,
      default: () => [],
    },
  },
};
</script>

<style lang="css" scoped>
</style>
