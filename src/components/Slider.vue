<template>
  <div
    :class="$style.root"
    @keyup.right="next"
    @keyup.left="prev"
    @keyup.esc="close"
    ref="root"
    tabindex="0"
  >
    <TransitionSlide :direction="direction">
      <figure :class="$style.figure" :key="activeImage.path">
        <img
          :src="`/all_goodies/${activeImage.path.replace(
            /\....$/,
            '.1440.webp'
          )}`"
          :alt="activeImage.caption"
          :class="$style.image"
          ref="imageElement"
        />
        <figcaption :class="$style.figcaption">
          {{ activeImage.caption }}
        </figcaption>
      </figure>
    </TransitionSlide>

    <button
      type="button"
      :class="[$style.prev, $style.button]"
      @click="prev"
      v-if="images.length > 1"
    >
      &lt;
    </button>
    <button
      type="button"
      :class="[$style.next, $style.button]"
      @click="next"
      v-if="images.length > 1"
    >
      &gt;
    </button>
    <button type="button" :class="[$style.close, $style.button]" @click="close">
      &times;
    </button>
  </div>
</template>

<script lang="ts">
import { defineComponent, computed, ref, onMounted } from "vue";
import TransitionSlide from "@/components/TransitionSlide.vue";

export default defineComponent({
  name: "Slider",
  components: { TransitionSlide },
  props: {
    modelValue: {
      type: Number,
      required: true,
    },
    images: {
      type: Array,
      required: true,
    },
  },
  setup(props, context) {
    const activeImage = computed(() => props.images[props.modelValue]);
    const root = ref(null as HTMLElement | null);
    const imageElement = ref(null as HTMLElement | null);
    const direction = ref("next");

    const next = () => {
      direction.value = "next";
      context.emit(
        "update:modelValue",
        (props.modelValue + 1) % props.images.length
      );
    };
    const prev = () => {
      direction.value = "prev";
      context.emit(
        "update:modelValue",
        (props.modelValue + props.images.length - 1) % props.images.length
      );
    };
    const close = () => {
      direction.value = "next";
      context.emit("update:modelValue", undefined);
    };

    onMounted(function () {
      root.value?.focus();
    });

    return {
      activeImage,
      close,
      direction,
      imageElement,
      next,
      prev,
      root,
    };
  },
});
</script>

<style module>
.root {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  overflow: hidden;
  background-color: #000000ee;
  z-index: 10;
  outline: 0;
}

.figure {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  display: grid;
}

.image {
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: contain;
}

.figcaption {
  position: absolute;
  bottom: 15px;
  right: 15px;
  color: var(--color-cp77-yellow);
  font-family: cyberpunk, system-ui, sans-serif;
  font-size: 2rem;
}

.button {
  width: 50px;
  height: 50px;
  background-color: var(--color-cp77-yellow);
  display: grid;
  justify-content: center;
  align-content: center;
  font-size: 30px;
  position: absolute;
}

.button:active {
  transform: translate(1px, 1px);
}

.prev {
  left: 0;
  top: calc(50% - 25px);
  z-index: 20;
}

.next {
  right: 0;
  top: calc(50% - 25px);
  z-index: 20;
}

.close {
  top: 0;
  right: 0;
  z-index: 20;
}
</style>
