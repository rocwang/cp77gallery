<template>
  <div :class="$style.root">
    <a
      v-for="(i, k) in resizedImages"
      :key="k"
      :href="i.big"
      :class="$style.link"
      @click.prevent="$emit('select', k)"
    >
      <img
        :src="i.src"
        :srcset="i.srcset"
        :alt="i.caption"
        loading="lazy"
        :class="$style.img"
      />
    </a>
  </div>
</template>

<script lang="ts">
import { defineComponent, computed, PropType } from "vue";
import { path, srcsetByDensity } from "@/image.ts";

export default defineComponent({
  name: "Grid",
  props: {
    images: {
      type: Array as PropType<{ target: string; caption: string }[]>,
      required: true,
    },
  },
  setup(props) {
    const resizedImages = computed(() =>
      props.images.map((i) => ({
        ...i,
        big: path(i.target, 1440),
        src: path(i.target, 200),
        srcset: srcsetByDensity(i.target, [200, 400, 600, 800, 1000]),
      }))
    );

    return {
      resizedImages,
    };
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
