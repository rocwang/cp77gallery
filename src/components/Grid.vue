<template>
  <div :class="$style.root">
    <a
      v-for="(i, k) in images"
      :key="k"
      :href="`/all_goodies/${i.path.replace(/\....$/, '.1440.webp')}`"
      :class="$style.link"
    >
      <img
        :src="`/all_goodies/${i.path.replace(/\....$/, '.300.webp')}`"
        :alt="i.caption"
        loading="lazy"
        :class="$style.img"
      />
    </a>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";

export default defineComponent({
  name: "Grid",
  props: {
    images: Array,
  },
});
</script>

<style module>
.root {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(160px, 1fr));
  gap: 0;
  place-items: stretch;
  justify-content: center;
}

.link {
  display: block;
  padding-top: 100%;
  position: relative;
}

.img {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
}
</style>
