<template>
  <div :class="$style.root">
    <aside :class="$style.aside">
      <Title />
      <Navigation :items="navItems" v-model="activeImageType" />
    </aside>
    <main>
      <Grid :images="visibleImages" />
    </main>
  </div>
</template>

<script lang="ts">
import { defineComponent, ref, computed } from "vue";
import Grid from "@/components/Grid.vue";
import Navigation from "@/components/Navigation.vue";
import Title from "@/components/Title.vue";
import images from "./images.json";

export default defineComponent({
  name: "App",
  components: { Grid, Navigation, Title },
  setup() {
    const navItems = ["All", ...images.map(({ type }) => type)];
    const activeImageType = ref("");
    const visibleImages = computed(() => {
      const visibleType = images.find(
        ({ type }) => type === activeImageType.value
      );
      const allImages = images.flatMap(({ items }) => items);

      return visibleType ? visibleType.items : allImages;
    });

    return {
      visibleImages,
      navItems,
      activeImageType,
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
