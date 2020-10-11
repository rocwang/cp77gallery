<template>
  <div :class="$style.root">
    <aside :class="$style.aside">
      <Title />
      <Navigation :items="navItems" v-model="activeImageType" />
    </aside>
    <main>
      <Grid :images="visibleImages" @select="setActiveImage" />
    </main>
  </div>
  <Slider
    :images="visibleImages"
    v-model="activeImgIdx"
    v-if="activeImgIdx !== undefined"
  />
</template>

<script lang="ts">
import { defineComponent, ref, computed } from "vue";
import Grid from "@/components/Grid.vue";
import Navigation from "@/components/Navigation.vue";
import Title from "@/components/Title.vue";
import Slider from "@/components/Slider.vue";
import images from "./images.json";

export default defineComponent({
  name: "App",
  components: { Grid, Navigation, Title, Slider },
  setup() {
    const navItems = ["All", ...images.map(({ type }) => type)];
    const activeImageType = ref("All");
    const activeImgIdx = ref(undefined as Number | undefined);
    const visibleImages = computed(() => {
      const visibleType = images.find(
        ({ type }) => type === activeImageType.value
      );
      const allImages = images.flatMap(({ items }) => items);

      return visibleType ? visibleType.items : allImages;
    });
    const setActiveImage = (i: Number | undefined) => (activeImgIdx.value = i);

    return {
      visibleImages,
      navItems,
      activeImgIdx,
      activeImageType,
      setActiveImage,
    };
  },
});
</script>

<style module>
.root {
  background-color: var(--color-cp77-black);
  color: var(--color-cp77-white);
  font-family: cyberpunk, system-ui, sans-serif;
  display: grid;
  grid-template:
    "aside main" auto
    / 320px 1fr;
  min-height: 100vh;
}

.aside {
  background-color: var(--color-cp77-yellow);
}
</style>
