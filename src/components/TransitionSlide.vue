<template>
  <transition :name="`slide-${direction}`" v-bind="$attrs">
    <slot></slot>
  </transition>
</template>

<script lang="ts">
import { defineComponent } from "vue";

export default defineComponent({
  name: "TransitionSlide",
  props: {
    direction: {
      required: false,
      default: "next",
    },
  },
});
</script>

<style>
.slide-prev-enter-active,
.slide-prev-leave-active,
.slide-next-enter-active,
.slide-next-leave-active {
  transition: transform 0.3s ease-out;
}

.slide-prev-leave-to,
.slide-next-enter-from {
  transform: translateX(100%);
}

.slide-prev-enter-from,
.slide-next-leave-to {
  transform: translateX(-100%);
}
</style>
